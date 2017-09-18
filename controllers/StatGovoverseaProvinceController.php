<?php

namespace app\controllers;

use app\components\MyHelper;
use app\models\Award;
use app\models\PhiscalYear;
use app\models\Province;
use app\models\StatGovoverseaProvinceDetail;
use Codeception\Util\HttpCode;
use Yii;
use app\models\StatGovoverseaProvince;
use app\models\StatGovoverseaProvinceSearch;
use yii\db\Exception;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;

/**
 * StatGovoverseaProvinceController implements the CRUD actions for StatGovoverseaProvince model.
 */
class StatGovoverseaProvinceController extends Controller
{
    public $columns = [
        'labo_personal','labo_team',
        'deve_personal','deve_team',
        'memo_personal','memo_team',
        'amer_personal','amer_team',
        'fran_personal','fran_team',
        'gove_personal','gove_team',
    ];

    public $lables = ['ຫຼຽນກາແຮງງານ', 'ຫຼຽນກາພັດທະນາ', 'ຫຼຽນກາລະນຶກ 5 ປີ', 'ຫຼຽນກາຕໍ່ຕ້ານ A', 'ຫຼຽນກາຕໍ່ຕ້ານ F', 'ໃບຍ້ອງຍໍລັດຖະບານ'];

    public function actionIndex()
    {
        return $this->render('index', [
            'labels' => $this->lables,
        ]);
    }

    public function actionGet() {
        $years = PhiscalYear::find()->where(['deleted' => 0])->asArray()->all();
        $awards = Award::find()->where(['deleted' => 0])->orderBy('position')->asArray()->all();
        $provinces = Province::find()->where(['deleted' =>0])->orderBy('province_code')->asArray()->all();

        return json_encode([
            'years' => $years,
            'awards' => $awards,
            'provinces' => $provinces
        ]);
    }

    public function actionEnquiry($year) {
        $year = PhiscalYear::findOne($year);
        if(!isset($year)) {
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app', 'Incorrect Phiscal Year'));
            return;
        }
        $models = StatGovoverseaProvinceDetail::find()->alias('d')
            ->select([
                'd.*',
                'province' => 'm.province_name',
                'award' => 'a.name'
            ])
            ->join('join', 'stat_govoversea_province t', 't.id=d.stat_govoversea_province_id and t.phiscal_year_id=:year', [':year'=> $year->id])
            ->join('join', 'province m', 'm.id=d.province_id')
            ->join('join', 'award a', 'a.id=d.award_id')
            ->orderBy('m.province_code')
            ->asArray()->all();

        return json_encode([
            'models' => $models
        ]);
    }

    public function actionInquiry($year, $province, $award) {
        $year = PhiscalYear::findOne($year);
        if(!isset($year)) {
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app', 'Incorrect Phiscal Year'));
            return;
        }

        $model = StatGovoverseaProvinceDetail::find()->alias('d')
            ->join('join', 'stat_govoversea_province m', 'm.id = d.stat_govoversea_province_id and m.phiscal_year_id=:year', [':year' => $year->id])
            ->where([
                'award_id' => $award,
                'province_id' => $province,
            ])->asArray()->one();

        return json_encode(['model' => $model]);
    }

    public function actionSave($year) {
        $year = PhiscalYear::findOne($year);
        if(!isset($year)) {
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app', 'Incorrect Phiscal Year'));
            return;
        }

        $post = Yii::$app->request->post();
        if(isset($post)) {
            $transaction = Yii::$app->db->beginTransaction();
            try {
                $model = StatGovoverseaProvince::find()->where(['phiscal_year_id' => $year->id])->one();
                if (!isset($model)) {
                    $model = new StatGovoverseaProvince();
                    $model->phiscal_year_id = $year->id;
                    $model->user_id = Yii::$app->user->id;
                }
                $model->last_update = date('Y-m-d H:i:s');
                $model->saved = 1;

                if (!$model->save()) throw new Exception(json_encode($model->errors));

                $detail = StatGovoverseaProvinceDetail::find()
                    ->where([
                        'stat_govoversea_province_id' => $model->id,
                        'province_id' => $post['Model']['province']['id'],
                        'award_id' => $post['Model']['award']['id'],
                    ])->one();
                if(!isset($detail)) {
                    $detail = new StatGovoverseaProvinceDetail();
                    $detail->province_id = $post['Model']['province']['id'];
                    $detail->award_id = $post['Model']['award']['id'];
                    $detail->stat_govoversea_province_id = $model->id;
                }
                $detail->attributes = $post['Model'];

                if (!$detail->save()) throw new Exception(json_encode($detail->errors));

                $transaction->commit();
            } catch (Exception $exception) {
                $transaction->rollBack();
                MyHelper::response(HttpCode::INTERNAL_SERVER_ERROR, $exception->getMessage());
                return;
            }
        }
    }

    public function actionPrint($year) {
        $year = PhiscalYear::findOne($year);
        if(!isset($year)) {
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app', 'Incorrect Phiscal Year'));
            return;
        }

        $models = StatGovoverseaProvinceDetail::find()->alias('d')
            ->select([
                'd.*',
                'province' => 'm.province_name',
                'award' => 'a.name'
            ])
            ->join('join', 'stat_govoversea_province t', 't.id=d.stat_govoversea_province_id and t.phiscal_year_id=:year', [':year'=> $year->id])
            ->join('join', 'province m', 'm.id=d.province_id')
            ->join('join', 'award a', 'a.id=d.award_id')
            ->asArray()->all();


        return $this->renderPartial('../ministry/print', [
            'content' => $this->renderPartial('table', [
                'models' => $models,
                'year' => $year,
                'cols' => $this->columns,
                'labels' => $this->lables,
            ])
        ]);
    }

    public function actionDownload($year) {
        $year = PhiscalYear::findOne($year);
        if(!isset($year)) {
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app', 'Incorrect Phiscal Year'));
            return;
        }
        $models = StatGovoverseaProvinceDetail::find()->alias('d')
            ->select([
                'd.*',
                'province' => 'm.province_name',
                'award' => 'a.name'
            ])
            ->join('join', 'stat_govoversea_province t', 't.id=d.stat_govoversea_province_id and t.phiscal_year_id=:year', [':year'=> $year->id])
            ->join('join', 'province m', 'm.id=d.province_id')
            ->join('join', 'award a', 'a.id=d.award_id')
            ->asArray()->all();

        return $this->renderPartial('../ministry/excel', [
            'file' => 'Gov Oversea Province '. $year->year . '.xls',
            'content' => $this->renderPartial('table', [
                'models' => $models,
                'year' => $year,
                'cols' => $this->columns,
                'labels' => $this->lables,
            ])
        ]);
    }

    /**
     * Finds the StatGovoverseaProvince model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return StatGovoverseaProvince the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = StatGovoverseaProvince::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
}
