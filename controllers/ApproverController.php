<?php

namespace app\controllers;

use app\models\ApproverLevel;
use Yii;
use app\models\Approver;
use app\models\ApproverSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use app\services\AuthenticationService;
/**
 * ApproverController implements the CRUD actions for Approver model.
 */
class ApproverController extends Controller
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
     * Lists all Approver models.
     * @return mixed
     */
    public function actionIndex()
    {
        $searchModel = new ApproverSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single Approver model.
     * @param integer $id
     * @return mixed
     */
    public function actionView($id)
    {
        return $this->render('view', [
            'model' => $this->findModel($id),
        ]);
    }

    /**
     * Creates a new Approver model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $model = new Approver();

        $post = Yii::$app->request->post();
        if ($model->load($post)) {
            if(isset($post['Approver']['approver_level'])) {
                $approverlevel = ApproverLevel::find()->where(['code' => $post['Approver']['approver_level']])->one();
                if(isset($approverlevel)) $model->approver_level_id = $approverlevel->id;
            }
            $model->save();
            return $this->redirect(['index']);
        } else {
            return $this->render('create', [
                'model' => $model,
            ]);
        }
    }

    /**
     * Updates an existing Approver model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     */
    public function actionUpdate($id)
    {
        $model = $this->findModel($id);
        if(isset($model->approverLevel))
            $model->approver_level = $model->approverLevel->code;

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['index']);
        } else {
            return $this->render('update', [
                'model' => $model,
            ]);
        }
    }

    /**
     * Deletes an existing Approver model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     */
    public function actionDelete($id)
    {
        $this->findModel($id)->delete();

        return $this->redirect(['index']);
    }

    /**
     * Finds the Approver model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return Approver the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = Approver::findOne($id)) !== null) {
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
