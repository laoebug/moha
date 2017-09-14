<?php

namespace app\controllers;

use app\components\MyHelper;
use app\models\PhiscalYear;
use app\models\Province;
use app\models\StatOfficerProvinceUpgradeDetail;
use Codeception\Util\HttpCode;
use Yii;
use app\models\StatOfficerProvinceUpgrade;
use app\models\StatOfficerProvinceUpgradeSearch;
use yii\db\Exception;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;

/**
 * StatOfficerProvinceUpgradeController implements the CRUD actions for StatOfficerProvinceUpgrade model.
 */
class StatOfficerProvinceUpgradeController extends Controller
{

    public $columns = [
        'doctor_in_total', 'doctor_in_women', 'doctor_out_total', 'doctor_out_women',
        'master_in_total', 'master_in_women', 'master_out_total', 'master_out_women',
        'bachelor_in_total', 'bachelor_in_women', 'bachelor_out_total', 'bachelor_out_women',

        'high_in_total', 'high_in_women', 'high_out_total', 'high_out_women',
        'middle_in_total', 'middle_in_women', 'middle_out_total', 'middle_out_women',
        'begin_in_total', 'begin_in_women', 'begin_out_total', 'begin_out_women',
    ];

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
        return $this->render('index', ['cols' => $this->columns]);
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

        $model = StatOfficerProvinceUpgrade::find()->where(['phiscal_year_id' => $year->id])->one();
        if(!isset($model)) {
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app', 'No Data'));
            return;
        }

        $models = Province::find()->alias('m')
            ->select('m.*, d.*')
            ->join('left join', 'stat_officer_province_upgrade_detail d', 'd.province_id=m.id and d.stat_officer_province_upgrade_id=:id', [':id' => $model->id])
            ->where(['deleted' => 0])->orderBy('m.province_code')->asArray()->all();

        $query = StatOfficerProvinceUpgradeDetail::find()
            ->select(['stat_officer_province_upgrade_id' => 'stat_officer_province_upgrade_id']);
        foreach ($this->columns as $column)
            $query->addSelect([$column => "ifnull(sum($column), 0)"]);

        $stat = $query->where(['stat_officer_province_upgrade_id' => $model->id])->asArray()->one();
        $data = null;
        if(isset($stat))
            if(isset($stat['stat_officer_province_upgrade_id'])) {
                $sum = 0;
                foreach ($this->columns as $column)
                    $sum += $stat[$column];
                $percent = 100/$sum;

                foreach ($this->columns as $column)
                    if(strpos($column, 'total'))
                        $data[] = number_format($stat[$column] * $percent,2);
            }

            
        return json_encode([
            'models' => $models,
            'stat' => [
                'series' => [Yii::t('app', 'Organisation Officer Upgrading')],
                'labels' => [
                    Yii::t('app', 'Doctor Local')
                    , Yii::t('app', 'Doctor Oversea')
                    , Yii::t('app', 'Master Local')
                    , Yii::t('app', 'Master Oversea')
                    , Yii::t('app', 'Bachelor Local')
                    , Yii::t('app', 'Bachelor Oversea')

                    , Yii::t('app', 'High Local')
                    , Yii::t('app', 'High Oversea')
                    , Yii::t('app', 'Middle Local')
                    , Yii::t('app', 'Middle Oversea')
                    , Yii::t('app', 'Begin Local')
                    , Yii::t('app', 'Begin Oversea')
                ],
                'data' => $data
            ],
        ]);
    }

    public function actionInquiry($year, $province) {
        $year = PhiscalYear::findOne($year);
        if(!isset($year)) {
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app', 'Inccorect Phiscal Year'));
            return;
        }

        $model = StatOfficerProvinceUpgradeDetail::find()->alias('d')
            ->join('join', 'stat_officer_province_upgrade o', 'o.id = d.stat_officer_province_upgrade_id and o.phiscal_year_id=:year', [':year'=> $year->id])
            ->where(['d.province_id' => $province])
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
            $model = StatOfficerProvinceUpgrade::find()->where(['phiscal_year_id' => $year->id])->one();
            if(!isset($model)) {
                $model = new StatOfficerProvinceUpgrade();
                $model->user_id = Yii::$app->user->id;
                $model->phiscal_year_id = $year->id;
            }
            $model->last_update = date('Y-m-d H:i:s');
            $model->saved = 1;
            if(!$model->save()) throw new Exception(json_encode($model->errors));

            $detail = StatOfficerProvinceUpgradeDetail::find()->alias('d')
                ->join('join', 'stat_officer_province_upgrade o', 'o.id = d.stat_officer_province_upgrade_id and o.phiscal_year_id=:year', [':year'=> $year->id])
                ->where(['province_id' => $post['Model']['province']['id']])
                ->one();

            if(!isset($detail)) {
                $detail = new StatOfficerProvinceUpgradeDetail();
                $detail->stat_officer_province_upgrade_id = $model->id;
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

    public function actionPrint($year) {
        $year = PhiscalYear::findOne($year);
        if(!isset($year)) {
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app', 'Inccorect Phiscal Year'));
            return;
        }

        $model = StatOfficerProvinceUpgrade::find()->where(['phiscal_year_id' => $year->id])->one();
        if(!isset($model)) {
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app', 'No Data'));
            return;
        }

        $models = Province::find()->alias('m')
            ->select('m.*, d.*')
            ->join('left join', 'stat_officer_province_upgrade_detail d', 'd.province_id=m.id and d.stat_officer_province_upgrade_id=:id', [':id' => $model->id])
            ->where(['deleted' => 0])->orderBy('m.province_code')->asArray()->all();

        return $this->renderPartial('../ministry/print', [
            'content' => $this->renderPartial('table', [
                'models' => $models, 'year' => $year, 'cols' => $this->columns
            ])
        ]);
    }

    public function actionDownload($year) {
        $year = PhiscalYear::findOne($year);
        if(!isset($year)) {
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app', 'Inccorect Phiscal Year'));
            return;
        }

        $model = StatOfficerProvinceUpgrade::find()->where(['phiscal_year_id' => $year->id])->one();
        if(!isset($model)) {
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app', 'No Data'));
            return;
        }

        $models = Province::find()->alias('m')
            ->select('m.*, d.*')
            ->join('left join', 'stat_officer_province_upgrade_detail d', 'd.province_id=m.id and d.stat_officer_province_upgrade_id=:id', [':id' => $model->id])
            ->where(['deleted' => 0])->orderBy('m.province_code')->asArray()->all();

        return $this->renderPartial('../ministry/excel', [
            'file' => 'Stat Officers Province Upgrade '. $year->year . '.xls',
            'content' => $this->renderPartial('table', ['models' => $models, 'year' => $year, 'cols' => $this->columns])
        ]);
    }
    
    /**
     * Finds the StatOfficerProvinceUpgrade model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return StatOfficerProvinceUpgrade the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = StatOfficerProvinceUpgrade::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
}
