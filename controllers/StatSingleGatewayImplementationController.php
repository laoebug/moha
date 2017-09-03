<?php

namespace app\controllers;

use app\models\Branch;
use app\models\Ministry;
use app\models\PhiscalYear;
use Yii;
use app\models\StatSingleGatewayImplementation;
use app\models\StatSingleGatewayImplementationSearch;
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

        $models = Ministry::find()
            ->select('m.*, d.name servicename, d.start_date, d.remark')
            ->alias('m')
            ->join('left join', 'stat_single_gateway_implementation_detail d', 'm.id=d.ministry_id')
            ->join('left join', 'stat_single_gateway_implementation i', 'i.id=d.stat_single_gateway_implementation_id and i.phiscal_year_id=:year', [
                ':year' => $year->id
            ])
            ->where(['m.phiscal_year_id' => $year->id])
            ->asArray()->all();

        return json_encode([
            'models' => $models
        ]);
    }

    public function actionSave($year) {
        $post = Yii::$app->request->post();
        if(isset($post)) {
            $year = PhiscalYear::findOne($year);
            if(!isset($year)) throw new NotFoundHttpException(Yii::t('app', 'Inccorect Phiscal Year'));
            if($year->status != 'O') throw new MethodNotAllowedHttpException(Yii::t('app', 'The Year is not allowed to input'));

            $model = StatSingleGatewayImplementation::find()
                ->where(['phiscal_year_id' => $year->id])->one();
            if(!isset($model)) {
                $model = new StatSingleGatewayImplementation();
                $model->user_id = Yii::$app->user->id;
                $model->phiscal_year_id = $year->id;
            }
            $model->last_update = date('Y-m-d H:i:s');
            $model->load($post);
            $model->saved = 1;
            if(!$model->save())
                throw new ServerErrorHttpException(json_encode($model->errors));
        }
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
