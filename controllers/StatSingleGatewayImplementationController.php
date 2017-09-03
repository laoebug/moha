<?php

namespace app\controllers;

use app\models\Branch;
use app\models\PhiscalYear;
use Yii;
use app\models\StatSingleGatewayImplementation;
use app\models\StatSingleGatewayImplementationSearch;
use yii\db\Exception;
use yii\web\Controller;
use yii\web\HttpException;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;

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

    public function actionEnquiry($year) {
        $year = PhiscalYear::findOne($year);
        if(!isset($year)) throw new HttpException(Yii::t('app', 'Inccorect Phiscal Year'));

        $models = Branch::find()
            ->alias('b')
            ->join('left join', 'stat_single_gateway_implementation_detail d', 'b.id=d.branch_id')
            ->where(['b.phiscal_year_id' => $year->id, 'd.phiscal_year_id' =>$year->id]);

        return json_encode([
            'models' => $models
        ]);
    }
    /**
     * Deletes an existing StatSingleGatewayImplementation model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     */
    public function actionDelete($id)
    {
        $this->findModel($id)->delete();

        return $this->redirect(['index']);
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
