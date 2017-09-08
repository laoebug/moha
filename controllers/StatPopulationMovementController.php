<?php

namespace app\controllers;

use app\models\PhiscalYear;
use app\models\Province;
use app\models\StatPopulationMovementDetail;
use Codeception\Util\HttpCode;
use Yii;
use app\models\StatPopulationMovement;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;

/**
 * StatPopulationMovementController implements the CRUD actions for StatPopulationMovement model.
 */
class StatPopulationMovementController extends Controller
{
    public $COLUMNS = [
        'district'
        ,'village'
        ,'population_total'
        ,'population_women'
        ,'born_total'
        ,'born_women'
        ,'die_total'
        ,'die_women'
        ,'married'
        ,'divorce'
        ,'movein_total'
        ,'movein_women'
        ,'moveout_total'
        ,'moveout_women'
        ,'real_total'
        ,'real_women'
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
     * Lists all StatPopulationMovement models.
     * @return mixed
     */
    public function actionIndex()
    {
        return $this->render('index', [
            'columns' => $this->COLUMNS
        ]);
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

        return json_encode([
            'models' => $this->getModels($year)
        ]);
    }

    public function actionInquiry($year, $province) {
        $year = PhiscalYear::findOne($year);
        if(!isset($year)) {
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app', 'Inccorect Phiscal Year'));
            return;
        }

        $model = StatPopulationMovementDetail::find()
            ->alias('d')
            ->join('join', 'stat_population_movement l', 'l.id = d.stat_population_movement_id and l.phiscal_year_id=:year', [':year' => $year->id])
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
            $model = StatPopulationMovement::find()
                ->where(['phiscal_year_id' => $year->id])
                ->one();
            if(!isset($model)) {
                $model = new StatPopulationMovement();
                $model->phiscal_year_id = $year->id;
                $model->user_id = Yii::$app->user->id;
            }
            $model->saved = 1;
            $model->last_update = date('Y-m-d H:i:s');
            if(!$model->save()) throw new Exception(json_encode($model->errors));

            $detail = StatPopulationMovementDetail::find()
                ->where(['stat_population_movement_id' => $model->id, 'province_id' => $post['StatPopulationMovementDetail']['province']['id']])
                ->one();
            if(!isset($detail)) {
                $detail = new StatPopulationMovementDetail();
                $detail->province_id = $post['StatPopulationMovementDetail']['province']['id'];
                $detail->stat_population_movement_id = $model->id;
            }
            foreach ($this->COLUMNS as $col)
                $detail->$col = isset($post['StatPopulationMovementDetail'][$col])?$post['StatPopulationMovementDetail'][$col]:null;

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

        return $this->renderPartial('../ministry/print', [
            'content' => $this->renderPartial('table', [
                'year' => $year,
                'cols' => $this->COLUMNS,
                'models' => $this->getModels($year)
            ])
        ]);
    }

    public function actionDownload($year) {
        $year = PhiscalYear::findOne($year);
        if(!isset($year)) {
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app', 'Inccorect Phiscal Year'));
            return;
        }

        return $this->renderPartial('../ministry/excel', [
            'file' => 'Stat Local Administration '. $year->year .'.xls',
            'content' => $this->renderPartial('table', [
                'year' => $year,
                'cols' => $this->COLUMNS,
                'models' => $this->getModels($year)
            ])
        ]);
    }

    private function getModels($year) {
         return Province::find()
            ->alias('p')
            ->select('p.*, d.*')
            ->join('left join', 'stat_population_movement_detail d', 'd.province_id = p.id')
            ->join('join', 'stat_population_movement l', 'l.id=d.stat_population_movement_id and l.phiscal_year_id=:year', [':year'=> $year->id])
            ->where(['p.deleted' => 0])->orderBy('p.province_code')->asArray()->all();
    }

    /**
     * Finds the StatPopulationMovement model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return StatPopulationMovement the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = StatPopulationMovement::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
}
