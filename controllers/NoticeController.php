<?php

namespace app\controllers;

use app\components\MyHelper;
use app\models\Notice;
use app\models\NoticeSearch;
use Yii;
use yii\base\Exception;
use yii\web\Controller;
use yii\web\NotFoundHttpException;

/**
 * NoticeController implements the CRUD actions for Notice model.
 */
class NoticeController extends Controller
{
    /**
     * @inheritdoc
     */
//    public function behaviors()
//    {
//        return [
//            'verbs' => [
//                'class' => VerbFilter::className(),
//                'actions' => [
//                    'delete' => ['POST'],
//                ],
//            ],
//        ];
//    }

    /**
     * Lists all Notice models.
     * @return mixed
     */
    public function actionIndex()
    {
        $searchModel = new NoticeSearch();
        $searchModel->deleted = 0;
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);
        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single Notice model.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionView($id)
    {
        return $this->render('view', [
            'model' => $this->findModel($id),
        ]);
    }

    /**
     * Creates a new Notice model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $model = new Notice();

        if ($model->load(Yii::$app->request->post())) {
            try {
                $model->created_date = date('Y-m-d H:i:s');
                $model->user_id = Yii::$app->user->id;
                $model->start_date = MyHelper::convertdatefordb($model->start_date);
                $model->end_date = MyHelper::convertdatefordb($model->end_date);
                $model->deleted = 0;
                if (!$model->save()) throw new Exception(json_encode($model->errors));

                $notices = Notice::find()->where(['show' => 1])
                    ->orderBy('position, created_date desc')
                    ->asArray()
                    ->all();
                Yii::$app->session->set('notices', $notices);
                return $this->redirect(['view', 'id' => $model->id]);
            } catch (Exception $exception) {
                Yii::$app->session->setFlash('danger', $exception->getMessage());
            }
        }

        return $this->render('create', [
            'model' => $model,
        ]);
    }

    /**
     * Updates an existing Notice model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionUpdate($id)
    {
        $model = $this->findModel($id);
        if ($model->load(Yii::$app->request->post())) {
            try {
                $model->created_date = date('Y-m-d H:i:s');
                $model->user_id = Yii::$app->user->id;
                $model->start_date = MyHelper::convertdatefordb($model->start_date);
                $model->end_date = MyHelper::convertdatefordb($model->end_date);
                if (!$model->save()) throw new Exception(json_encode($model->errors));
                $notices = Notice::find()->where(['show' => 1])
                    ->orderBy('position, created_date desc')
                    ->asArray()
                    ->all();
                Yii::$app->session->set('notices', $notices);
                return $this->redirect(['view', 'id' => $model->id]);
            } catch (Exception $exception) {
                Yii::$app->session->setFlash('danger', $exception->getMessage());
            }
        }

        return $this->render('update', [
            'model' => $model,
        ]);
    }

    /**
     * Deletes an existing Notice model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionDelete($id)
    {
//        $this->findModel($id)->delete();
        $notice = $this->findModel($id);
        $notice->deleted = 1;
        $notice->show = 0;
        if($notice->save())
            Yii::$app->session->setFlash('success', 'ສຳເລັດ');
        else
            Yii::$app->session->setFlash('danger', json_encode($notice->errors));
        return $this->redirect(['index']);
    }

    /**
     * Finds the Notice model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return Notice the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = Notice::findOne($id)) !== null && ($model->deleted !== 1)) {
            return $model;
        }

        throw new NotFoundHttpException(Yii::t('app', 'The requested page does not exist.'));
    }
}
