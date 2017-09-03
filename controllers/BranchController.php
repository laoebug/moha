<?php

namespace app\controllers;

use app\models\PhiscalYear;
use Yii;
use app\models\Branch;
use app\models\BranchSearch;
use yii\db\Exception;
use yii\web\Controller;
use yii\web\MethodNotAllowedHttpException;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use yii\web\ServerErrorHttpException;

/**
 * BranchController implements the CRUD actions for Branch model.
 */
class BranchController extends Controller
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
     * Lists all Branch models.
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
            'branches' => Branch::find()->where(['deleted' => 0])->orderBy('position')->asArray()->all()
        ]);
    }

    public function actionSave($year) {
        $post = Yii::$app->request->post();
        if(isset($post)) {
            $year = PhiscalYear::findOne($year);
            if(!isset($year)) throw new NotFoundHttpException(Yii::t('app', 'Inccorect Phiscal Year'));
            if($year->status != 'O') throw new MethodNotAllowedHttpException(Yii::t('app', 'The Year is not allowed to input'));

            if($post['create'] == 1) {
                $model = new Branch();
                $model->deleted = 0;
            } else {
                $model = Branch::findOne($post['Branch']['id']);
                if(!isset($model)) {
                    throw new NotFoundHttpException(Yii::t('app', 'The Ministry is Not Found'));
                }
            }
            $model->load($post);
            $model->user_id = Yii::$app->user->id;
            $model->phiscal_year_id = $year->id;
            $model->last_update = date('Y-m-d H:i:s');
            if(!$model->save()) {
                throw new ServerErrorHttpException(json_encode([
                    'errors' => $model->errors,
                    'attributes' => $model->attributes
                ]));
            }
        }
    }

    public function actionDelete() {
        $post = Yii::$app->request->post();
        if(isset($post)) {
            if(isset($post['Branch'])) {
                $model = $this->findModel($post['Branch']['id']);
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

        $branches = Branch::find()->where(['deleted' => 0])->orderBy('position')->asArray()->all();
        return $this->renderPartial('print', [
            'content' => $this->renderPartial('table', ['branches' => $branches, 'year' => $year])
        ]);
    }

    public function actionDownload($year) {
        $year = PhiscalYear::findOne($year);
        if(!isset($year)) throw new NotFoundHttpException(Yii::t('app', 'Inccorect Phiscal Year'));

        $branches = Branch::find()->where(['deleted' => 0])->orderBy('position')->asArray()->all();
        return $this->renderPartial('excel', [
            'file' => 'branch_'.$year->year.'.xls',
            'content' => $this->renderPartial('table', ['branches' => $branches, 'year' => $year->id])
        ]);
    }
    /**
     * Finds the Branch model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return Branch the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = Branch::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException(Yii::t('app', 'The requested page does not exist.'));
        }
    }
}
