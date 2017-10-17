<?php

namespace app\controllers;

use app\components\MyHelper;
use app\models\PhiscalYear;
use app\models\Province;
use app\models\StatOfficerProvinceTrainDetail;
use Codeception\Util\HttpCode;
use Yii;
use app\models\StatOfficerProvinceTrain;
use app\models\StatOfficerProvinceTrainSearch;
use yii\db\Exception;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;

/**
 * StatOfficerProvinceTrainController implements the CRUD actions for StatOfficerProvinceTrain model.
 */
class StatOfficerProvinceTrainController extends Controller
{
    public $columns = [
        'tech_in_total', 'tech_in_women', 'tech_out_total', 'tech_out_women',
        'theo_in_total', 'theo_in_women', 'theo_out_total', 'theo_out_women',
    ];

    /**
     * @inheritdoc
     */
    public function behaviors()
    {
        return [
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'delete' => ['POST'],
                ],
            ],
        ];
    }

    /**
     * Lists all StatOfficerProvince models.
     * @return mixed
     */
    public function actionIndex()
    {
        return $this->render('index');
    }

    public function actionGet() {
    	$user = Yii::$app->user->identity;
    	$controller_id = Yii::$app->controller->id;
    	$acton_id = Yii::$app->controller->action->id;
    	if ($user->role ["name"] != Yii::$app->params ['DEFAULT_ADMIN_ROLE']) {
    		if (! AuthenticationService::isAccessibleAction ( $controller_id, $acton_id )) {
    			MyHelper::response ( HttpCode::UNAUTHORIZED, Yii::t ( 'app', 'HTTP Error 401- You are not authorized to access this operaton due to invalid authentication' ) . " with ID:  " . $controller_id . "/ " . $acton_id );
    			return;
    		}
    	}
    	
        $years = PhiscalYear::find()->where(['deleted' => 0])->asArray()->all();
        $provinces = Province::find()->where(['deleted' => 0])->orderBy('province_code')->asArray()->all();

        return json_encode([
            'years' => $years,
            'provinces' => $provinces,
        ]);
    }

    public function actionEnquiry($year) {
    	
    	$user = Yii::$app->user->identity;
    	$controller_id = Yii::$app->controller->id;
    	$acton_id = Yii::$app->controller->action->id;
    	if ($user->role ["name"] != Yii::$app->params ['DEFAULT_ADMIN_ROLE']) {
    		if (! AuthenticationService::isAccessibleAction ( $controller_id, $acton_id )) {
    			MyHelper::response ( HttpCode::UNAUTHORIZED, Yii::t ( 'app', 'HTTP Error 401- You are not authorized to access this operaton due to invalid authentication' ) . " with ID:  " . $controller_id . "/ " . $acton_id );
    			return;
    		}
    	}
    	
        $year = PhiscalYear::findOne($year);
        if(!isset($year)) {
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app', 'Inccorect Phiscal Year'));
            return;
        }

        $model = StatOfficerProvinceTrain::find()->where(['phiscal_year_id' => $year->id])->one();
        if(!isset($model)) {
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app', 'No Data'));
            return;
        }

        $models = Province::find()->alias('m')
            ->select('m.*, d.*')
            ->join('left join', 'stat_officer_province_train_detail d', 'd.province_id=m.id and d.stat_officer_province_train_id=:id', [':id' => $model->id])
            ->where(['deleted' => 0])->orderBy('m.province_code')->asArray()->all();

        $stat = StatOfficerProvinceTrainDetail::find()
            ->select([
                'stat_officer_province_train_id' => 'stat_officer_province_train_id',
                'tech_in_total' => 'sum(d.tech_in_total)',
                'tech_out_total' => 'sum(d.tech_out_total)',
                'theo_in_total' => 'sum(d.theo_in_total)',
                'theo_out_total' => 'sum(d.theo_out_total)',
            ])->alias('d')
            ->where(['d.stat_officer_province_train_id' => $model->id])
            ->asArray()->one();
        $data = null;
        if(isset($stat))
            if(isset($stat['stat_officer_province_train_id'])) {
                $percent = 100/($stat['tech_in_total']+$stat['tech_out_total']+$stat['theo_in_total']+$stat['theo_out_total']);
                $data = [
                    number_format($stat['tech_in_total'] * $percent,2),
                    number_format($stat['tech_out_total'] * $percent,2),
                    number_format($stat['theo_in_total'] * $percent,2),
                    number_format($stat['theo_out_total'] * $percent,2),
                ];
            }

        return json_encode([
            'models' => $models,
            'stat' => [
                'labels' => [
                    'ວິຊາສະເພາະ ພາຍໃນ'
                    ,'ວິຊາສະເພາະ ຕາງປະເທດ'
                    ,'ທິດສະດີ ພາຍໃນ'
                    ,'ທິດສະດີ ຕາງປະເທດ'
                ],
                'series' => "ສະຖິຕິພະນັກງານລັດຖະກອນຂັ້ນອົງການທຽບເທົ່າ ທີ່ໄປຝຶກອົບຮັມຢູ່ພາຍໃນ ແລະ ຕ່າງປະເທດ",
                'data' => $data
            ],
        ]);
    }

    public function actionInquiry($year, $province) {
    	
    	$user = Yii::$app->user->identity;
    	$controller_id = Yii::$app->controller->id;
    	$acton_id = Yii::$app->controller->action->id;
    	if ($user->role ["name"] != Yii::$app->params ['DEFAULT_ADMIN_ROLE']) {
    		if (! AuthenticationService::isAccessibleAction ( $controller_id, $acton_id )) {
    			MyHelper::response ( HttpCode::UNAUTHORIZED, Yii::t ( 'app', 'HTTP Error 401- You are not authorized to access this operaton due to invalid authentication' ) . " with ID:  " . $controller_id . "/ " . $acton_id );
    			return;
    		}
    	}
    	
        $year = PhiscalYear::findOne($year);
        if(!isset($year)) {
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app', 'Inccorect Phiscal Year'));
            return;
        }

        $model = StatOfficerProvinceTrainDetail::find()->alias('d')
            ->join('join', 'stat_officer_province_train o', 'o.id = d.stat_officer_province_train_id and o.phiscal_year_id=:year', [':year'=> $year->id])
            ->where(['d.province_id' => $province])
            ->asArray()->one();

        return json_encode([
            'model' => $model
        ]);
    }

    public function actionSave($year) {
    	
    	$user = Yii::$app->user->identity;
    	$controller_id = Yii::$app->controller->id;
    	$acton_id = Yii::$app->controller->action->id;
    	if ($user->role ["name"] != Yii::$app->params ['DEFAULT_ADMIN_ROLE']) {
    		if (! AuthenticationService::isAccessibleAction ( $controller_id, $acton_id )) {
    			MyHelper::response ( HttpCode::UNAUTHORIZED, Yii::t ( 'app', 'HTTP Error 401- You are not authorized to access this operaton due to invalid authentication' ) . " with ID:  " . $controller_id . "/ " . $acton_id );
    			return;
    		}
    	}
    	
        $post = Yii::$app->request->post();
        if(!isset($post['Model'])) {
            MyHelper::response(HttpCode::BAD_REQUEST, Yii::t('app', 'Inccorect Request Method'));
            return;
        }
        $year = PhiscalYear::findOne($year);
        if(!isset($year)) {
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app', 'Inccorect Phiscal Year'));
            return;
        }
        if($year->status != 'O') {
            MyHelper::response(HttpCode::METHOD_NOT_ALLOWED, Yii::t('app', 'The Year is not allowed to input'));
            return;
        }

        $transaction = Yii::$app->db->beginTransaction();
        try {
            $model = StatOfficerProvinceTrain::find()->where(['phiscal_year_id' => $year->id])->one();
            if(!isset($model)) {
                $model = new StatOfficerProvinceTrain();
                $model->user_id = Yii::$app->user->id;
                $model->phiscal_year_id = $year->id;
            }
            $model->last_update = date('Y-m-d H:i:s');
            $model->saved = 1;
            if(!$model->save()) throw new Exception(json_encode($model->errors));

            $detail = StatOfficerProvinceTrainDetail::find()->alias('d')
                ->join('join', 'stat_officer_province_train o', 'o.id = d.stat_officer_province_train_id and o.phiscal_year_id=:year', [':year'=> $year->id])
                ->where(['province_id' => $post['Model']['province']['id']])
                ->one();

            if(!isset($detail)) {
                $detail = new StatOfficerProvinceTrainDetail();
                $detail->stat_officer_province_train_id = $model->id;
                $detail->province_id = $post['Model']['province']['id'];
            }
            $detail->attributes = $post['Model'];
            if(!$detail->save()) throw new Exception(json_encode($detail->errors));
            $transaction->commit();
        } catch (Exception $exception) {
            $transaction->rollBack();
            MyHelper::response(HttpCode::INTERNAL_SERVER_ERROR, $exception->getMessage());
            return;
        }
    }

    public function actionPrint($year) {
    	$user = Yii::$app->user->identity;
    	$controller_id = Yii::$app->controller->id;
    	$acton_id = Yii::$app->controller->action->id;
    	if ($user->role ["name"] != Yii::$app->params ['DEFAULT_ADMIN_ROLE']) {
    		if (! AuthenticationService::isAccessibleAction ( $controller_id, $acton_id )) {
    			MyHelper::response ( HttpCode::UNAUTHORIZED, Yii::t ( 'app', 'HTTP Error 401- You are not authorized to access this operaton due to invalid authentication' ) . " with ID:  " . $controller_id . "/ " . $acton_id );
    			return;
    		}
    	}
    	
        $year = PhiscalYear::findOne($year);
        if(!isset($year)) {
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app', 'Inccorect Phiscal Year'));
            return;
        }

        $model = StatOfficerProvinceTrain::find()->where(['phiscal_year_id' => $year->id])->one();
        if(!isset($model)) {
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app', 'No Data'));
            return;
        }

        $models = Province::find()->alias('m')
            ->select('m.*, d.*')
            ->join('left join', 'stat_officer_province_train_detail d', 'd.province_id=m.id and d.stat_officer_province_train_id=:id', [':id' => $model->id])
            ->where(['deleted' => 0])->orderBy('m.province_code')->asArray()->all();

        return $this->renderPartial('../ministry/print', [
            'content' => $this->renderPartial('table', [
                'models' => $models, 'year' => $year, 'cols' => $this->columns
            ])
        ]);
    }

    public function actionDownload($year) {
    	
    	$user = Yii::$app->user->identity;
    	$controller_id = Yii::$app->controller->id;
    	$acton_id = Yii::$app->controller->action->id;
    	if ($user->role ["name"] != Yii::$app->params ['DEFAULT_ADMIN_ROLE']) {
    		if (! AuthenticationService::isAccessibleAction ( $controller_id, $acton_id )) {
    			MyHelper::response ( HttpCode::UNAUTHORIZED, Yii::t ( 'app', 'HTTP Error 401- You are not authorized to access this operaton due to invalid authentication' ) . " with ID:  " . $controller_id . "/ " . $acton_id );
    			return;
    		}
    	}
    	
        $year = PhiscalYear::findOne($year);
        if(!isset($year)) {
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app', 'Inccorect Phiscal Year'));
            return;
        }

        $model = StatOfficerProvinceTrain::find()->where(['phiscal_year_id' => $year->id])->one();
        if(!isset($model)) {
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app', 'No Data'));
            return;
        }

        $models = Province::find()->alias('m')
            ->select('m.*, d.*')
            ->join('left join', 'stat_officer_province_train_detail d', 'd.province_id=m.id and d.stat_officer_province_train_id=:id', [':id' => $model->id])
            ->where(['deleted' => 0])->orderBy('m.province_code')->asArray()->all();

        return $this->renderPartial('../ministry/excel', [
            'file' => 'Stat Officers Province Train '. $year->year . '.xls',
            'content' => $this->renderPartial('table', ['models' => $models, 'year' => $year, 'cols' => $this->columns])
        ]);
    }

    /**
     * Finds the StatOfficerProvinceTrain model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return StatOfficerProvinceTrain the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = StatOfficerProvinceTrain::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
    
    public function beforeAction($action) {
    	$user = Yii::$app->user->identity;
    	$this->enableCsrfValidation = true;
    	$controller_id = Yii::$app->controller->id;
    	$acton_id = Yii::$app->controller->action->id;
    	if ($user->role ["name"] != Yii::$app->params ['DEFAULT_ADMIN_ROLE']) {
    		if (! AuthenticationService::isAccessibleAction ( $controller_id, $acton_id )) {
    			if (Yii::$app->request->isAjax) {
    				MyHelper::response ( HttpCode::UNAUTHORIZED, Yii::t ( 'app', 'HTTP Error 401- You are not authorized to access this operaton due to invalid authentication' ) . " with ID:  " . $controller_id . "/ " . $acton_id );
    				return;
    			} else {
    				return $this->redirect ( [
    						'authentication/notallowed'
    				] );
    			}
    		}
    	}
    
    	return parent::beforeAction ( $action );
    }
    
}
