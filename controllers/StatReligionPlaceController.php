<?php

namespace app\controllers;

use app\components\MyHelper;
use app\models\PhiscalYear;
use app\models\Province;
use app\models\StatReligionPlaceDetail;
use Codeception\Util\HttpCode;
use Yii;
use app\models\StatReligionPlace;
use app\models\StatReligionPlaceSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;

/**
 * StatReligionPlaceController implements the CRUD actions for StatReligionPlace model.
 */
class StatReligionPlaceController extends Controller
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
     * Lists all StatReligionPlace models.
     * @return mixed
     */
    public function actionIndex()
    {
        return $this->render('index');
    }


    public function actionGet() {
        $years = PhiscalYear::find()
            ->where(['deleted' => 0])->asArray()->all();

        $provinces = Province::find()
            ->where(['deleted' => 0])
            ->orderBy('province_code')
            ->asArray()->all();

        return json_encode([
            'years' => $years,
            'provinces' => $provinces
        ]);
    }

    public function actionEnquiry($year) {
        $year = PhiscalYear::findOne($year);
        if(!isset($year)) {
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app', 'Inccorect Phiscal Year'));
            return;
        }

        $model = StatReligionPlace::find()->where(['phiscal_year_id' => $year->id])->one();
        if(!isset($model)) {
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app', 'No Data'));
            return;
        }

        $models = Province::find()->alias('p')->select('p.*, d.*')
            ->join('left join', 'stat_religion_place_detail d', 'd.province_id = p.id and d.stat_religion_place_id=:id', [':id' => $model->id])
            ->where(['p.deleted' => 0])->orderBy('p.province_code')->asArray()->all();

        $stat = StatReligionPlaceDetail::find()
            ->select([
                'phiscal_year_id' => 'r.phiscal_year_id',
                'buddhis' => 'sum(d.buddhis_total + d.buddhis_nomonk + d.buddhis_sim + d.buddhis_nosim)',
                'christ' => 'sum(d.christ_cato_total + d.christ_news_total + d.christ_sat_total)',
                'bahai' => 'r.phiscal_year_id, sum(d.bahai_total)',
                'idslam' => 'r.phiscal_year_id, sum(d.idslam_total)',
            ])->alias('d')
            ->join('join', 'stat_religion_place r', 'r.id = d.stat_religion_place_id and r.phiscal_year_id=:year', [':year'=> $year->id])
            ->asArray()->one();
        $data = null;
        if(isset($stat))
            if(isset($stat['phiscal_year_id'])) {
                $percent = 100/($stat['buddhis']+$stat['christ']+$stat['bahai']+$stat['idslam']);
                $data = [
                    number_format($stat['buddhis'] * $percent,2),
                    number_format($stat['christ'] * $percent,2),
                    number_format($stat['bahai'] * $percent,2),
                    number_format($stat['idslam'] * $percent,2),
                ];
            }

        return json_encode([
            'models' => $models,
            'stat' => [
                'labels' => [
                    "ສາສະໜາພຸດ"
                    , "ສາສະໜາເຍຊູຄຣິດ"
                    , "ສາສະໜາບາຮາຍ"
                    , "ສາສະໜາອິດສະລາມ"
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

        $model = StatReligionPlaceDetail::find()
            ->alias('d')
            ->join('join', 'stat_religion_place l', 'l.id = d.stat_religion_place_id and l.phiscal_year_id=:year', [':year' => $year->id])
            ->where(['d.province_id' => $province])
            ->asArray()->one();

        return json_encode([
            'model' => $model
        ]);
    }

    public function actionSave($year) {
        $year = PhiscalYear::findOne($year);
        if(!isset($year)) {
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app', 'Inccorect Phiscal Year'));
            return;
        }

        if($year->status != 'O') {
            MyHelper::response(HttpCode::METHOD_NOT_ALLOWED, Yii::t('app', 'The Year is not allow to input'));
            return;
        }

        $post = Yii::$app->request->post();
        if(!isset($post)) {
            MyHelper::response(HttpCode::BAD_REQUEST, Yii::t('app','Inccorect Request Mehotd'));
            return;
        }

        $transaction = Yii::$app->db->beginTransaction();
        try{
            $model = StatReligionPlace::find()
                ->where(['phiscal_year_id' => $year->id])
                ->one();
            if(!isset($model)) {
                $model = new StatReligionPlace();
                $model->phiscal_year_id = $year->id;
                $model->user_id = Yii::$app->user->id;
            }
            $model->saved = 1;
            $model->last_update = date('Y-m-d H:i:s');
            if(!$model->save()) throw new Exception(json_encode($model->errors));

            $detail = StatReligionPlaceDetail::find()
                ->where(['stat_religion_place_id' => $model->id, 'province_id' => $post['StatReligionPlaceDetail']['province']['id']])
                ->one();
            if(!isset($detail)) {
                $detail = new StatReligionPlaceDetail();
                $detail->province_id = $post['StatReligionPlaceDetail']['province']['id'];
                $detail->stat_religion_place_id = $model->id;
            }
            $detail->buddhis_total = $post['StatReligionPlaceDetail']['buddhis_total'];
            $detail->buddhis_nomonk = $post['StatReligionPlaceDetail']['buddhis_nomonk'];
            $detail->buddhis_sim = $post['StatReligionPlaceDetail']['buddhis_sim'];
            $detail->buddhis_nosim = $post['StatReligionPlaceDetail']['buddhis_nosim'];
            $detail->christ_news_total = $post['StatReligionPlaceDetail']['christ_news_total'];
            $detail->christ_news_not = $post['StatReligionPlaceDetail']['christ_news_not'];
            $detail->christ_sat_total = $post['StatReligionPlaceDetail']['christ_sat_total'];
            $detail->christ_sat_not = $post['StatReligionPlaceDetail']['christ_sat_not'];
            $detail->christ_cato_total = $post['StatReligionPlaceDetail']['christ_cato_total'];
            $detail->christ_cato_not = $post['StatReligionPlaceDetail']['christ_cato_not'];
            $detail->bahai_total = $post['StatReligionPlaceDetail']['bahai_total'];
            $detail->bahai_not = $post['StatReligionPlaceDetail']['bahai_not'];
            $detail->idslam_total = $post['StatReligionPlaceDetail']['idslam_total'];
            $detail->idslam_not = $post['StatReligionPlaceDetail']['idslam_not'];
            $detail->remark = $post['StatReligionPlaceDetail']['remark'];

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

        $model = StatReligionPlace::find()->where(['phiscal_year_id' => $year->id])->one();
        if(!isset($model)) {
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app', 'No Data'));
            return;
        }

        $models = Province::find()->alias('p')->select('p.*, d.*')
            ->join('left join', 'stat_religion_place_detail d', 'd.province_id = p.id and d.stat_religion_place_id=:id', [':id' => $model->id])
            ->where(['p.deleted' => 0])->orderBy('p.province_code')->asArray()->all();

        return $this->renderPartial('../ministry/print', [
            'content' => $this->renderPartial('table', ['models' => $models, "year" => $year])
        ]);
    }

    public function actionDownload($year) {
        $year = PhiscalYear::findOne($year);
        if(!isset($year)) {
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app', 'Inccorect Phiscal Year'));
            return;
        }

        $model = StatReligionPlace::find()->where(['phiscal_year_id' => $year->id])->one();
        if(!isset($model)) {
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app', 'No Data'));
            return;
        }

        $models = Province::find()->alias('p')->select('p.*, d.*')
            ->join('left join', 'stat_religion_place_detail d', 'd.province_id = p.id and d.stat_religion_place_id=:id', [':id' => $model->id])
            ->where(['p.deleted' => 0])->orderBy('p.province_code')->asArray()->all();

        return $this->renderPartial('../ministry/excel', [
            'file' => 'Stat Local Administration '. $year->year .'.xls',
            'content' => $this->renderPartial('table', ['models' => $models, "year" => $year])
        ]);
    }

    /**
     * Finds the StatReligionPlace model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return StatReligionPlace the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = StatReligionPlace::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
}
