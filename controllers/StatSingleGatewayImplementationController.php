<?php

namespace app\controllers;

use app\components\MyHelper;
use app\models\Branch;
use app\models\Ministry;
use app\models\PhiscalYear;
use app\models\StatSingleGatewayImplementationDetail;
use Yii;
use app\models\StatSingleGatewayImplementation;
use app\models\StatSingleGatewayImplementationSearch;
use yii\db\ActiveQuery;
use yii\db\Exception;
use yii\web\Controller;
use yii\web\HttpException;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use yii\web\ServerErrorHttpException;

/**
 * StatSingleGatewayImplementationController implements the CRUD actions for StatSingleGatewayImplementation model.
 */
class StatSingleGatewayImplementationController extends Controller
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
     * Lists all StatSingleGatewayImplementation models.
     * @return mixed
     */
    public function actionIndex()
    {
        return $this->render('index');
    }

    public function actionGet() {
        return json_encode([
            'years' => PhiscalYear::find()->where(['deleted' => 0])->asArray()->all(),
            'ministries' => Ministry::find()->where(['deleted' => 0])->orderBy('position')->asArray()->all()
        ]);
    }

    public function actionEnquiry($year) {
        $year = PhiscalYear::findOne($year);
        if(!isset($year)) throw new HttpException(Yii::t('app', 'Inccorect Phiscal Year'));

        $model = StatSingleGatewayImplementation::find()
            ->alias('i')
            ->join('join', 'stat_single_gateway_implementation_detail d', 'i.id=d.ministry_id and i.phiscal_year_id=:year', [
                ':year' => $year->id
            ])
            ->join('right join', 'ministry m', 'm.id=d.ministry_id')
            ->with(['statSingleGatewayImplementationDetails' => function(ActiveQuery $query) {
                $query
//                    ->select('d.id, d.name, d.remark, d.ministry_id, d.stat_single_gateway_implementation_id')
                    ->select(['DATE_FORMAT(`start_date`, "%d-%m-%Y") as `start_date`, `d`.`id`, `d`.`name`, `d`.`remark`, `d`.`ministry_id`, `d`.`stat_single_gateway_implementation_id`'])
                    ->alias('d')
                    ->with(['ministry']);
            }])
            ->orderBy('m.position')
            ->asArray()
            ->one();
        return json_encode([
            'model' => $model
        ]);
    }

    public function actionInquiry($year, $ministry) {
        $year = PhiscalYear::findOne($year);
        if(!isset($year)) throw new HttpException(Yii::t('app', 'Inccorect Phiscal Year'));

        $model = StatSingleGatewayImplementationDetail::find()
            ->alias('d')
            ->join('join','stat_single_gateway_implementation i', 'd.stat_single_gateway_implementation_id=i.id and i.phiscal_year_id=:year', [
                ':year' => $year->id
            ])
            ->where(['d.ministry_id' => $ministry])
            ->asArray()->one();

        if(isset($model))
            if(isset($model['start_date']))
                $model['start_date'] = MyHelper::convertdatefordisplay($model['start_date']);

        return json_encode([
            'model' => $model
        ]);
    }

    public function actionSave($year) {
        $post = Yii::$app->request->post();
        if(isset($post)) {
            $year = PhiscalYear::findOne($year);
            if(!isset($year)) throw new NotFoundHttpException(Yii::t('app', 'Inccorect Phiscal Year'));
            if($year->status != 'O') throw new MethodNotAllowedHttpException(Yii::t('app', 'The Year is not allowed to input'));

            $transaction = Yii::$app->db->beginTransaction();
            try {
                $model = StatSingleGatewayImplementation::find()
                    ->where(['phiscal_year_id' => $year->id])->one();
                if (!isset($model)) {
                    $model = new StatSingleGatewayImplementation();
                    $model->user_id = Yii::$app->user->id;
                    $model->phiscal_year_id = $year->id;
                }
                $model->last_update = date('Y-m-d H:i:s');
                $model->saved = 1;
                print_r($model->attributes);
                if (!$model->save())
                    throw new ServerErrorHttpException(json_encode($model->errors));

                $detail = StatSingleGatewayImplementationDetail::find()
                    ->where(['ministry_id' => $post['Model']['ministry']['id'], 'stat_single_gateway_implementation_id' => $model->id])
                    ->one();
                if (!isset($detail)) {
                    $detail = new StatSingleGatewayImplementationDetail();
                    $detail->stat_single_gateway_implementation_id = $model->id;
                    $detail->ministry_id = $post['Model']['ministry']['id'];
                }
                $detail->remark = $post['Model']['remark'];
                $detail->start_date = date('Y-m-d', strtotime($post['Model']['start_date']));
                $detail->name = $post['Model']['name'];
                print_r($detail->attributes);
                if (!$detail->save())
                    throw new ServerErrorHttpException(json_encode($detail->errors));

                $transaction->commit();
            }catch (Exception $exception) {
                $transaction->rollBack();
                throw new ServerErrorHttpException($exception->getMessage());
            }
        }
    }

    public function actionPrint($year) {
        $year = PhiscalYear::findOne($year);
        if(!isset($year)) throw new NotFoundHttpException(Yii::t('app', 'Inccorect Phiscal Year'));
        if($year->status != 'O') throw new MethodNotAllowedHttpException(Yii::t('app', 'The Year is not allowed to input'));

        $model = StatSingleGatewayImplementation::find()
            ->alias('m')
            ->with([
                'statSingleGatewayImplementationDetails' => function(ActiveQuery $query) {
                    $query->alias('d')
                        ->join('right join', 'ministry m', 'm.id=d.ministry_id')
                        ->orderBy('m.position');
                }
            ])->where(['phiscal_year_id' => $year->id])->one();
        return $this->renderPartial('print', ['content' => $this->renderPartial('table', ['model' => $model])]);
    }

    public function actionDownload($year) {
        $year = PhiscalYear::findOne($year);
        if(!isset($year)) throw new NotFoundHttpException(Yii::t('app', 'Inccorect Phiscal Year'));
        if($year->status != 'O') throw new MethodNotAllowedHttpException(Yii::t('app', 'The Year is not allowed to input'));

        $model = StatSingleGatewayImplementation::find()
            ->alias('m')
            ->with([
                'statSingleGatewayImplementationDetails' => function(ActiveQuery $query) {
                    $query->alias('d')
                        ->join('right join', 'ministry m', 'm.id=d.ministry_id')
                        ->orderBy('m.position');
                }
            ])->where(['phiscal_year_id' => $year->id])->one();
        return $this->renderPartial('excel', [
            'file' => 'Single Gateway Implementation '.$year->year.'.xls',
            'content' => $this->renderPartial('table', ['model' => $model])
        ]);
    }

    /**
     * Finds the StatSingleGatewayImplementation model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return StatSingleGatewayImplementation the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = StatSingleGatewayImplementation::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
}
