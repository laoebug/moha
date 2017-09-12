<?php

namespace app\controllers;

use app\components\MyHelper;
use app\models\PhiscalYear;
use app\models\Province;
use app\models\StatOfficerProvinceDetail;
use Codeception\Util\HttpCode;
use Yii;
use app\models\StatOfficerProvince;
use app\models\StatOfficerProvinceSearch;
use yii\db\ActiveQuery;
use yii\db\Exception;
use yii\helpers\ArrayHelper;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;

/**
 * StatOfficerProvinceController implements the CRUD actions for StatOfficerProvince model.
 */
class StatOfficerProvinceController extends Controller
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
     * Lists all StatOfficerProvince models.
     * @return mixed
     */
    public function actionIndex()
    {
        return $this->render('index');
    }

    public function actionGet() {
        $years = PhiscalYear::find()->where(['deleted' => 0])->asArray()->all();
        $provinces = Province::find()->where(['deleted' => 0])->orderBy('province_code')->asArray()->all();

        return json_encode([
            'years' => $years,
            'provinces' => $provinces,
        ]);
    }

    public function actionEnquiry($year) {
        $year = PhiscalYear::findOne($year);
        if(!isset($year)) {
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app', 'Inccorect Phiscal Year'));
            return;
        }

        $model = StatOfficerProvince::find()->where(['phiscal_year_id' => $year->id])->one();
        if(!isset($model)) {
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app', 'No Data'));
            return;
        }

        $models = Province::find()->alias('m')
            ->select([
                'm.*',
                'total' => 'ifnull(d.total, 0)',
                'women' => 'ifnull(d.women, 0)'
            ])
            ->join('left join', 'stat_officer_province_detail d', 'd.province_id = m.id and d.stat_officer_province_id=:id', [':id' => $model->id])
            ->where(['m.deleted' => 0])->orderBy('m.province_code')->asArray()->all();

        return json_encode([
            'models' => $models,
            'stat' => [
                'labels' => ArrayHelper::getColumn($models, 'province_name'),
                'series' => [Yii::t('app', 'Total'), Yii::t('app', 'Women')],
                'data' => [
                    ArrayHelper::getColumn($models, 'total'),
                    ArrayHelper::getColumn($models, 'women')
                ]
            ],
        ]);
    }

    public function actionInquiry($year, $province) {
        $year = PhiscalYear::findOne($year);
        if(!isset($year)) {
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app', 'Inccorect Phiscal Year'));
            return;
        }

        $model = StatOfficerProvinceDetail::find()->alias('d')
            ->join('join', 'stat_officer_province o', 'o.id = d.stat_officer_province_id and o.phiscal_year_id=:year', [':year'=> $year->id])
            ->where(['province_id' => $province])
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
            $model = StatOfficerProvince::find()->where(['phiscal_year_id' => $year->id])->one();
            if(!isset($model)) {
                $model = new StatOfficerProvince();
                $model->user_id = Yii::$app->user->id;
                $model->phiscal_year_id = $year->id;
            }
            $model->last_update = date('Y-m-d H:i:s');
            $model->saved = 1;
            if(!$model->save()) throw new Exception(json_encode($model->errors));

            $detail = StatOfficerProvinceDetail::find()->alias('d')
                ->join('join', 'stat_officer_province o', 'o.id = d.stat_officer_province_id and o.phiscal_year_id=:year', [':year'=> $year->id])
                ->where(['province_id' => $post['Model']['province']['id']])
                ->one();

            if(!isset($detail)) {
                $detail = new StatOfficerProvinceDetail();
                $detail->stat_officer_province_id = $model->id;
                $detail->province_id = $post['Model']['province']['id'];
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

    /**
     * Finds the StatOfficerProvince model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return StatOfficerProvince the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = StatOfficerProvince::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
}
