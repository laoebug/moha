<?php

namespace app\controllers;

use app\components\MyHelper;
use app\models\PhiscalYear;
use app\models\PhiscalYearSearch;
use app\services\AuthenticationService;
use Yii;
use yii\web\Controller;
use yii\web\NotFoundHttpException;

/**
 * PhiscalYearController implements the CRUD actions for PhiscalYear model.
 */
class PhiscalYearController extends Controller
{
    /**
     * Lists all PhiscalYear models.
     *
     * @return mixed
     */
    public function actionIndex()
    {
        $searchModel = new PhiscalYearSearch ();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider
        ]);
    }

    /**
     * Creates a new PhiscalYear model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     *
     * @return mixed
     */
    public function actionCreate()
    {
        $model = new PhiscalYear ();

        if ($model->load(Yii::$app->request->post())) {
            $model->start_date = MyHelper::convertdatefordb($model->start_date);
            $model->end_date = MyHelper::convertdatefordb($model->end_date);
            if ($model->save())
                Yii::$app->session->setFlash("success", Yii::t('app', 'Operation Success'));
            else
                Yii::$app->session->setFlash("danger", json_encode($model->errors));

            return $this->redirect([
                "index"
            ]);
        } else {
            return $this->render('create', [
                'model' => $model
            ]);
        }
    }

    /**
     * Updates an existing PhiscalYear model.
     * If update is successful, the browser will be redirected to the 'view' page.
     *
     * @param integer $id
     * @return mixed
     */
    public function actionUpdate($id)
    {
        $model = $this->findModel($id);
        $post = Yii::$app->request->post();
        if ($model->load($post)) {
            $model->start_date = MyHelper::convertdatefordb($model->start_date);
            $model->end_date = MyHelper::convertdatefordb($model->end_date);

            if ($model->save())
                Yii::$app->session->setFlash("success", Yii::t('app', 'Operation Success'));
            else
                Yii::$app->session->setFlash("danger", json_encode($model->errors));

            return $this->redirect([
                'index'
            ]);
        }

        $model->start_date = MyHelper::convertdatefordisplay($model->start_date);
        $model->end_date = MyHelper::convertdatefordisplay($model->end_date);
        return $this->render('update', [
            'model' => $model
        ]);
    }

    /**
     * Finds the PhiscalYear model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     *
     * @param integer $id
     * @return PhiscalYear the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = PhiscalYear::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException ('The requested page does not exist.');
        }
    }

    public function beforeAction($action)
    {
        $user = Yii::$app->user->identity;
        $this->enableCsrfValidation = true;
        $controller_id = Yii::$app->controller->id;
        $acton_id = Yii::$app->controller->action->id;
        if ($user->role ["name"] != Yii::$app->params ['DEFAULT_ADMIN_ROLE']) {
            if (!AuthenticationService::isAccessibleAction($controller_id, $acton_id)) {
                if (Yii::$app->request->isAjax) {
                    MyHelper::response(HttpCode::UNAUTHORIZED, Yii::t('app', 'HTTP Error 401- You are not authorized to access this operaton due to invalid authentication') . " with ID:  " . $controller_id . "/ " . $acton_id);
                    return;
                } else {
                    return $this->redirect([
                        'authentication/notallowed'
                    ]);
                }
            }
        }

        return parent::beforeAction($action);
    }
}
