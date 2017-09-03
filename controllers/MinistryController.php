<?php

namespace app\controllers;

use app\models\PhiscalYear;
use Yii;
use app\models\Ministry;
use app\models\MinistrySearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;

/**
 * MinistryController implements the CRUD actions for Ministry model.
 */
class MinistryController extends Controller
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
     * Lists all Ministry models.
     * @return mixed
     */
    public function actionIndex()
    {
        return $this->render('index');
    }

    public function actionGet() {
        return json_encode([
            'years' => PhiscalYear::find()->where(['deleted' => 0])->asArray()->all()
        ]);
    }

    public function actionEnquiry($year) {
        return json_encode([
            'ministries' => Ministry::find()->where(['deleted' => 0, 'phiscal_year_id' => $year])->orderBy('position')->asArray()->all()
        ]);
    }

    public function actionSave($year) {
        $post = Yii::$app->request->post();
        if(isset($post)) {
            $year = PhiscalYear::findOne($year);
            if(!isset($year)) throw new NotFoundHttpException(Yii::t('app', 'Inccorect Phiscal Year'));
            if($year->status != 'O') throw new MethodNotAllowedHttpException(Yii::t('app', 'The Year is not allowed to input'));

            if($post['create'] == 1) {
                $model = new Ministry();
                $model->deleted = 0;
            } else {
                $model = Ministry::findOne($post['Ministry']['id']);
                if(!isset($model)) throw new NotFoundHttpException(Yii::t('app', 'The Ministry is Not Found'));
            }
            $model->load($post);
            $model->user_id = Yii::$app->user->id;
            $model->phiscal_year_id = $year->id;
            $model->last_update = date('Y-m-d H:i:s');
            if(!$model->save()) throw new ServerErrorHttpException(json_encode($model->errors));

        }
    }

    public function actionDelete() {
        $post = Yii::$app->request->post();
        if(isset($post)) {
            if(isset($post['Ministry'])) {
                $model = $this->findModel($post['Ministry']['id']);
                $model->deleted = 1;
                $model->last_update = date('Y-m-d H:i:s');
                $model->user_id = Yii::$app->user->id;
                if(!$model->save()) throw new Exception(json_encode($model->errors));
            }
        }
    }

    public function actionPrint($year) {
        $year = PhiscalYear::findOne($year);
        if(!isset($year)) throw new NotFoundHttpException(Yii::t('app', 'Inccorect Phiscal Year'));

        $ministries = Ministry::find()->where(['deleted' => 0, 'phiscal_year_id' => $year])->orderBy('position')->asArray()->all();
        return $this->renderPartial('print', [
            'content' => $this->renderPartial('table', ['ministries' => $ministries, 'year' => $year])
        ]);
    }

    public function actionDownload($year) {
        $year = PhiscalYear::findOne($year);
        if(!isset($year)) throw new NotFoundHttpException(Yii::t('app', 'Inccorect Phiscal Year'));

        $ministries = Ministry::find()->where(['deleted' => 0, 'phiscal_year_id' => $year])->orderBy('position')->asArray()->all();
        return $this->renderPartial('excel', [
            'file' => 'ministries_'.$year->year.'.xls',
            'content' => $this->renderPartial('table', ['ministries' => $ministries, 'year' => $year->id])
        ]);
    }
    /**
     * Finds the Ministry model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return Ministry the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = Ministry::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException(Yii::t('app', 'The requested page does not exist.'));
        }
    }
}
