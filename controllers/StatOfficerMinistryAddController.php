<?php

namespace app\controllers;

use app\components\MyHelper;
use app\models\Ministry;
use app\models\PhiscalYear;
use app\models\StatOfficerMinistryAddDetail;
use Codeception\Util\HttpCode;
use Yii;
use app\models\StatOfficerMinistryAdd;
use app\models\StatOfficerMinistryAddSearch;
use yii\db\Exception;
use yii\helpers\ArrayHelper;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;

/**
 * StatOfficerMinistryAddController implements the CRUD actions for StatOfficerMinistryAdd model.
 */
class StatOfficerMinistryAddController extends Controller
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

        $model = StatOfficerMinistryAdd::find()->where(['phiscal_year_id' => $year->id])->one();
        if(!isset($model)) {
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app', 'No Data'));
            return;
        }

        $models = Ministry::find()->alias('m')
            ->select('m.*, d.*')
            ->join('left join', 'stat_officer_ministry_add_detail d', 'd.ministry_id=m.id and d.stat_officer_ministry_add_id=:id', [':id' =>$model->id])
            ->where(['deleted' => 0])->orderBy('m.position')->asArray()->all();

        $ministries = Ministry::find()->where(['deleted' => 0])->orderBy('position')->asArray()->all();

        return json_encode([
            'models' => $models,
            'stat' => [
                'labels' => ArrayHelper::getColumn($ministries, 'name'),
                'series' => [Yii::t('app', 'Add'), Yii::t('app', 'Resign')],
                'data' => [
                    ArrayHelper::getColumn($models, 'add'),
                    ArrayHelper::getColumn($models, 'resign')
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

        $model = StatOfficerMinistryAddDetail::find()->alias('d')
            ->join('join', 'stat_officer_ministry_add o', 'o.id = d.stat_officer_ministry_add_id and o.phiscal_year_id=:year', [':year'=> $year->id])
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
            $model = StatOfficerMinistryAdd::find()->where(['phiscal_year_id' => $year->id])->one();
            if(!isset($model)) {
                $model = new StatOfficerMinistryAdd();
                $model->user_id = Yii::$app->user->id;
                $model->phiscal_year_id = $year->id;
            }
            $model->last_update = date('Y-m-d H:i:s');
            $model->saved = 1;
            if(!$model->save()) throw new Exception(json_encode($model->errors));

            $detail = StatOfficerMinistryAddDetail::find()->alias('d')
                ->join('join', 'stat_officer_ministry_add o', 'o.id = d.stat_officer_ministry_add_id and o.phiscal_year_id=:year', [':year'=> $year->id])
                ->where(['ministry_id' => $post['Model']['ministry']['id']])
                ->one();

            if(!isset($detail)) {
                $detail = new StatOfficerMinistryAddDetail();
                $detail->stat_officer_ministry_add_id = $model->id;
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

    /**
     * Finds the StatOfficerMinistryAdd model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return StatOfficerMinistryAdd the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = StatOfficerMinistryAdd::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
}
