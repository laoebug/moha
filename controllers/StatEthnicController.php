<?php

namespace app\controllers;

use app\components\MyHelper;
use app\models\Ethnic;
use app\models\PhiscalYear;
use app\models\Province;
use app\models\StatEthnicDetail;
use Codeception\Util\HttpCode;
use Yii;
use app\models\StatEthnic;
use yii\data\ActiveDataProvider;
use yii\db\Exception;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use app\services\AuthenticationService;
/**
 * StatEthnicController implements the CRUD actions for StatEthnic model.
 */
class StatEthnicController extends Controller
{
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
     * Lists all StatEthnic models.
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
        $ethnics = Ethnic::find()->where(['deleted' => 0])->orderBy('position')->asArray()->all();
        return json_encode([
            "years" => $years,
            "provinces" => $provinces,
            "ethnics" => $ethnics
        ]);
    }

    public function actionEnquiry($year) {
        $year = PhiscalYear::findOne($year);
        if(!isset($year)) {
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app', 'Inccorect Phiscal Year'));
            return;
        }

        $provinces = Province::find()->where(['deleted' => 0])->orderBy('province_code')->all();
        $ethnics = Ethnic::find()->where(['deleted' => 0])->orderBy('position')->all();
        $models = StatEthnicDetail::find()->alias('d')
            ->join('join', 'stat_ethnic e', 'e.id = d.stat_ethnic_id and e.phiscal_year_id=:year', [':year'=> $year->id])
            ->all();

        return $this->renderPartial('table', [
            'ethnics' => $ethnics,
            'models' => $models,
            'year' => $year,
            'provinces' => $provinces
        ]);
    }

    public function actionInquiry($year, $province, $ethnic) {
    	
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

        $model = StatEthnicDetail::find()->alias('s')
            ->where(['province_id' => $province, 'ethnic_id' => $ethnic])
            ->join('join', 'stat_ethnic e', 'e.id = s.stat_ethnic_id and e.phiscal_year_id=:year', [':year' => $year->id])
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
        if(!isset($post['StatEthnicDetail'])) {
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
        try{
            $model = StatEthnic::find()
                ->where(['phiscal_year_id' => $year->id])
                ->one();
            if(!isset($model)) {
                $model = new StatEthnic();
                $model->phiscal_year_id = $year->id;
                $model->user_id = Yii::$app->user->id;
            }
            $model->saved = 1;
            $model->last_update = date('Y-m-d H:i:s');
            if(!$model->save()) throw new Exception(json_encode($model->errors));

            $detail = StatEthnicDetail::find()
                ->where([
                    'stat_ethnic_id' => $model->id,
                    'province_id' => $post['StatEthnicDetail']['province']['id'],
                    'ethnic_id' => $post['StatEthnicDetail']['ethnic']['id'],
                ])
                ->one();
            if(!isset($detail)) {
                $detail = new StatEthnicDetail();
                $detail->province_id = $post['StatEthnicDetail']['province']['id'];
                $detail->stat_ethnic_id = $model->id;
                $detail->ethnic_id = $post['StatEthnicDetail']['ethnic']['id'];
            }

            $detail->total = $post['StatEthnicDetail']['total'];
            $detail->women = $post['StatEthnicDetail']['women'];

            if(!$detail->save()) throw new Exception(json_encode($detail->errors));
            $transaction->commit();
        } catch (Exception $exception) {
            $transaction->rollBack();
            MyHelper::response(HttpCode::INTERNAL_SERVER_ERROR, $exception->getMessage());
            return;
        }
    }

    public function actionPrint($year) {
        $year = PhiscalYear::findOne($year);
        if(!isset($year)) {
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app', 'Inccorect Phiscal Year'));
            return;
        }

        $provinces = Province::find()->where(['deleted' => 0])->orderBy('province_code')->all();
        $ethnics = Ethnic::find()->where(['deleted' => 0])->orderBy('position')->all();
        $models = StatEthnicDetail::find()->alias('d')
            ->join('join', 'stat_ethnic e', 'e.id = d.stat_ethnic_id and e.phiscal_year_id=:year', [':year'=> $year->id])
            ->all();

        return $this->renderPartial('../ministry/print', [
            'content' => $this->renderPartial('table', [
                'ethnics' => $ethnics, 'models' => $models, 'provinces' => $provinces, 'year' => $year
            ])
        ]);
    }

    public function actionDownload($year) {
        $year = PhiscalYear::findOne($year);
        if(!isset($year)) {
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app', 'Inccorect Phiscal Year'));
            return;
        }

        $provinces = Province::find()->where(['deleted' => 0])->orderBy('province_code')->all();
        $ethnics = Ethnic::find()->where(['deleted' => 0])->orderBy('position')->all();
        $models = StatEthnicDetail::find()->alias('d')
            ->join('join', 'stat_ethnic e', 'e.id = d.stat_ethnic_id and e.phiscal_year_id=:year', [':year'=> $year->id])
            ->all();

        return $this->renderPartial('../ministry/excel', [
            'file' => 'Statistic of Ethnic '. $year->year. '.xls',
            'content' => $this->renderPartial('table', [
                'ethnics' => $ethnics, 'models' => $models, 'provinces' => $provinces, 'year' => $year
            ])
        ]);
    }

    /**
     * Finds the StatEthnic model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return StatEthnic the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = StatEthnic::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException(Yii::t('app','The requested page does not exist.'));
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
