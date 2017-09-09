<?php

namespace app\controllers;

use app\models\PhiscalYear;
use app\models\Province;
use app\models\StatReligionDetail;
use Codeception\Util\HttpCode;
use Yii;
use app\models\StatReligion;
use app\models\StatReligionSearch;
use yii\helpers\ArrayHelper;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;

/**
 * StatReligionController implements the CRUD actions for StatReligion model.
 */
class StatReligionController extends Controller
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
     * Lists all StatReligion models.
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
            ->orderBy('position')
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

        $models = Province::find()
            ->alias('p')
            ->select('p.*, d.*')
            ->join('left join', 'stat_religion_detail d', 'd.province_id = p.id')
            ->join('join', 'stat_religion l', 'l.id=d.stat_religion_id and l.phiscal_year_id=:year', [':year'=> $year->id])
            ->where(['p.deleted' => 0])->orderBy('p.position')->asArray()->all();

        $stat = StatReligionDetail::find()
            ->select([
                'phiscal_year_id' => 'r.phiscal_year_id',
                'buddhis' => 'sum(d.buddhis_total)',
                'christ' => 'sum(d.christ_cato_total + d.christ_news_total + d.christ_sat_total)',
                'bahai' => 'r.phiscal_year_id, sum(d.bahai_total)',
                'idslam' => 'r.phiscal_year_id, sum(d.idslam_total)',
                'other' => 'r.phiscal_year_id, sum(d.other_total)',
            ])
            ->alias('d')
            ->join('join', 'stat_religion r', 'r.id = d.stat_religion_id and r.phiscal_year_id=:year', [':year'=> $year->id])
            ->asArray()->one();
        $data = isset($stat)?[$stat['buddhis'], $stat['christ'], $stat['bahai'], $stat['idslam'], $stat['other']]:null;
        return json_encode([
            'models' => $models,
            'stat' => [
                'labels' => [
                    Yii::t('app', 'Buddhism')
                    , Yii::t('app', 'Christ')
                    , Yii::t('app', 'Bahaiy')
                    , Yii::t('app', 'Idslam')
                    , Yii::t('app', 'Others')
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

        $model = StatReligionDetail::find()
            ->alias('d')
            ->join('join', 'stat_religion l', 'l.id = d.stat_religion_id and l.phiscal_year_id=:year', [':year' => $year->id])
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
            $model = StatReligion::find()
                ->where(['phiscal_year_id' => $year->id])
                ->one();
            if(!isset($model)) {
                $model = new StatReligion();
                $model->phiscal_year_id = $year->id;
                $model->user_id = Yii::$app->user->id;
            }
            $model->saved = 1;
            $model->last_update = date('Y-m-d H:i:s');
            if(!$model->save()) throw new Exception(json_encode($model->errors));

            $detail = StatReligionDetail::find()
                ->where(['stat_religion_id' => $model->id, 'province_id' => $post['StatReligionDetail']['province']['id']])
                ->one();
            if(!isset($detail)) {
                $detail = new StatReligionDetail();
                $detail->province_id = $post['StatReligionDetail']['province']['id'];
                $detail->stat_religion_id = $model->id;
            }
            $detail->buddhis_total = $post['StatReligionDetail']['buddhis_total'];
            $detail->buddhis_women = $post['StatReligionDetail']['buddhis_women'];
            $detail->christ_news_total = $post['StatReligionDetail']['christ_news_total'];
            $detail->christ_news_women = $post['StatReligionDetail']['christ_news_women'];
            $detail->christ_sat_total = $post['StatReligionDetail']['christ_sat_total'];
            $detail->christ_sat_women = $post['StatReligionDetail']['christ_sat_women'];
            $detail->christ_cato_total = $post['StatReligionDetail']['christ_cato_total'];
            $detail->christ_cato_women = $post['StatReligionDetail']['christ_cato_women'];
            $detail->bahai_total = $post['StatReligionDetail']['bahai_total'];
            $detail->bahai_women = $post['StatReligionDetail']['bahai_women'];
            $detail->idslam_total = $post['StatReligionDetail']['idslam_total'];
            $detail->idslam_women = $post['StatReligionDetail']['idslam_women'];
            $detail->other_total = $post['StatReligionDetail']['other_total'];
            $detail->other_women = $post['StatReligionDetail']['other_women'];
            $detail->remark = $post['StatReligionDetail']['remark'];

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

        $models = Province::find()
            ->alias('p')
            ->select('p.*, d.*')
            ->join('left join', 'stat_religion_detail d', 'd.province_id = p.id')
            ->join('join', 'stat_religion l', 'l.id=d.stat_religion_id and l.phiscal_year_id=:year', [':year'=> $year->id])
            ->where(['p.deleted' => 0])->orderBy('p.position')->asArray()->all();

        return $this->renderPartial('../ministry/print', [
            'content' => $this->renderPartial('table', ['models' => $models])
        ]);
    }

    public function actionDownload($year) {
        $year = PhiscalYear::findOne($year);
        if(!isset($year)) {
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app', 'Inccorect Phiscal Year'));
            return;
        }

        $models = Province::find()
            ->alias('p')
            ->select('p.*, d.*')
            ->join('left join', 'stat_religion_detail d', 'd.province_id = p.id')
            ->join('join', 'stat_religion l', 'l.id=d.stat_religion_id and l.phiscal_year_id=:year', [':year'=> $year->id])
            ->where(['p.deleted' => 0])->orderBy('p.position')->asArray()->all();

        return $this->renderPartial('../ministry/excel', [
            'file' => 'Stat Local Administration '. $year->year .'.xls',
            'content' => $this->renderPartial('table', ['models' => $models])
        ]);
    }

    /**
     * Finds the StatReligion model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return StatReligion the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = StatReligion::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
}
