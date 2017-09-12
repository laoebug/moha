<?php

namespace app\controllers;

use app\components\MyHelper;
use app\models\PhiscalYear;
use app\models\StatOfficerAgeDetail;
use Codeception\Util\HttpCode;
use Yii;
use app\models\StatOfficerAge;
use app\models\StatOfficerAgeSearch;
use yii\db\Exception;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;

/**
 * StatOfficerAgeController implements the CRUD actions for StatOfficerAge model.
 */
class StatOfficerAgeController extends Controller
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
     * Lists all StatOfficerAge models.
     * @return mixed
     */
    public function actionIndex()
    {
        return $this->render('index');
    }

    public function actionGet() {
        $years = PhiscalYear::find()
            ->where(['deleted' => 0])->asArray()->all();

        return json_encode([
            'years' => $years,
        ]);
    }

    public function actionEnquiry($year) {
        $year = PhiscalYear::findOne($year);
        if(!isset($year)) {
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app', 'Inccorect Phiscal Year'));
            return;
        }

        $model = StatOfficerAgeDetail::find()->alias('d')
            ->join('join', 'stat_officer_age o', 'o.id = d.stat_officer_age_id and o.phiscal_year_id=:year', [':year'=> $year->id])
            ->asArray()->one();

        return json_encode([
            'model' => $model
        ]);
    }

    public function actionSave($year) {
        $post = Yii::$app->request->post();
        if(!isset($post['Model'])) {
            MyHelper::response(HttpCode::BAD_REQUEST, Yii::t('app', 'Inccorect Request Method'));
            return;
        }
        $year = PhiscalYear::findOne($year);
        if(!isset($year)) {
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app', 'Inccorect Phiscal Year'));
            return;
        }
        if($year->status != 'O') {
            MyHelper::response(HttpCode::METHOD_NOT_ALLOWED, Yii::t('app', 'The Year is not allowed to input'));
            return;
        }

        $transaction = Yii::$app->db->beginTransaction();
        try {
            $model = StatOfficerAge::find()->where(['phiscal_year_id' => $year->id])->one();
            if(!isset($model)) {
                $model = new StatOfficerAge();
                $model->user_id = Yii::$app->user->id;
                $model->phiscal_year_id = $year->id;
            }
            $model->last_update = date('Y-m-d H:i:s');
            $model->saved = 1;
            if(!$model->save()) throw new Exception(json_encode($model->errors));

            $detail = StatOfficerAgeDetail::find()->alias('d')
                ->join('join', 'stat_officer_age o', 'o.id = d.stat_officer_age_id and o.phiscal_year_id=:year', [':year'=> $year->id])
                ->one();

            if(!isset($detail)) {
                $detail = new StatOfficerAgeDetail();
                $detail->stat_officer_age_id = $model->id;
            }
            $detail->attributes = $post['Model'];
            if(!$detail->save()) throw new Exception(json_encode($detail->errors));
            $transaction->commit();
        } catch (Exception $exception) {
            $transaction->rollBack();
            MyHelper::response(HttpCode::INTERNAL_SERVER_ERROR, $exception->getMessage());
            return;
        }
    }

    public function actionPrint($year) {
        $year = PhiscalYear::findOne($year);
        if(!isset($year)) {
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app', 'Inccorect Phiscal Year'));
            return;
        }

        $model = StatOfficerAgeDetail::find()->alias('d')
            ->join('join', 'stat_officer_age o', 'o.id = d.stat_officer_age_id and o.phiscal_year_id=:year', [':year'=> $year->id])
            ->one();

        return $this->renderPartial('../ministry/print', [
            'content' => $this->renderPartial('table', ['model' => $model, 'year' => $year])
        ]);
    }

    public function actionDownload($year) {
        $year = PhiscalYear::findOne($year);
        if(!isset($year)) {
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app', 'Inccorect Phiscal Year'));
            return;
        }

        $model = StatOfficerAgeDetail::find()->alias('d')
            ->join('join', 'stat_officer_age o', 'o.id = d.stat_officer_age_id and o.phiscal_year_id=:year', [':year'=> $year->id])
            ->one();

        return $this->renderPartial('../ministry/excel', [
            'file' => 'Stat Officers By Ages'. $year->year . '.xls',
            'content' => $this->renderPartial('table', ['model' => $model, 'year' => $year])
        ]);
    }

    /**
     * Finds the StatOfficerAge model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return StatOfficerAge the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = StatOfficerAge::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
}
