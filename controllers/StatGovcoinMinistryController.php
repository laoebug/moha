<?php

namespace app\controllers;

use app\components\MyHelper;
use app\models\Award;
use app\models\Ministry;
use app\models\PhiscalYear;
use app\models\StatGovcoinMinistryDetail;
use Codeception\Util\HttpCode;
use Yii;
use app\models\StatGovcoinMinistry;
use app\models\StatGovcoinMinistrySearch;
use yii\db\Exception;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;

/**
 * StatGovcoinMinistryController implements the CRUD actions for StatGovcoinMinistry model.
 */
class StatGovcoinMinistryController extends Controller
{
    public $columns = [
        'labo_personal','labo_team',
        'deve_personal','deve_team',
        'memo_personal','memo_team',
        'amer_personal','amer_team',
        'fran_personal','fran_team',
        'gove_personal','gove_team',
    ];

    public $lables = ['ຫຼຽນກາແຮງງານ', 'ຫຼຽນກາພັດທະນາ', 'ຫຼຽນກາລະນຶກ 5 ປີ', 'ຫຼຽນກາຕໍ່ຕ້ານ A', 'ຫຼຽນກາຕໍ່ຕ້ານ F', 'ໃບຍ້ອງຍໍລັດຖະບານ'];

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
        $models = StatGovcoinMinistryDetail::find()->alias('d')
            ->select([
                'd.*',
                'ministry' => 'm.name',
                'award' => 'a.name'
            ])
            ->join('join', 'stat_govcoin_ministry t', 't.id=d.stat_govcoin_ministry_id and t.phiscal_year_id=:year', [':year'=> $year->id])
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

        $model = StatGovcoinMinistryDetail::find()->alias('d')
            ->join('join', 'stat_govcoin_ministry m', 'm.id = d.stat_govcoin_ministry_id and m.phiscal_year_id=:year', [':year' => $year->id])
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
                $model = StatGovcoinMinistry::find()->where(['phiscal_year_id' => $year->id])->one();
                if (!isset($model)) {
                    $model = new StatGovcoinMinistry();
                    $model->phiscal_year_id = $year->id;
                    $model->user_id = Yii::$app->user->id;
                }
                $model->last_update = date('Y-m-d H:i:s');
                $model->saved = 1;

                if (!$model->save()) throw new Exception(json_encode($model->errors));

                $detail = StatGovcoinMinistryDetail::find()
                    ->where([
                        'stat_govcoin_ministry_id' => $model->id,
                        'ministry_id' => $post['Model']['ministry']['id'],
                        'award_id' => $post['Model']['award']['id'],
                    ])->one();
                if(!isset($detail)) {
                    $detail = new StatGovcoinMinistryDetail();
                    $detail->ministry_id = $post['Model']['ministry']['id'];
                    $detail->award_id = $post['Model']['award']['id'];
                    $detail->stat_govcoin_ministry_id = $model->id;
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

        $models = StatGovcoinMinistryDetail::find()->alias('d')
            ->select([
                'd.*',
                'ministry' => 'm.name',
                'award' => 'a.name'
            ])
            ->join('join', 'stat_govcoin_ministry t', 't.id=d.stat_govcoin_ministry_id and t.phiscal_year_id=:year', [':year'=> $year->id])
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
        $models = StatGovcoinMinistryDetail::find()->alias('d')
            ->select([
                'd.*',
                'ministry' => 'm.name',
                'award' => 'a.name'
            ])
            ->join('join', 'stat_govcoin_ministry t', 't.id=d.stat_govcoin_ministry_id and t.phiscal_year_id=:year', [':year'=> $year->id])
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
     * Finds the StatGovcoinMinistry model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return StatGovcoinMinistry the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = StatGovcoinMinistry::findOne($id)) !== null) {
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
