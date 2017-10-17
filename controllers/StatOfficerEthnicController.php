<?php

namespace app\controllers;

use app\components\MyHelper;
use app\models\Ethnic;
use app\models\OfficerLevel;
use app\models\PhiscalYear;
use app\models\StatOfficerEthnicDetail;
use Codeception\Util\HttpCode;
use Yii;
use app\models\StatOfficerEthnic;
use yii\base\Exception;
use yii\web\Controller;

/**
 * StatOfficerEthnicController implements the CRUD actions for StatOfficerEthnic model.
 */
class StatOfficerEthnicController extends Controller
{

    /**
     * Lists all StatOfficerEthnic models.
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
        $ethnics = Ethnic::find()->where(['deleted' => 0])->orderBy('position')->asArray()->all();
        $levels = OfficerLevel::find()->where(['deleted' => 0])->orderBy('position')->asArray()->all();

        return json_encode([
            'years' => $years,
            'ethnics' => $ethnics,
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

        $models = StatOfficerEthnicDetail::find()->alias('d')
            ->join('join', 'stat_officer_ethnic e', 'e.id = d.stat_officer_ethnic_id and e.phiscal_year_id=:year', [':year' => $year->id])
            ->asArray()->all();

        $levels = OfficerLevel::find()->where(['deleted' => 0])->orderBy('position')->asArray()->all();
        $ethnics = Ethnic::find()->where(['deleted'=>0])->orderBy('position')->asArray()->all();

        return $this->renderPartial('table', ['ethnics' => $ethnics, 'models' => $models,'ethnics'=>$ethnics, 'levels' => $levels, 'year' => $year]);
    }

    public function actionInquiry($year, $ethnic, $level) {
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

        $model = StatOfficerEthnicDetail::find()
            ->join('join', 'stat_officer_ethnic e', 'e.id = d.stat_officer_ethnic_id and e.phiscal_year_id=:year', [':year' => $year->id])
            ->where(['ethnic_id'=> $ethnic, 'officer_level_id' => $level])
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
            $model = StatOfficerEthnic::find()->where(['phiscal_year_id'=> $year->id])
                ->one();
            if(!isset($model)) {
                $model = new StatOfficerEthnic();
                $model->user_id = Yii::$app->user->id;
                $model->phiscal_year_id = $year->id;
            }
            $model->saved = 1;
            $model->last_update = date('Y-m-d H:i:s');
            if(!$model->save()) throw new \yii\db\Exception(json_encode($model->errors));

            $detail = StatOfficerEthnicDetail::find()->where([
                'stat_officer_ethnic_id' => $model->id,
                'ethnic_id' => $post['Model']['ethnic']['id'],
                'officer_level_id' => $post['Model']['level']['id'],
                'stat_officer_ethnic_id' => $model->id,
                ])->one();

            if(!isset($detail)) {
                $detail = new StatOfficerEthnicDetail();
                $detail->stat_officer_ethnic_id = $model->id;
                $detail->officer_level_id = $post['Model']['level']['id'];
                $detail->ethnic_id = $post['Model']['ethnic']['id'];
            }
            $detail->total = $post['Model']['total'];
            $detail->women = $post['Model']['women'];
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

        $models = StatOfficerEthnicDetail::find()->alias('d')
            ->join('join', 'stat_officer_ethnic e', 'e.id = d.stat_officer_ethnic_id and e.phiscal_year_id=:year', [':year' => $year->id])
            ->asArray()->all();

        $levels = OfficerLevel::find()->where(['deleted' => 0])->orderBy('position')->asArray()->all();
        $ethnics = Ethnic::find()->where(['deleted'=>0])->orderBy('position')->asArray()->all();

        return $this->renderPartial('../ministry/print', [
            'content' => $this->renderPartial('table', [
                'ethnics' => $ethnics,
                    'models' => $models,
                    'year' => $year,
                    'levels' => $levels
                ]
        )]);
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
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app', 'Incorrect Phiscal Year'));
            return;
        }

        $models = StatOfficerEthnicDetail::find()->alias('d')
            ->join('join', 'stat_officer_ethnic e', 'e.id = d.stat_officer_ethnic_id and e.phiscal_year_id=:year', [':year' => $year->id])
            ->asArray()->all();

        $levels = OfficerLevel::find()->where(['deleted' => 0])->orderBy('position')->asArray()->all();
        $ethnics = Ethnic::find()->where(['deleted'=>0])->orderBy('position')->asArray()->all();

        return $this->renderPartial('../ministry/excel', [
            'file' => 'stat officer ethnic '. $year['year'].'.xls',
            'content' => $this->renderPartial('table', [
                    'ethnics' => $ethnics,
                    'models' => $models,
                    'year' => $year,
                    'levels' => $levels
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
