<?php

namespace app\controllers;

use app\components\MyHelper;
use app\models\Award;
use app\models\Ministry;
use app\models\PhiscalYear;
use app\models\StatHighoverseaMinistryDetail;
use Codeception\Util\HttpCode;
use Yii;
use app\models\StatHighoverseaMinistry;
use app\models\StatHighoverseaMinistrySearch;
use yii\db\Exception;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use app\services\AuthenticationService;
/**
 * StatHighoverseaMinistryController implements the CRUD actions for StatHighoverseaMinistry model.
 */
class StatHighoverseaMinistryController extends Controller
{
    public $columns = [
        'gold_personal','gold_team',
        'lanx_personal','lanx_team',
        'hono_personal','hono_team',
    ];

    public $lables = ['ຫຼຽນຄໍາແຫ່ງຊາດ', 'ຫຼຽນໂພໄຊລ້ານຊ້າງ', 'ຫຼຽນກຽດຕິຄຸນ'];

    public function actionIndex()
    {
        return $this->render('index', [
            'labels' => $this->lables,
        ]);
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
        $awards = Award::find()->where(['deleted' => 0])->orderBy('position')->asArray()->all();
        $ministries = Ministry::find()->where(['deleted' =>0])->orderBy('position')->asArray()->all();

        return json_encode([
            'years' => $years,
            'awards' => $awards,
            'ministries' => $ministries
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
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app', 'Incorrect Phiscal Year'));
            return;
        }
        $models = StatHighoverseaMinistryDetail::find()->alias('d')
            ->select([
                'd.*',
                'ministry' => 'm.name',
                'award' => 'a.name'
            ])
            ->join('join', 'stat_highoversea_ministry t', 't.id=d.stat_highoversea_ministry_id and t.phiscal_year_id=:year', [':year'=> $year->id])
            ->join('join', 'ministry m', 'm.id=d.ministry_id')
            ->join('join', 'award a', 'a.id=d.award_id')
            ->orderBy('m.position')
            ->asArray()->all();

        return json_encode([
            'models' => $models
        ]);
    }

    public function actionInquiry($year, $ministry, $award) {
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
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app', 'Incorrect Phiscal Year'));
            return;
        }

        $model = StatHighoverseaMinistryDetail::find()->alias('d')
            ->join('join', 'stat_highoversea_ministry m', 'm.id = d.stat_highoversea_ministry_id and m.phiscal_year_id=:year', [':year' => $year->id])
            ->where([
                'award_id' => $award,
                'ministry_id' => $ministry,
            ])->asArray()->one();

        return json_encode(['model' => $model]);
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
    	
        $year = PhiscalYear::findOne($year);
        if(!isset($year)) {
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app', 'Incorrect Phiscal Year'));
            return;
        }

        $post = Yii::$app->request->post();
        if(isset($post)) {
            $transaction = Yii::$app->db->beginTransaction();
            try {
                $model = StatHighoverseaMinistry::find()->where(['phiscal_year_id' => $year->id])->one();
                if (!isset($model)) {
                    $model = new StatHighoverseaMinistry();
                    $model->phiscal_year_id = $year->id;
                    $model->user_id = Yii::$app->user->id;
                }
                $model->last_update = date('Y-m-d H:i:s');
                $model->saved = 1;

                if (!$model->save()) throw new Exception(json_encode($model->errors));

                $detail = StatHighoverseaMinistryDetail::find()
                    ->where([
                        'stat_highoversea_ministry_id' => $model->id,
                        'ministry_id' => $post['Model']['ministry']['id'],
                        'award_id' => $post['Model']['award']['id'],
                    ])->one();
                if(!isset($detail)) {
                    $detail = new StatHighoverseaMinistryDetail();
                    $detail->ministry_id = $post['Model']['ministry']['id'];
                    $detail->award_id = $post['Model']['award']['id'];
                    $detail->stat_highoversea_ministry_id = $model->id;
                }
                $detail->attributes = $post['Model'];

                if (!$detail->save()) throw new Exception(json_encode($detail->errors));

                $transaction->commit();
            } catch (Exception $exception) {
                $transaction->rollBack();
                MyHelper::response(HttpCode::INTERNAL_SERVER_ERROR, $exception->getMessage());
                return;
            }
        }
    }

    public function actionPrint($year) {
        $year = PhiscalYear::findOne($year);
        if(!isset($year)) {
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app', 'Incorrect Phiscal Year'));
            return;
        }

        $models = StatHighoverseaMinistryDetail::find()->alias('d')
            ->select([
                'd.*',
                'ministry' => 'm.name',
                'award' => 'a.name'
            ])
            ->join('join', 'stat_highoversea_ministry t', 't.id=d.stat_highoversea_ministry_id and t.phiscal_year_id=:year', [':year'=> $year->id])
            ->join('join', 'ministry m', 'm.id=d.ministry_id')
            ->join('join', 'award a', 'a.id=d.award_id')
            ->asArray()->all();


        return $this->renderPartial('../ministry/print', [
            'content' => $this->renderPartial('table', [
                'models' => $models,
                'year' => $year,
                'cols' => $this->columns,
                'labels' => $this->lables,
            ])
        ]);
    }

    public function actionDownload($year) {
        $year = PhiscalYear::findOne($year);
        if(!isset($year)) {
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app', 'Incorrect Phiscal Year'));
            return;
        }
        $models = StatHighoverseaMinistryDetail::find()->alias('d')
            ->select([
                'd.*',
                'ministry' => 'm.name',
                'award' => 'a.name'
            ])
            ->join('join', 'stat_highoversea_ministry t', 't.id=d.stat_highoversea_ministry_id and t.phiscal_year_id=:year', [':year'=> $year->id])
            ->join('join', 'ministry m', 'm.id=d.ministry_id')
            ->join('join', 'award a', 'a.id=d.award_id')
            ->asArray()->all();

        return $this->renderPartial('../ministry/excel', [
            'file' => 'Gov Coin Ministry '. $year->year . '.xls',
            'content' => $this->renderPartial('table', [
                'models' => $models,
                'year' => $year,
                'cols' => $this->columns,
                'labels' => $this->lables,
            ])
        ]);
    }
    
    /**
     * Finds the StatHighoverseaMinistry model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return StatHighoverseaMinistry the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = StatHighoverseaMinistry::findOne($id)) !== null) {
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
