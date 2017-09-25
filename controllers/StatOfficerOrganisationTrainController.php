<?php

namespace app\controllers;

use app\components\MyHelper;
use app\models\Organisation;
use app\models\PhiscalYear;
use app\models\StatOfficerOrganisationTrain;
use app\models\StatOfficerOrganisationTrainDetail;
use Codeception\Util\HttpCode;
use Yii;
use app\models\StatOfficerOrgTrain;
use app\models\StatOfficerOrgTrainSearch;
use yii\db\Exception;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;

/**
 * StatOfficerOrgTrainController implements the CRUD actions for StatOfficerOrgTrain model.
 */
class StatOfficerOrganisationTrainController extends Controller
{
    public $columns = [
        'tech_in_total', 'tech_in_women', 'tech_out_total', 'tech_out_women',
        'theo_in_total', 'theo_in_women', 'theo_out_total', 'theo_out_women',
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
        return $this->render('index');
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

        $model = StatOfficerOrganisationTrain::find()->where(['phiscal_year_id' => $year->id])->one();
        if(!isset($model)) {
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app', 'No Data'));
            return;
        }

        $stat = StatOfficerOrganisationTrainDetail::find()
            ->select([
                'stat_officer_organisation_train_id' => 'stat_officer_organisation_train_id',
                'tech_in_total' => 'sum(d.tech_in_total)',
                'tech_out_total' => 'sum(d.tech_out_total)',
                'theo_in_total' => 'sum(d.theo_in_total)',
                'theo_out_total' => 'sum(d.theo_out_total)',
            ])->alias('d')
            ->where(['d.stat_officer_organisation_train_id' => $model->id])
            ->asArray()->one();
        $data = null;
        if(isset($stat))
            if(isset($stat['stat_officer_organisation_train_id'])) {
                $percent = 100/($stat['tech_in_total']+$stat['tech_out_total']+$stat['theo_in_total']+$stat['theo_out_total']);
                $data = [
                    number_format($stat['tech_in_total'] * $percent,2),
                    number_format($stat['tech_out_total'] * $percent,2),
                    number_format($stat['theo_in_total'] * $percent,2),
                    number_format($stat['theo_out_total'] * $percent,2),
                ];
            }

        $models = Organisation::find()->alias('m')
            ->select('m.*, d.*')
            ->join('left join', 'stat_officer_organisation_train_detail d', 'd.organisation_id=m.id and d.stat_officer_organisation_train_id=:id', [':id' => $model->id])
            ->where(['deleted' => 0])->orderBy('m.position')->asArray()->all();
        return json_encode([
            'models' => $models,
            'stat' => [
                'labels' => [
                    Yii::t('app', 'Technical Local')
                    , Yii::t('app', 'Technical Oversea')
                    , Yii::t('app', 'Theory Local')
                    , Yii::t('app', 'Theory Oversea')
                ],
                'data' => $data
            ],
        ]);
    }

    public function actionInquiry($year, $organisation) {
        $year = PhiscalYear::findOne($year);
        if(!isset($year)) {
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app', 'Inccorect Phiscal Year'));
            return;
        }

        $model = StatOfficerOrganisationTrainDetail::find()->alias('d')
            ->join('join', 'stat_officer_organisation_train o', 'o.id = d.stat_officer_organisation_train_id and o.phiscal_year_id=:year', [':year'=> $year->id])
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
            $model = StatOfficerOrganisationTrain::find()->where(['phiscal_year_id' => $year->id])->one();
            if(!isset($model)) {
                $model = new StatOfficerOrganisationTrain();
                $model->user_id = Yii::$app->user->id;
                $model->phiscal_year_id = $year->id;
            }
            $model->last_update = date('Y-m-d H:i:s');
            $model->saved = 1;
            if(!$model->save()) throw new Exception(json_encode($model->errors));

            $detail = StatOfficerOrganisationTrainDetail::find()->alias('d')
                ->join('join', 'stat_officer_organisation_train o', 'o.id = d.stat_officer_organisation_train_id and o.phiscal_year_id=:year', [':year'=> $year->id])
                ->where(['organisation_id' => $post['Model']['organisation']['id']])
                ->one();

            if(!isset($detail)) {
                $detail = new StatOfficerOrganisationTrainDetail();
                $detail->stat_officer_organisation_train_id = $model->id;
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

        $model = StatOfficerOrganisationTrain::find()->where(['phiscal_year_id' => $year->id])->one();
        if(!isset($model)) {
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app', 'No Data'));
            return;
        }

        $models = Organisation::find()->alias('m')
            ->select('m.*, d.*')
            ->join('left join', 'stat_officer_organisation_train_detail d', 'd.organisation_id=m.id and d.stat_officer_organisation_train_id=:id', [':id' => $model->id])
            ->where(['deleted' => 0])->orderBy('m.position')->asArray()->all();

        return $this->renderPartial('../orgnisation/print', [
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

        $model = StatOfficerOrganisationTrain::find()->where(['phiscal_year_id' => $year->id])->one();
        if(!isset($model)) {
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app', 'No Data'));
            return;
        }

        $models = Organisation::find()->alias('m')
            ->select('m.*, d.*')
            ->join('left join', 'stat_officer_organisation_train_detail d', 'd.organisation_id=m.id and d.stat_officer_organisation_train_id=:id', [':id' => $model->id])
            ->where(['deleted' => 0])->orderBy('m.position')->asArray()->all();

        return $this->renderPartial('../orgnisation/excel', [
            'file' => 'Stat Officers Needed '. $year->year . '.xls',
            'content' => $this->renderPartial('table', ['models' => $models, 'year' => $year, 'cols' => $this->columns])
        ]);
    }

    /**
     * Finds the StatOfficerOrgTrain model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return StatOfficerOrgTrain the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = StatOfficerOrgTrain::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
}