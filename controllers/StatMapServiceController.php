<?php

namespace app\controllers;

use app\components\MyHelper;
use app\models\PhiscalYear;
use app\models\StatMapServiceDetail;
use Codeception\Util\HttpCode;
use Yii;
use app\models\StatMapService;
use app\models\StatMapServiceSearch;
use yii\db\Exception;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;

/**
 * StatMapServiceController implements the CRUD actions for StatMapService model.
 */
class StatMapServiceController extends Controller
{

    /**
     * Lists all StatMapService models.
     * @return mixed
     */
    public function actionIndex()
    {
        return $this->render('index');
    }

    public function actionGet() {
        $years = PhiscalYear::find()->where(['deleted' => 0])->asArray()->all();
        return json_encode(['years' => $years]);
    }

    public function actionEnquiry($year) {
        $year = PhiscalYear::findOne($year);
        if(!isset($year)) {
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app','Incorrect Phiscal Year'));
            return;
        }

        $models = StatMapServiceDetail::find()->alias('d')
            ->join('join', 'stat_map_service c', 'c.id = d.stat_map_service_id and c.phiscal_year_id=:year', [':year' => $year->id])
            ->asArray()->all();

        return json_encode([
            'models' => $models,
        ]);
    }

    public function actionSave($year) {
        $year = PhiscalYear::findOne($year);
        if(!isset($year)) {
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app','Incorrect Phiscal Year'));
            return;
        }

        $post = Yii::$app->request->post();
        if(isset($post)) {
            $transaction = Yii::$app->db->beginTransaction();
            try {
                $model = StatMapService::find()->where(['phiscal_year_id' => $year->id])->one();
                if(!isset($model)) {
                    $model = new StatMapService();
                    $model->phiscal_year_id = $year->id;
                    $model->user_id = Yii::$app->user->id;
                }
                $model->last_update = date('Y-m-d H:i:s');
                $model->saved = 1;
                if(!$model->save()) throw new Exception(json_encode($model->errors));

                if(isset($post['Model']['id'])) {
                    $detail = StatMapServiceDetail::findOne($post['Model']['id']);
                    if(!isset($detail)) throw new Exception(Yii::t('app','Not Found!'));
                } else {
                    $detail = new StatMapServiceDetail();
                    $detail->stat_map_service_id = $model->id;
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
    }

    public function actionDelete() {
        $post = Yii::$app->request->post();
        if(isset($post))
            if(isset($post['Model']))
                if (isset($post['Model']['id']))
                    StatMapServiceDetail::deleteAll(['id' => $post['Model']['id']]);
    }

    public function actionPrint($year) {
        $year = PhiscalYear::findOne($year);
        if(!isset($year)) {
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app','Incorrect Phiscal Year'));
            return;
        }

        $models = StatMapServiceDetail::find()->alias('d')
            ->join('join', 'stat_map_service c', 'c.id = d.stat_map_service_id and c.phiscal_year_id=:year', [':year' => $year->id])
            ->asArray()->all();

        return $this->renderPartial('../ministry/print', [
            'content' => $this->renderPartial('table', [
                'models' => $models,
                'year' => $year
            ])
        ]);
    }

    public function actionDownload($year) {
        $year = PhiscalYear::findOne($year);
        if(!isset($year)) {
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app','Incorrect Phiscal Year'));
            return;
        }

        $models = StatMapServiceDetail::find()->alias('d')
            ->join('join', 'stat_map_service c', 'c.id = d.stat_map_service_id and c.phiscal_year_id=:year', [':year' => $year->id])
            ->asArray()->all();

        return $this->renderPartial('../ministry/excel', [
            'file' => 'Stat MapService ' . $year->year . '.xls',
            'content' => $this->renderPartial('table', [
                'models' => $models,
                'year' => $year
            ])
        ]);
    }

    /**
     * Finds the StatMapService model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return StatMapService the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = StatMapService::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
}
