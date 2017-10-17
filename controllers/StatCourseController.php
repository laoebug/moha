<?php

namespace app\controllers;

use app\components\MyHelper;
use app\models\PhiscalYear;
use app\models\StatContractDetail;
use app\models\StatCourseDetail;
use Codeception\Util\HttpCode;
use function foo\func;
use Yii;
use app\models\StatCourse;
use app\models\StatCourseSearch;
use yii\base\Exception;
use yii\db\ActiveQuery;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;

/**
 * StatCourseController implements the CRUD actions for StatCourse model.
 */
class StatCourseController extends Controller
{
    /**
     * Lists all StatCourse models.
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
        return json_encode([
            'years' => $years
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

        $models = $this->getChilds($year, 0);
        foreach ($models as $k => $model) {
            $models[$k]['childs'] = $this->getChilds($year, $model['id']);
            $models[$k]['parent'] = StatCourseDetail::find()->where(['id' => $model['parent_id']])->asArray()->one();
        }
        $parents = StatCourseDetail::find()->where(['deleted' => 0])->orderBy('position')->asArray()->all();
        return json_encode(['models' => $models, 'parents' => $parents]);
    }

    function getChilds($year, $parent) {
        return StatCourseDetail::find()->alias('d')
            ->join('join', 'stat_course c', 'c.id = d.stat_course_id and c.phiscal_year_id=:year', [':year'=> $year->id])
            ->where(['parent_id' => $parent, 'deleted' => 0])->orderBy('position')
            ->asArray()->all();
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
        $model = null;
        if(isset($post['Model'])) {
            $transaction = Yii::$app->db->beginTransaction();
            try {
                $model = StatCourse::find()->where(['phiscal_year_id' => $year->id])->one();
                if(!isset($model)) {
                    $model = new StatCourse();
                    $model->phiscal_year_id = $year->id;
                    $model->user_id = Yii::$app->user->id;
                }
                $model->saved = 1;
                $model->last_update = date('Y-m-d H:i:s');
                if(!$model->save())
                    throw new Exception(json_encode($model->errors));

                if(isset($post['Model']['id'])) {
                    $detail = StatCourseDetail::findOne($post['Model']['id']);
                    if(!isset($detail)) {
                        $detail = new StatCourseDetail();
                        $detail->stat_course_id = $model->id;
                        $detail->deleted = 0;
                    }
                } else {
                    $detail = new StatCourseDetail();
                    $detail->stat_course_id = $model->id;
                    $detail->deleted = 0;
                }
                $detail->stat_course_id = $model->id;
                $detail->attributes = $post['Model'];
                $detail->parent_id = isset($post['Model']['parent']) ? $post['Model']['parent']['id'] : 0;
                $detail->deleted = 0;
                if(!$detail->save())
                    throw new Exception(json_encode($detail->errors));

                $transaction->commit();
            } catch (Exception $ex) {
                $transaction->rollBack();
                MyHelper::response(HttpCode::INTERNAL_SERVER_ERROR, $ex->getMessage());
                return;
            }
        }
    }

    public function actionDelete($year) {
        $year = PhiscalYear::findOne($year);
        if(!isset($year)) {
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app', 'Incorrect Phiscal Year'));
            return;
        }

        $post = Yii::$app->request->post();
        if(!isset($post)) {
            MyHelper::response(HttpCode::BAD_REQUEST, Yii::t('app', 'Incorrect Requested'));
            return;
        }

        $model = StatCourseDetail::find()->alias('d')
            ->join('join', 'stat_course c', 'c.id=d.stat_course_id and c.phiscal_year_id=:year', [':year' => $year->id])
            ->where(['d.id' => $post['id']])
            ->one();
        if(!isset($model)) {
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app', 'Inccorect Mode'));
            return;
        }
        $model->deleted = 1;
        if(!$model->save()) {
            MyHelper::response(HttpCode::INTERNAL_SERVER_ERROR, json_encode($model->errors));
            return;
        }
    }

    public function actionPrint($year) {
        $year = PhiscalYear::findOne($year);
        if(!isset($year)) {
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app', 'Incorrect Phiscal Year'));
            return;
        }

        $models = $this->getChilds($year, 0);
        foreach ($models as $k => $model) {
            $models[$k]['childs'] = $this->getChilds($year, $model['id']);
            $models[$k]['parent'] = StatCourseDetail::find()->where(['id' => $model['parent_id']])->asArray()->one();
        }

        return $this->renderPartial('../ministry/print', [
            'content' => $this->renderPartial('table', [
                'romans' => ['I', 'II', 'III', 'IV', 'V','VI','VII','VIII', 'IX', 'X','XI','XII','XIII','XIV','XV','XVI','XVII','XVIII','XIX','XX'],
                'year' => $year,
                'models' => $models
            ])
        ]);
    }

    public function actionDownload($year) {
        $year = PhiscalYear::findOne($year);
        if(!isset($year)) {
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app', 'Incorrect Phiscal Year'));
            return;
        }

        $models = $this->getChilds($year, 0);
        foreach ($models as $k => $model) {
            $models[$k]['childs'] = $this->getChilds($year, $model['id']);
            $models[$k]['parent'] = StatCourseDetail::find()->where(['id' => $model['parent_id']])->asArray()->one();
        }

        return $this->renderPartial('../ministry/excel', [
            'file' => 'stat course '. $year->year.'.xls',
            'content' => $this->renderPartial('table', [
                'romans' => ['I', 'II', 'III', 'IV', 'V','VI','VII','VIII', 'IX', 'X','XI','XII','XIII','XIV','XV','XVI','XVII','XVIII','XIX','XX'],
                'year' => $year,
                'models' => $models
            ])
        ]);
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
