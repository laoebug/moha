<?php

namespace app\controllers;

use app\components\MyHelper;
use app\models\Organisation;
use app\models\PhiscalYear;
use app\models\StatOfficerOrganisationUpgradeDetail;
use Codeception\Util\HttpCode;
use Yii;
use app\models\StatOfficerOrganisationUpgrade;
use app\models\StatOfficerOrganisationUpgradeSearch;
use yii\db\Exception;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;

/**
 * StatOfficerOrganisationUpgradeController implements the CRUD actions for StatOfficerOrganisationUpgrade model.
 */
class StatOfficerOrganisationUpgradeController extends Controller
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
     * Lists all StatOfficerOrganisation models.
     * @return mixed
     */
    public function actionIndex()
    {
        return $this->render('index', ['cols' => $this->columns]);
    }

    public function actionGet() {
        $years = PhiscalYear::find()->where(['deleted' => 0])->asArray()->all();
        $organisations = Organisation::find()->where(['deleted' => 0])->orderBy('position')->asArray()->all();

        return json_encode([
            'years' => $years,
            'organisations' => $organisations,
        ]);
    }

    public function actionEnquiry($year) {
        $year = PhiscalYear::findOne($year);
        if(!isset($year)) {
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app', 'Inccorect Phiscal Year'));
            return;
        }

        $model = StatOfficerOrganisationUpgrade::find()->where(['phiscal_year_id' => $year->id])->one();
        if(!isset($model)) {
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app', 'No Data'));
            return;
        }

        $models = Organisation::find()->alias('m')
            ->select('m.*, d.*')
            ->join('left join', 'stat_officer_organisation_upgrade_detail d', 'd.organisation_id=m.id and d.stat_officer_organisation_upgrade_id=:id', [':id' => $model->id])
            ->where(['deleted' => 0])->orderBy('m.position')->asArray()->all();
        return json_encode([
            'models' => $models,
        ]);
    }

    public function actionInquiry($year, $organisation) {
        $year = PhiscalYear::findOne($year);
        if(!isset($year)) {
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app', 'Inccorect Phiscal Year'));
            return;
        }

        $model = StatOfficerOrganisationUpgradeDetail::find()->alias('d')
            ->join('join', 'stat_officer_organisation_upgrade o', 'o.id = d.stat_officer_organisation_upgrade_id and o.phiscal_year_id=:year', [':year'=> $year->id])
            ->where(['d.organisation_id' => $organisation])
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
            $model = StatOfficerOrganisationUpgrade::find()->where(['phiscal_year_id' => $year->id])->one();
            if(!isset($model)) {
                $model = new StatOfficerOrganisationUpgrade();
                $model->user_id = Yii::$app->user->id;
                $model->phiscal_year_id = $year->id;
            }
            $model->last_update = date('Y-m-d H:i:s');
            $model->saved = 1;
            if(!$model->save()) throw new Exception(json_encode($model->errors));

            $detail = StatOfficerOrganisationUpgradeDetail::find()->alias('d')
                ->join('join', 'stat_officer_organisation_upgrade o', 'o.id = d.stat_officer_organisation_upgrade_id and o.phiscal_year_id=:year', [':year'=> $year->id])
                ->where(['organisation_id' => $post['Model']['organisation']['id']])
                ->one();

            if(!isset($detail)) {
                $detail = new StatOfficerOrganisationUpgradeDetail();
                $detail->stat_officer_organisation_upgrade_id = $model->id;
                $detail->organisation_id = $post['Model']['organisation']['id'];
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

        $model = StatOfficerOrganisationUpgrade::find()->where(['phiscal_year_id' => $year->id])->one();
        if(!isset($model)) {
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app', 'No Data'));
            return;
        }

        $models = Organisation::find()->alias('m')
            ->select('m.*, d.*')
            ->join('left join', 'stat_officer_organisation_upgrade_detail d', 'd.organisation_id=m.id and d.stat_officer_organisation_upgrade_id=:id', [':id' => $model->id])
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

        $model = StatOfficerOrganisationUpgrade::find()->where(['phiscal_year_id' => $year->id])->one();
        if(!isset($model)) {
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app', 'No Data'));
            return;
        }

        $models = Organisation::find()->alias('m')
            ->select('m.*, d.*')
            ->join('left join', 'stat_officer_organisation_upgrade_detail d', 'd.organisation_id=m.id and d.stat_officer_organisation_upgrade_id=:id', [':id' => $model->id])
            ->where(['deleted' => 0])->orderBy('m.position')->asArray()->all();

        return $this->renderPartial('../ministry/excel', [
            'file' => 'Stat Officers Organisation Upgrade '. $year->year . '.xls',
            'content' => $this->renderPartial('table', ['models' => $models, 'year' => $year, 'cols' => $this->columns])
        ]);
    }

    /**
     * Finds the StatOfficerOrganisationUpgrade model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return StatOfficerOrganisationUpgrade the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = StatOfficerOrganisationUpgrade::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
}
