<?php

namespace app\controllers;

use app\components\MyHelper;
use app\models\Ministry;
use app\services\AuthenticationService;
use Codeception\Util\HttpCode;
use Yii;
use yii\filters\VerbFilter;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use app\models\PhiscalYear;
use \app\models\User;
/**
 * MinistryController implements the CRUD actions for Ministry model.
 */
class MinistryController extends Controller
{
  

    public function behaviors() {
		return [ 
				'verbs' => [ 
						'class' => VerbFilter::className (),
						'actions' => [ 
								'delete' => [ 
										'POST' 
								] 
						] 
				],
				'access' => [ 
                    'class' => \yii\filters\AccessControl::className(),
						'rules' => [ 
								[ 
										'allow' => ! Yii::$app->user->isGuest && in_array ( Yii::$app->user->identity->role_id, User::getAllowedRoleIds () ) 
								] 
						] 
				] 
		];
    }
    
    /**
     * Lists all Ministry models.
     *
     * @return mixed
     */
    public function actionIndex()
    {        
        return $this->render('index');
    }

    public function actionGet()
    {
    
        $years = PhiscalYear::find()->orderBy('year')
            ->where(['deleted' => 0])->asArray()->all();        
        return json_encode([
            'years' => $years            
        ]);
    }


    public function actionEnquiry($year)
    {
        $user = Yii::$app->user->identity;
        $controller_id = Yii::$app->controller->id;
        $acton_id = Yii::$app->controller->action->id;
        if ($user->role ["name"] != Yii::$app->params ['DEFAULT_ADMIN_ROLE']) {
            if (!AuthenticationService::isAccessibleAction($controller_id, $acton_id)) {
                MyHelper::response(HttpCode::UNAUTHORIZED, Yii::t('app', 'HTTP Error 401- You are not authorized to access this operaton due to invalid authentication') . " with ID:  " . $controller_id . "/ " . $acton_id);
                return;
            }
        }

        return json_encode([
            'ministries' => Ministry::find()
                ->where('deleted=:deleted and phiscal_year_id=:phiscal_year_id and ministry_group_id in (1,2)',[':deleted'=>0,':phiscal_year_id'=>$year])
                ->orderBy('position')
                ->asArray()->all()
        ]);
    }

    public function actionSave()
    {
        $user = Yii::$app->user->identity;
        $controller_id = Yii::$app->controller->id;
        $acton_id = Yii::$app->controller->action->id;
        if ($user->role ["name"] != Yii::$app->params ['DEFAULT_ADMIN_ROLE']) {
            if (!AuthenticationService::isAccessibleAction($controller_id, $acton_id)) {
                MyHelper::response(HttpCode::UNAUTHORIZED, Yii::t('app', 'HTTP Error 401- You are not authorized to access this operaton due to invalid authentication') . " with ID:  " . $controller_id . "/ " . $acton_id);
                return;
            }
        }

        $post = Yii::$app->request->post();
        if (isset ($post)) {
            if ($post ['create'] == 1) {
                $model = new Ministry ();
                $model->deleted = 0;
                $model->ministry_group_id = 1;
            } else {
                $model = Ministry::findOne($post ['Ministry'] ['id']);
                if (!isset ($model)) {
                    MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app', 'The Ministry is Not Found'));
                    return;
                }
            }
            $model->load($post);
            $model->user_id = Yii::$app->user->id;
            $model->last_update = date('Y-m-d H:i:s');
            if (!$model->save()) {
                MyHelper::response(HttpCode::INTERNAL_SERVER_ERROR, json_encode($model->errors));
                return;
            }
        }
    }

    public function actionDelete()
    {
        $user = Yii::$app->user->identity;
        $controller_id = Yii::$app->controller->id;
        $acton_id = Yii::$app->controller->action->id;
        if ($user->role ["name"] != Yii::$app->params ['DEFAULT_ADMIN_ROLE']) {
            if (!AuthenticationService::isAccessibleAction($controller_id, $acton_id)) {
                MyHelper::response(HttpCode::UNAUTHORIZED, Yii::t('app', 'HTTP Error 401- You are not authorized to access this operaton due to invalid authentication') . " with ID:  " . $controller_id . "/ " . $acton_id);
                return;
            }
        }

        $post = Yii::$app->request->post();
        if (isset ($post)) {
            if (isset ($post ['Ministry'])) {
                $model = $this->findModel($post ['Ministry'] ['id']);
                $model->deleted = 1;
                $model->last_update = date('Y-m-d H:i:s');
                $model->user_id = Yii::$app->user->id;
                if (!$model->save()) {
                    MyHelper::response(HttpCode::INTERNAL_SERVER_ERROR, json_encode($model->errors));
                    return;
                }
            }
        }
    }

    public function actionPrint($year)
    {
        $ministries = Ministry::find() ->where('deleted=:deleted and phiscal_year_id=:phiscal_year_id and ministry_group_id in (1,2)',[':deleted'=>0,':phiscal_year_id'=>$year])
        ->orderBy('position')->asArray()->all();     
        return $this->renderPartial('print', [
            'content' => $this->renderPartial('table', [
                'ministries' => $ministries
            ])
        ]);
    }

    public function actionDownload($year)
    {
        
        $ministries = Ministry::find() ->where('deleted=:deleted and phiscal_year_id=:phiscal_year_id and ministry_group_id in (1,2)',[':deleted'=>0,':phiscal_year_id'=>$year])
        ->orderBy('position')->asArray()->all();        
        return $this->renderPartial('excel', [
            'file' => 'ministries.xls',
            'content' => $this->renderPartial('table', [
                'ministries' => $ministries
            ])
        ]);
    }

    /**
     * Finds the Ministry model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     *
     * @param integer $id
     * @return Ministry the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = Ministry::findOne($id)) !== null) {
            return $model;
        } else {
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app', 'The requested page does not exist.'));
            return;
        }
    }

}
