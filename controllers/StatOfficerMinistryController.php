<?php

namespace app\controllers;

use app\components\MyHelper;
use app\models\Ministry;
use app\models\PhiscalYear;
use app\models\StatOfficerMinistryDetail;
use Codeception\Util\HttpCode;
use Yii;
use app\models\StatOfficerMinistry;
use app\models\StatOfficerMinistrySearch;
use yii\db\Exception;
use yii\helpers\ArrayHelper;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;

/**
 * StatOfficerMinistryController implements the CRUD actions for StatOfficerMinistry model.
 */
class StatOfficerMinistryController extends Controller
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

        $model = StatOfficerMinistry::find()->where(['phiscal_year_id' => $year->id])->one();
        if(!isset($model)) {
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app', 'No Data'));
            return;
        }

        $models = Ministry::find()->alias('m')
            ->select('m.*, d.*')
            ->join('left join', 'stat_officer_ministry_detail d', 'd.ministry_id=m.id and d.stat_officer_ministry_id=:id', [':id' =>$model->id])
            ->where(['deleted' => 0])->orderBy('m.position')->asArray()->all();

        $ministries = Ministry::find()->where(['deleted' => 0])->orderBy('position')->asArray()->all();

        return json_encode([
            'models' => $models,
            'stat' => [
                'labels' => ArrayHelper::getColumn($ministries, 'name'),
                'series' => [Yii::t('app', 'Total'), Yii::t('app', 'Women')],
                'data' => [
                    ArrayHelper::getColumn($models, 'total'),
                    ArrayHelper::getColumn($models, 'women')
                ]
            ],
        ]);
    }

    public function actionInquiry($year, $ministry) {
        $year = PhiscalYear::findOne($year);
        if(!isset($year)) {
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app', 'Inccorect Phiscal Year'));
            return;
        }

        $model = StatOfficerMinistryDetail::find()->alias('d')
            ->join('join', 'stat_officer_ministry o', 'o.id = d.stat_officer_ministry_id and o.phiscal_year_id=:year', [':year'=> $year->id])
            ->where(['ministry_id' => $ministry])
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
            $model = StatOfficerMinistry::find()->where(['phiscal_year_id' => $year->id])->one();
            if(!isset($model)) {
                $model = new StatOfficerMinistry();
                $model->user_id = Yii::$app->user->id;
                $model->phiscal_year_id = $year->id;
            }
            $model->last_update = date('Y-m-d H:i:s');
            $model->saved = 1;
            if(!$model->save()) throw new Exception(json_encode($model->errors));

            $detail = StatOfficerMinistryDetail::find()->alias('d')
                ->join('join', 'stat_officer_ministry o', 'o.id = d.stat_officer_ministry_id and o.phiscal_year_id=:year', [':year'=> $year->id])
                ->where(['ministry_id' => $post['Model']['ministry']['id']])
                ->one();

            if(!isset($detail)) {
                $detail = new StatOfficerMinistryDetail();
                $detail->stat_officer_ministry_id = $model->id;
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

//    public function actionPrint($year) {
//        $year = PhiscalYear::findOne($year);
//        if(!isset($year)) {
//            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app', 'Inccorect Phiscal Year'));
//            return;
//        }
//
//        $models = Ministry::find()->alias('m')
//            ->join('left join', 'stat_officer_ministry_detail d', 'd.ministry_id=m.id')
//            ->join('join', 'stat_officer_ministry o', 'd.stat_officer_ministry_id = o.id and o.phiscal_year_id=:year', [':year'=>$year->id])
//            ->all();
//        return $this->renderPartial('../ministry/print', [
//            'content' => $this->renderPartial('table', ['models' => $models, 'year' => $year])
//        ]);
//    }
//
//    public function actionDownload($year) {
//        $year = PhiscalYear::findOne($year);
//        if(!isset($year)) {
//            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app', 'Inccorect Phiscal Year'));
//            return;
//        }
//
//        $model = StatOfficerMinistryDetail::find()->alias('d')
//            ->join('join', 'stat_officer_ministry o', 'o.id = d.stat_officer_ministry_id and o.phiscal_year_id=:year', [':year'=> $year->id])
//            ->one();
//
//        return $this->renderPartial('../ministry/excel', [
//            'file' => 'Stat Officers Needed '. $year->year . '.xls',
//            'content' => $this->renderPartial('table', ['model' => $model, 'year' => $year])
//        ]);
//    }

    /**
     * Finds the StatOfficerMinistry model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return StatOfficerMinistry the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = StatOfficerMinistry::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
}
