<?php

namespace app\controllers;

use app\components\MyHelper;
use app\models\OfficerLevel;
use app\models\PhiscalYear;
use app\models\StatContractDetail;
use Codeception\Util\HttpCode;
use Yii;
use app\models\StatContract;
use app\models\StatContractSearch;
use yii\db\Exception;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;

/**
 * StatContractController implements the CRUD actions for StatContract model.
 */
class StatContractController extends Controller
{
    /**
     * Lists all StatContract models.
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
    	
        $years = PhiscalYear::find()->asArray()->all();
        $levels = OfficerLevel::find()->where(['deleted' => 0])->orderBy('position')->asArray()->all();

        return json_encode([
            'years' => $years,
            'levels' => $levels
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

        $models = StatContractDetail::find()->alias('d')
            ->select('d.*')
            ->addSelect('l.name')
            ->join('join', 'officer_level l', 'l.id = d.officer_level_id')
            ->join('join', 'stat_contract e', 'e.id = d.stat_contract_id and e.phiscal_year_id=:year', [':year' => $year->id])
            ->asArray()->all();

        return json_encode(['models' => $models]);
    }

    public function actionInquiry($year, $level) {
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

        $model = StatContractDetail::find()->alias('d')
            ->join('join', 'stat_contract e', 'e.id = d.stat_contract_id and e.phiscal_year_id=:year', [':year' => $year->id])
            ->where(['d.officer_level_id' => $level])
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
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app', 'Incorrect Phiscal Year'));
            return;
        }

        $transaction = Yii::$app->db->beginTransaction();
        try {
            $model = StatContract::find()->where(['phiscal_year_id'=> $year->id])
                ->one();
            if(!isset($model)) {
                $model = new StatContract();
                $model->user_id = Yii::$app->user->id;
                $model->phiscal_year_id = $year->id;
            }
            $model->saved = 1;
            $model->last_update = date('Y-m-d H:i:s');
            if(!$model->save()) throw new \yii\db\Exception(json_encode($model->errors));

            $detail = StatContractDetail::find()->where([
                'stat_contract_id' => $model->id,
                'officer_level_id' => $post['Model']['level']['id'],
            ])->one();

            if(!isset($detail)) {
                $detail = new StatContractDetail();
                $detail->stat_contract_id = $model->id;
                $detail->officer_level_id = $post['Model']['level']['id'];
            }
            $detail->attributes = $post['Model'];
            if(!$detail->save()) throw new Exception(json_encode($detail->errors));
            $transaction->commit();
        } catch (Exception $exception) {
            $transaction->rollBack();
            MyHelper::response(HttpCode::INTERNAL_SERVER_ERROR, $exception->getMessage());
            return;
        }

        return json_encode([
            'model' => $model
        ]);
    }

    public function actionPrint($year) {
        $year = PhiscalYear::findOne($year);
        if(!isset($year)) {
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app', 'Incorrect Phiscal Year'));
            return;
        }

        $models = StatContractDetail::find()->alias('d')
            ->select('d.*,l.name')
            ->join('join', 'officer_level l', 'l.id = d.officer_level_id')
            ->join('join', 'stat_contract e', 'e.id = d.stat_contract_id and e.phiscal_year_id=:year', [':year' => $year->id])
            ->asArray()->all();

        return $this->renderPartial('../ministry/print', [
            'content' => $this->renderPartial('table', [
                    'models' => $models,
                    'year' => $year,
                ]
            )]);
    }

    public function actionDownload($year) {
        $year = PhiscalYear::findOne($year);
        if(!isset($year)) {
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app', 'Incorrect Phiscal Year'));
            return;
        }

        $models = StatContractDetail::find()->alias('d')
            ->select('d.*,l.name')
            ->join('join', 'officer_level l', 'l.id = d.officer_level_id')
            ->join('join', 'stat_contract e', 'e.id = d.stat_contract_id and e.phiscal_year_id=:year', [':year' => $year->id])
            ->asArray()->all();

        return $this->renderPartial('../ministry/excel', [
            'file' => 'stat contract '. $year['year'].'.xls',
            'content' => $this->renderPartial('table', [
                    'models' => $models,
                    'year' => $year
                ]
            )]);
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
