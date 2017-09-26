<?php

namespace app\controllers;

use app\components\MyHelper;
use app\models\Ministry;
use app\models\PhiscalYear;
use app\models\StatOfficerMinistryTrainDetail;
use Codeception\Util\HttpCode;
use Yii;
use app\models\StatOfficerMinistryTrain;
use app\models\StatOfficerMinistryTrainSearch;
use yii\db\Exception;
use yii\helpers\ArrayHelper;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;

/**
 * StatOfficerMinistryTrainController implements the CRUD actions for StatOfficerMinistryTrain model.
 */
class StatOfficerMinistryTrainController extends Controller
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
     * Lists all StatOfficerMinistry models.
     * @return mixed
     */
    public function actionIndex()
    {
        return $this->render('index');
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

        $model = StatOfficerMinistryTrain::find()->where(['phiscal_year_id' => $year->id])->one();
        if(!isset($model)) {
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app', 'No Data'));
            return;
        }

        $models = Ministry::find()->alias('m')
            ->select('m.*, d.*')
            ->join('left join', 'stat_officer_ministry_train_detail d', 'd.ministry_id=m.id and d.stat_officer_ministry_train_id=:id', [':id' => $model->id])
            ->where(['deleted' => 0])->orderBy('m.position')->asArray()->all();

        $stat = StatOfficerMinistryTrainDetail::find()
            ->select([
                'stat_officer_ministry_train_id' => 'stat_officer_ministry_train_id',
                'tech_in_total' => 'sum(d.tech_in_total)',
                'tech_out_total' => 'sum(d.tech_out_total)',
                'theo_in_total' => 'sum(d.theo_in_total)',
                'theo_out_total' => 'sum(d.theo_out_total)',
            ])->alias('d')
            ->where(['d.stat_officer_ministry_train_id' => $model->id])
            ->asArray()->one();
        $data = null;
        if(isset($stat))
            if(isset($stat['stat_officer_ministry_train_id'])) {
                $percent = 100/($stat['tech_in_total']+$stat['tech_out_total']+$stat['theo_in_total']+$stat['theo_out_total']);
                $data = [
                    number_format($stat['tech_in_total'] * $percent,2),
                    number_format($stat['tech_out_total'] * $percent,2),
                    number_format($stat['theo_in_total'] * $percent,2),
                    number_format($stat['theo_out_total'] * $percent,2),
                ];
            }

        return json_encode([
            'models' => $models,
            'stat' => [
                'labels' => [
                    'ວິຊາສະເພາະ ພາຍໃນ'
                    ,'ວິຊາສະເພາະ ຕາງປະເທດ'
                    ,'ທິດສະດີ ພາຍໃນ'
                    ,'ທິດສະດີ ຕາງປະເທດ'
                ],
                'data' => $data
            ],
        ]);
    }

    public function actionInquiry($year, $ministry) {
        $year = PhiscalYear::findOne($year);
        if(!isset($year)) {
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app', 'Inccorect Phiscal Year'));
            return;
        }

        $model = StatOfficerMinistryTrainDetail::find()->alias('d')
            ->join('join', 'stat_officer_ministry_train o', 'o.id = d.stat_officer_ministry_train_id and o.phiscal_year_id=:year', [':year'=> $year->id])
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
            $model = StatOfficerMinistryTrain::find()->where(['phiscal_year_id' => $year->id])->one();
            if(!isset($model)) {
                $model = new StatOfficerMinistryTrain();
                $model->user_id = Yii::$app->user->id;
                $model->phiscal_year_id = $year->id;
            }
            $model->last_update = date('Y-m-d H:i:s');
            $model->saved = 1;
            if(!$model->save()) throw new Exception(json_encode($model->errors));

            $detail = StatOfficerMinistryTrainDetail::find()->alias('d')
                ->join('join', 'stat_officer_ministry_train o', 'o.id = d.stat_officer_ministry_train_id and o.phiscal_year_id=:year', [':year'=> $year->id])
                ->where(['ministry_id' => $post['Model']['ministry']['id']])
                ->one();

            if(!isset($detail)) {
                $detail = new StatOfficerMinistryTrainDetail();
                $detail->stat_officer_ministry_train_id = $model->id;
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

        $model = StatOfficerMinistryTrain::find()->where(['phiscal_year_id' => $year->id])->one();
        if(!isset($model)) {
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app', 'No Data'));
            return;
        }

        $models = Ministry::find()->alias('m')
            ->select('m.*, d.*')
            ->join('left join', 'stat_officer_ministry_train_detail d', 'd.ministry_id=m.id and d.stat_officer_ministry_train_id=:id', [':id' => $model->id])
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

        $model = StatOfficerMinistryTrain::find()->where(['phiscal_year_id' => $year->id])->one();
        if(!isset($model)) {
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app', 'No Data'));
            return;
        }

        $models = Ministry::find()->alias('m')
            ->select('m.*, d.*')
            ->join('left join', 'stat_officer_ministry_train_detail d', 'd.ministry_id=m.id and d.stat_officer_ministry_train_id=:id', [':id' => $model->id])
            ->where(['deleted' => 0])->orderBy('m.position')->asArray()->all();

        return $this->renderPartial('../ministry/excel', [
            'file' => 'Stat Officers Ministry Train '. $year->year . '.xls',
            'content' => $this->renderPartial('table', ['models' => $models, 'year' => $year, 'cols' => $this->columns])
        ]);
    }

    /**
     * Finds the StatOfficerMinistryTrain model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return StatOfficerMinistryTrain the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = StatOfficerMinistryTrain::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
}
