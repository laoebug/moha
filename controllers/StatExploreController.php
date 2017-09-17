<?php

namespace app\controllers;

use app\components\MyHelper;
use app\models\PhiscalYear;
use app\models\Province;
use app\models\StatExploreDetail;
use Codeception\Util\HttpCode;
use Yii;
use app\models\StatExplore;
use app\models\StatExploreSearch;
use yii\db\Exception;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;

/**
 * StatExploreController implements the CRUD actions for StatExplore model.
 */
class StatExploreController extends Controller
{
    /**
     * Lists all StatExplore models.
     * @return mixed
     */
    public function actionIndex()
    {
        return $this->render('index');
    }

    public function actionGet() {
        $years = PhiscalYear::find()->where(['deleted' => 0])->asArray()->all();
        $provinces = Province::find()->where(['deleted' => 0])->orderBy('province_code')->asArray()->all();
        return json_encode(['years' => $years, 'provinces' => $provinces]);
    }

    public function actionInquiry($year, $province) {
        $year = PhiscalYear::findOne($year);
        if(!isset($year)) {
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app','Incorrect Phiscal Year'));
            return;
        }

        $model = StatExploreDetail::find()->alias('d')
            ->join('join', 'stat_explore e', 'e.id = d.stat_explore_id and e.phiscal_year_id=:year', [':year' => $year->id])
            ->where(['province_id' => $province])->asArray()->one();

        return json_encode(['model' => $model]);
    }

    public function actionEnquiry($year) {
        $year = PhiscalYear::findOne($year);
        if(!isset($year)) {
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app','Incorrect Phiscal Year'));
            return;
        }

        $models = StatExploreDetail::find()->alias('d')
            ->select('d.*')
            ->addSelect(['province' => 'p.province_name'])
            ->join('join', 'province p', 'p.id=d.province_id')
            ->join('join', 'stat_explore c', 'c.id = d.stat_explore_id and c.phiscal_year_id=:year', [':year' => $year->id])
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
                $model = StatExplore::find()->where(['phiscal_year_id' => $year->id])->one();
                if(!isset($model)) {
                    $model = new StatExplore();
                    $model->phiscal_year_id = $year->id;
                    $model->user_id = Yii::$app->user->id;
                }
                $model->last_update = date('Y-m-d H:i:s');
                $model->saved = 1;
                if(!$model->save()) throw new Exception(json_encode($model->errors));

                $detail = StatExploreDetail::find()->where([
                    'stat_explore_id' => $model->id,
                    'province_id' => $post['Model']['province']['id']
                ])->one();
                if(!isset($detail)) {
                    $detail = new StatExploreDetail();
                    $detail->stat_explore_id = $model->id;
                    $detail->province_id = $post['Model']['province']['id'];
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

    public function actionPrint($year) {
        $year = PhiscalYear::findOne($year);
        if(!isset($year)) {
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app','Incorrect Phiscal Year'));
            return;
        }

        $models = StatExploreDetail::find()->alias('d')
            ->select('d.*')
            ->addSelect(['province' => 'p.province_name'])
            ->join('join', 'province p', 'p.id=d.province_id')
            ->join('join', 'stat_explore c', 'c.id = d.stat_explore_id and c.phiscal_year_id=:year', [':year' => $year->id])
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

        $models = StatExploreDetail::find()->alias('d')
            ->select('d.*')
            ->addSelect(['province' => 'p.province_name'])
            ->join('join', 'province p', 'p.id=d.province_id')
            ->join('join', 'stat_explore c', 'c.id = d.stat_explore_id and c.phiscal_year_id=:year', [':year' => $year->id])
            ->asArray()->all();

        return $this->renderPartial('../ministry/excel', [
            'file' => 'Stat Explore ' . $year->year . '.xls',
            'content' => $this->renderPartial('table', [
                'models' => $models,
                'year' => $year
            ])
        ]);
    }

    /**
     * Finds the StatExplore model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return StatExplore the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = StatExplore::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
}
