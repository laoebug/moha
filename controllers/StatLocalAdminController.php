<?php

namespace app\controllers;

use app\components\MyHelper;
use app\models\LegalType;
use app\models\PhiscalYear;
use app\models\Province;
use app\models\StatLocalAdminDetail;
use Codeception\Util\HttpCode;
use Yii;
use app\models\StatLocalAdmin;
use yii\db\Exception;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;

/**
 * StatLocalAdminController implements the CRUD actions for StatLocalAdmin model.
 */
class StatLocalAdminController extends Controller
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
     * Lists all StatLocalAdmin models.
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
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app', 'Incorrect Phiscal Year'));
            return;
        }

        $model = StatLocalAdmin::find()->where(['phiscal_year_id' => $year->id])->one();
        if(!isset($model)) {
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app', 'No Data'));
            return;
        }

        $models = Province::find()
            ->alias('p')
            ->select('p.*, d.*')
            ->join('left join', 'stat_local_admin_detail d', 'd.province_id = p.id and d.stat_local_admin_id=:id', [':id' => $model->id])
            ->where(['p.deleted' => 0])->orderBy('p.province_code')->asArray()->all();

        return json_encode([
            'models' => $models
        ]);
    }

    public function actionInquiry($year, $province) {
        $year = PhiscalYear::findOne($year);
        if(!isset($year)) {
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app', 'Incorrect Phiscal Year'));
            return;
        }

        $model = StatLocalAdminDetail::find()
            ->alias('d')
            ->join('join', 'stat_local_admin l', 'l.id = d.stat_local_admin_id and l.phiscal_year_id=:year', [':year' => $year->id])
            ->where(['province_id' => $province])
            ->asArray()->one();

        return json_encode([
            'model' => $model
        ]);
    }

    public function actionSave($year) {
        $year = PhiscalYear::findOne($year);
        if(!isset($year)) {
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app', 'Incorrect Phiscal Year'));
            return;
        }

        if($year->status != 'O') {
            MyHelper::response(HttpCode::METHOD_NOT_ALLOWED, Yii::t('app', 'The Year is not allow to input'));
            return;
        }

        $post = Yii::$app->request->post();
        if(!isset($post)) {
            MyHelper::response(HttpCode::BAD_REQUEST, Yii::t('app','Incorrect Request Mehotd'));
            return;
        }

        $transaction = Yii::$app->db->beginTransaction();
        try{
            $model = StatLocalAdmin::find()
                ->where(['phiscal_year_id' => $year->id])
                ->one();
            if(!isset($model)) {
                $model = new StatLocalAdmin();
                $model->phiscal_year_id = $year->id;
                $model->user_id = Yii::$app->user->id;
            }
            $model->saved = 1;
            $model->last_update = date('Y-m-d H:i:s');
            if(!$model->save()) throw new Exception(json_encode($model->errors));

            $detail = StatLocalAdminDetail::find()
                ->where(['stat_local_admin_id' => $model->id, 'province_id' => $post['StatLocalAdminDetail']['province']['id']])
                ->one();
            if(!isset($detail)) {
                $detail = new StatLocalAdminDetail();
                $detail->province_id = $post['StatLocalAdminDetail']['province']['id'];
                $detail->stat_local_admin_id = $model->id;
            }
            $detail->province_head_total = $post['StatLocalAdminDetail']['province_head_total'];
            $detail->province_head_women = $post['StatLocalAdminDetail']['province_head_women'];
            $detail->province_vice_total = $post['StatLocalAdminDetail']['province_vice_total'];
            $detail->province_vice_women = $post['StatLocalAdminDetail']['province_vice_women'];
            $detail->district_head_total = $post['StatLocalAdminDetail']['district_head_total'];
            $detail->district_head_women = $post['StatLocalAdminDetail']['district_head_women'];
            $detail->district_vice_total = $post['StatLocalAdminDetail']['district_vice_total'];
            $detail->district_vice_women = $post['StatLocalAdminDetail']['district_vice_women'];
            $detail->village_head_total = $post['StatLocalAdminDetail']['village_head_total'];
            $detail->village_head_women = $post['StatLocalAdminDetail']['village_head_women'];
            $detail->village_vice_total = $post['StatLocalAdminDetail']['village_vice_total'];
            $detail->village_vice_women = $post['StatLocalAdminDetail']['village_vice_women'];

            $detail->population_total = $post['StatLocalAdminDetail']['population_total'];
            $detail->population_women = $post['StatLocalAdminDetail']['population_women'];
            $detail->village = $post['StatLocalAdminDetail']['village'];
            $detail->family_total = $post['StatLocalAdminDetail']['family_total'];
            $detail->family_poor = $post['StatLocalAdminDetail']['family_poor'];

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
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app', 'Incorrect Phiscal Year'));
            return;
        }

        $model = StatLocalAdmin::find()->where(['phiscal_year_id' => $year->id])->one();
        if(!isset($model)) {
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app', 'No Data'));
            return;
        }

        $models = Province::find()
            ->alias('p')
            ->select('p.*, d.*')
            ->join('left join', 'stat_local_admin_detail d', 'd.province_id = p.id and d.stat_local_admin_id=:id', [':id' => $model->id])
            ->where(['p.deleted' => 0])->orderBy('p.province_code')->asArray()->all();

        return $this->renderPartial('../ministry/print', [
            'content' => $this->renderPartial('table', ['year' => $year, 'models' => $models])
        ]);
    }

    public function actionDownload($year) {
        $year = PhiscalYear::findOne($year);
        if(!isset($year)) {
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app', 'Incorrect Phiscal Year'));
            return;
        }

        $model = StatLocalAdmin::find()->where(['phiscal_year_id' => $year->id])->one();
        if(!isset($model)) {
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app', 'No Data'));
            return;
        }

        $models = Province::find()
            ->alias('p')
            ->select('p.*, d.*')
            ->join('left join', 'stat_local_admin_detail d', 'd.province_id = p.id and d.stat_local_admin_id=:id', [':id' => $model->id])
            ->where(['p.deleted' => 0])->orderBy('p.province_code')->asArray()->all();

        return $this->renderPartial('../ministry/excel', [
            'file' => 'Stat Local Administration '. $year->year .'.xls',
            'content' => $this->renderPartial('table', ['year' => $year, 'models' => $models])
        ]);
    }

    /**
     * Finds the StatLocalAdmin model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return StatLocalAdmin the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = StatLocalAdmin::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException(Yii::t('app','The requested page does not exist.'));
        }
    }
}
