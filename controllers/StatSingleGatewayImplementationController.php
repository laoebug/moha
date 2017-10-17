<?php

namespace app\controllers;

use app\components\MyHelper;
use app\models\Branch;
use app\models\Ministry;
use app\models\PhiscalYear;
use app\models\StatSingleGatewayImplementationDetail;
use Codeception\Util\HttpCode;
use Yii;
use app\models\StatSingleGatewayImplementation;
use app\models\StatSingleGatewayImplementationSearch;
use yii\db\ActiveQuery;
use yii\db\Exception;
use yii\web\Controller;
use yii\web\HttpException;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use yii\web\ServerErrorHttpException;

/**
 * StatSingleGatewayImplementationController implements the CRUD actions for StatSingleGatewayImplementation model.
 */
class StatSingleGatewayImplementationController extends Controller
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
     * Lists all StatSingleGatewayImplementation models.
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
    	
        return json_encode([
            'years' => PhiscalYear::find()->where(['deleted' => 0])->asArray()->all(),
            'ministries' => Ministry::find()->where(['deleted' => 0])->orderBy('position')->asArray()->all()
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
        if(!isset($year)) throw new HttpException(Yii::t('app', 'Inccorect Phiscal Year'));

//        $model = StatSingleGatewayImplementation::find()
//            ->alias('i')
//            ->join('join', 'stat_single_gateway_implementation_detail d', 'i.id=d.ministry_id and i.phiscal_year_id=:year', [
//                ':year' => $year->id
//            ])
//            ->join('right join', 'ministry m', 'm.id=d.ministry_id')
//            ->with(['statSingleGatewayImplementationDetails' => function(ActiveQuery $query) {
//                $query
////                    ->select('d.id, d.name, d.remark, d.ministry_id, d.stat_single_gateway_implementation_id')
//                    ->select(['DATE_FORMAT(`start_date`, "%d-%m-%Y") as `start_date`, `d`.`id`, `d`.`name`, `d`.`remark`, `d`.`ministry_id`, `d`.`stat_single_gateway_implementation_id`'])
//                    ->alias('d')
//                    ->with(['ministry']);
//            }])
//            ->orderBy('m.position')
//            ->asArray()
//            ->one();

        $model = StatSingleGatewayImplementation::find()->where(['phiscal_year_id' => $year])->one();
        if(!isset($model)) throw new HttpException(Yii::t('app', 'No Data'));

        $models = Ministry::find()->alias('m')
            ->select('m.*,`d`.`name` as `servicename`, `d`.`remark`')
            ->addSelect([
                'start_date'=> 'DATE_FORMAT(`start_date`, "%d-%m-%Y")',
            ])
            ->join('left join', 'stat_single_gateway_implementation_detail d', 'd.ministry_id = m.id and d.stat_single_gateway_implementation_id=:id', [':id' => $model->id])
            ->where(['deleted' => 0])
            ->orderBy('m.position')->asArray()->all();

        return json_encode([
            'models' => $models,
        ]);
    }

    public function actionInquiry($year, $ministry) {
    	
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
        if(!isset($year)) throw new HttpException(Yii::t('app', 'Inccorect Phiscal Year'));

        $model = StatSingleGatewayImplementationDetail::find()
            ->alias('d')
            ->join('join','stat_single_gateway_implementation i', 'd.stat_single_gateway_implementation_id=i.id and i.phiscal_year_id=:year', [
                ':year' => $year->id
            ])
            ->where(['d.ministry_id' => $ministry])
            ->asArray()->one();

        if(isset($model))
            if(isset($model['start_date']))
                $model['start_date'] = MyHelper::convertdatefordisplay($model['start_date']);

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
        if(isset($post)) {
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
                $model = StatSingleGatewayImplementation::find()
                    ->where(['phiscal_year_id' => $year->id])->one();
                if (!isset($model)) {
                    $model = new StatSingleGatewayImplementation();
                    $model->user_id = Yii::$app->user->id;
                    $model->phiscal_year_id = $year->id;
                }
                $model->last_update = date('Y-m-d H:i:s');
                $model->saved = 1;
                print_r($model->attributes);
                if (!$model->save())
                    throw new ServerErrorHttpException(json_encode($model->errors));

                $detail = StatSingleGatewayImplementationDetail::find()
                    ->where(['ministry_id' => $post['Model']['ministry']['id'], 'stat_single_gateway_implementation_id' => $model->id])
                    ->one();
                if (!isset($detail)) {
                    $detail = new StatSingleGatewayImplementationDetail();
                    $detail->stat_single_gateway_implementation_id = $model->id;
                    $detail->ministry_id = $post['Model']['ministry']['id'];
                }
                $detail->remark = $post['Model']['remark'];
                $detail->start_date = date('Y-m-d', strtotime($post['Model']['start_date']));
                $detail->name = $post['Model']['name'];
                print_r($detail->attributes);
                if (!$detail->save())
                    throw new ServerErrorHttpException(json_encode($detail->errors));

                $transaction->commit();
            }catch (Exception $exception) {
                $transaction->rollBack();
                MyHelper::response(HttpCode::INTERNAL_SERVER_ERROR, $exception->getMessage());
                return;
            }
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

        $model = StatSingleGatewayImplementation::find()
            ->with([
                'statSingleGatewayImplementationDetails' => function(ActiveQuery $query) {
                    $query->alias('d')
                        ->join('right join', 'ministry m', 'm.id=d.ministry_id')
                        ->orderBy('m.position');
                }
            ])->where(['phiscal_year_id' => $year->id])->one();
        return $this->renderPartial('print', ['content' => $this->renderPartial('table', ['model' => $model])]);
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

        $model = StatSingleGatewayImplementation::find()
            ->with([
                'statSingleGatewayImplementationDetails' => function(ActiveQuery $query) {
                    $query->alias('d')
                        ->join('right join', 'ministry m', 'm.id=d.ministry_id')
                        ->orderBy('m.position');
                }
            ])->where(['phiscal_year_id' => $year->id])->one();
        return $this->renderPartial('excel', [
            'file' => 'Single Gateway Implementation '.$year->year.'.xls',
            'content' => $this->renderPartial('table', ['model' => $model])
        ]);
    }

    /**
     * Finds the StatSingleGatewayImplementation model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return StatSingleGatewayImplementation the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = StatSingleGatewayImplementation::findOne($id)) !== null) {
            return $model;
        } else {
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app','The requested page does not exist.'));
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
