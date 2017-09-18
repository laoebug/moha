<?php

namespace app\controllers;

use app\components\MyHelper;
use app\models\PhiscalYear;
use app\models\StatCopyDetail;
use Codeception\Util\HttpCode;
use Yii;
use app\models\StatCopy;
use app\models\StatCopySearch;
use yii\db\Exception;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;

/**
 * StatCopyController implements the CRUD actions for StatCopy model.
 */
class StatCopyController extends Controller
{

    /**
     * Lists all StatCopy models.
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

        $models = StatCopyDetail::find()->alias('d')
            ->join('join', 'stat_copy c', 'c.id = d.stat_copy_id and c.phiscal_year_id=:year', [':year' => $year->id])
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
                $model = StatCopy::find()->where(['phiscal_year_id' => $year->id])->one();
                if(!isset($model)) {
                    $model = new StatCopy();
                    $model->phiscal_year_id = $year->id;
                    $model->user_id = Yii::$app->user->id;
                }
                $model->last_update = date('Y-m-d H:i:s');
                $model->saved = 1;
                if(!$model->save()) throw new Exception(json_encode($model->errors));

                if(isset($post['Model']['id'])) {
                    $detail = StatCopyDetail::findOne($post['Model']['id']);
                    if(!isset($detail)) throw new Exception(Yii::t('app','Not Found!'));
                } else {
                    $detail = new StatCopyDetail();
                    $detail->stat_copy_id = $model->id;
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
                    StatCopyDetail::deleteAll(['id' => $post['Model']['id']]);
    }

    public function actionPrint($year) {
        $year = PhiscalYear::findOne($year);
        if(!isset($year)) {
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app','Incorrect Phiscal Year'));
            return;
        }

        $models = StatCopyDetail::find()->alias('d')
            ->join('join', 'stat_copy c', 'c.id = d.stat_copy_id and c.phiscal_year_id=:year', [':year' => $year->id])
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

        $models = StatCopyDetail::find()->alias('d')
            ->join('join', 'stat_copy c', 'c.id = d.stat_copy_id and c.phiscal_year_id=:year', [':year' => $year->id])
            ->asArray()->all();

        return $this->renderPartial('../ministry/excel', [
            'file' => 'Stat Copy ' . $year->year . '.xls',
            'content' => $this->renderPartial('table', [
                    'models' => $models,
                    'year' => $year
            ])
        ]);
    }

    /**
     * Finds the StatCopy model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return StatCopy the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = StatCopy::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
}
