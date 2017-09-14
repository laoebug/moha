<?php

namespace app\controllers;

use app\components\MyHelper;
use app\models\Ministry;
use app\models\PhiscalYear;
use app\models\StatOfficerMinistryUpgradeDetail;
use Codeception\Util\HttpCode;
use Yii;
use app\models\StatOfficerMinistryUpgrade;
use app\models\StatOfficerMinistryUpgradeSearch;
use yii\db\Exception;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;

/**
 * StatOfficerMinistryUpgradeController implements the CRUD actions for StatOfficerMinistryUpgrade model.
 */
class StatOfficerMinistryUpgradeController extends Controller
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
     * Lists all StatOfficerMinistry models.
     * @return mixed
     */
    public function actionIndex()
    {
        return $this->render('index', ['cols' => $this->columns]);
    }

    public function actionGet() {
        $years = PhiscalYear::find()->where(['deleted' => 0])->asArray()->all();
        $ministries = Ministry::find()->where(['deleted' => 0])->orderBy('position')->asArray()->all();

        return json_encode([
            'years' => $years,
            'ministries' => $ministries,
        ]);
    }

    public function actionEnquiry($year) {
        $year = PhiscalYear::findOne($year);
        if(!isset($year)) {
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app', 'Inccorect Phiscal Year'));
            return;
        }

        $model = StatOfficerMinistryUpgrade::find()->where(['phiscal_year_id' => $year->id])->one();
        if(!isset($model)) {
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app', 'No Data'));
            return;
        }

        $models = Ministry::find()->alias('m')
            ->select('m.*, d.*')
            ->join('left join', 'stat_officer_ministry_upgrade_detail d', 'd.ministry_id=m.id and d.stat_officer_ministry_upgrade_id=:id', [':id' => $model->id])
            ->where(['deleted' => 0])->orderBy('m.position')->asArray()->all();
        return json_encode([
            'models' => $models,
        ]);
    }

    public function actionInquiry($year, $ministry) {
        $year = PhiscalYear::findOne($year);
        if(!isset($year)) {
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app', 'Inccorect Phiscal Year'));
            return;
        }

        $model = StatOfficerMinistryUpgradeDetail::find()->alias('d')
            ->join('join', 'stat_officer_ministry_upgrade o', 'o.id = d.stat_officer_ministry_upgrade_id and o.phiscal_year_id=:year', [':year'=> $year->id])
            ->where(['d.ministry_id' => $ministry])
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
            $model = StatOfficerMinistryUpgrade::find()->where(['phiscal_year_id' => $year->id])->one();
            if(!isset($model)) {
                $model = new StatOfficerMinistryUpgrade();
                $model->user_id = Yii::$app->user->id;
                $model->phiscal_year_id = $year->id;
            }
            $model->last_update = date('Y-m-d H:i:s');
            $model->saved = 1;
            if(!$model->save()) throw new Exception(json_encode($model->errors));

            $detail = StatOfficerMinistryUpgradeDetail::find()->alias('d')
                ->join('join', 'stat_officer_ministry_upgrade o', 'o.id = d.stat_officer_ministry_upgrade_id and o.phiscal_year_id=:year', [':year'=> $year->id])
                ->where(['ministry_id' => $post['Model']['ministry']['id']])
                ->one();

            if(!isset($detail)) {
                $detail = new StatOfficerMinistryUpgradeDetail();
                $detail->stat_officer_ministry_upgrade_id = $model->id;
                $detail->ministry_id = $post['Model']['ministry']['id'];
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

        $model = StatOfficerMinistryUpgrade::find()->where(['phiscal_year_id' => $year->id])->one();
        if(!isset($model)) {
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app', 'No Data'));
            return;
        }

        $models = Ministry::find()->alias('m')
            ->select('m.*, d.*')
            ->join('left join', 'stat_officer_ministry_upgrade_detail d', 'd.ministry_id=m.id and d.stat_officer_ministry_upgrade_id=:id', [':id' => $model->id])
            ->where(['deleted' => 0])->orderBy('m.position')->asArray()->all();

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

        $model = StatOfficerMinistryUpgrade::find()->where(['phiscal_year_id' => $year->id])->one();
        if(!isset($model)) {
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app', 'No Data'));
            return;
        }

        $models = Ministry::find()->alias('m')
            ->select('m.*, d.*')
            ->join('left join', 'stat_officer_ministry_upgrade_detail d', 'd.ministry_id=m.id and d.stat_officer_ministry_upgrade_id=:id', [':id' => $model->id])
            ->where(['deleted' => 0])->orderBy('m.position')->asArray()->all();

        return $this->renderPartial('../ministry/excel', [
            'file' => 'Stat Officers Ministry Upgrade '. $year->year . '.xls',
            'content' => $this->renderPartial('table', ['models' => $models, 'year' => $year, 'cols' => $this->columns])
        ]);
    }

    /**
     * Finds the StatOfficerMinistryUpgrade model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return StatOfficerMinistryUpgrade the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = StatOfficerMinistryUpgrade::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
}
