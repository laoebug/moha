<?php

namespace app\controllers;

use app\models\Ethnic;
use app\models\PhiscalYear;
use app\models\Province;
use Yii;
use app\models\StatEthnic;
use yii\data\ActiveDataProvider;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;

/**
 * StatEthnicController implements the CRUD actions for StatEthnic model.
 */
class StatEthnicController extends Controller
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
     * Lists all StatEthnic models.
     * @return mixed
     */
    public function actionIndex()
    {
        return $this->render('index');
    }

    public function actionGet() {
        $years = PhiscalYear::find()->where(['deleted' => 0])->asArray()->all();
        $provinces = Province::find()->where(['deleted' => 0])->orderBy('province_code')->asArray()->all();
        $ethnics = Ethnic::find()->where(['deleted' => 0])->orderBy('position')->asArray()->all();
        return json_encode([
            "years" => $years,
            "provinces" => $provinces,
            "ethnics" => $ethnics
        ]);
    }
    /**
     * Finds the StatEthnic model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return StatEthnic the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = StatEthnic::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
}
