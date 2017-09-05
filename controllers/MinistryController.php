<?php

namespace app\controllers;

use app\components\MyHelper;
use app\models\PhiscalYear;
use Codeception\Util\HttpCode;
use Yii;
use app\models\Ministry;
use app\models\MinistrySearch;
use yii\web\Controller;
use yii\web\MethodNotAllowedHttpException;
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
            if(!isset($year)) {
                MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app', 'Inccorect Phiscal Year'));
                return;
            }
            if($year->status != 'O') {
                MyHelper::response(HttpCode::METHOD_NOT_ALLOWED, Yii::t('app', 'The Year is not allowed to input'));
                return;
            }

            if($post['create'] == 1) {
                $model = new Ministry();
                $model->deleted = 0;
            } else {
                $model = Ministry::findOne($post['Ministry']['id']);
                if(!isset($model)) {
                    MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app', 'The Ministry is Not Found'));
                    return;
                }
            }
            $model->load($post);
            $model->user_id = Yii::$app->user->id;
            $model->phiscal_year_id = $year->id;
            $model->last_update = date('Y-m-d H:i:s');
            if(!$model->save()) {
                MyHelper::response(HttpCode::INTERNAL_SERVER_ERROR, json_encode($model->errors));
                return;
            }

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
                if(!$model->save()) {
                    MyHelper::response(HttpCode::INTERNAL_SERVER_ERROR, json_encode($model->errors));
                    return;
                }
            }
        }
    }

    public function actionPrint($year) {
        $year = PhiscalYear::findOne($year);
        if(!isset($year)) {
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app', 'Inccorect Phiscal Year'));
            return;
        }

        $ministries = Ministry::find()->where(['deleted' => 0, 'phiscal_year_id' => $year])->orderBy('position')->asArray()->all();
        return $this->renderPartial('print', [
            'content' => $this->renderPartial('table', ['ministries' => $ministries, 'year' => $year])
        ]);
    }

    public function actionDownload($year) {
        $year = PhiscalYear::findOne($year);
        if(!isset($year)) {
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app', 'Inccorect Phiscal Year'));
            return;
        };

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
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app', 'The requested page does not exist.'));
            return;
        }
    }
}
