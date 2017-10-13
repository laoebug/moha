<?php

namespace app\controllers;

use app\components\MyHelper;
use app\models\PhiscalYear;
use app\models\StatOdaDetail;
use Codeception\Util\HttpCode;
use Yii;
use app\models\StatOda;
use app\models\StatOdaSearch;
use yii\db\Exception;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;

/**
 * StatOdaController implements the CRUD actions for StatOda model.
 */
class StatOdaController extends Controller
{
    /**
     * Lists all StatOda models.
     * @return mixed
     */
    public function actionIndex()
    {
        return $this->render('index');
    }

    public function actionGet() {
        $years = PhiscalYear::find()->asArray()->all();

        return json_encode([
            'years' => $years
        ]);
    }

    public function actionEnquiry($year) {
        $year = PhiscalYear::findOne($year);
        if(!isset($year)) {
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app', 'Incorrect Phiscal Year'));
            return;
        }

        $models = StatOdaDetail::find()->alias('d')
            ->join('join', 'stat_oda e', 'e.id = d.stat_oda_id and e.phiscal_year_id=:year', [':year' => $year->id])
            ->where(['deleted' => 0])->orderBy('id')->asArray()->all();

        return json_encode(['models' => $models]);
    }

    public function actionSave($year) {
        $post = Yii::$app->request->post();
        if(!isset($post['Model'])) {
            MyHelper::response(HttpCode::BAD_REQUEST, Yii::t('app', 'Inccorect Request Method'));
            return;
        }

        $year = PhiscalYear::findOne($year);
        if(!isset($year)) {
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app', 'Incorrect Phiscal Year'));
            return;
        }

        $transaction = Yii::$app->db->beginTransaction();
        try {
            $model = StatOda::find()->where(['phiscal_year_id'=> $year->id])
                ->one();
            if(!isset($model)) {
                $model = new StatOda();
                $model->user_id = Yii::$app->user->id;
                $model->phiscal_year_id = $year->id;
            }
            $model->saved = 1;
            $model->last_update = date('Y-m-d H:i:s');
            if(!$model->save()) throw new Exception(json_encode($model->errors));

            $detail = null;
            if(isset($post['Model']['id'])) {
                $detail = StatOdaDetail::findOne($post['Model']['id']);
                if(!isset($detail)) {
                    $detail = new StatOdaDetail();
                    $detail->stat_oda_id = $model->id;
                }
            } else {
                $detail = new StatOdaDetail();
                $detail->stat_oda_id = $model->id;
            }
            $detail->attributes = $post['Model'];
            if(!$detail->save()) throw new Exception(json_encode($detail->errors));
            $transaction->commit();
        } catch (Exception $exception) {
            $transaction->rollBack();
            MyHelper::response(HttpCode::INTERNAL_SERVER_ERROR, $exception->getMessage());
            return;
        }

        return json_encode([
            'model' => $model
        ]);
    }

    public function actionDelete($year) {
        $year = PhiscalYear::findOne($year);
        if(!isset($year)) {
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app', 'Incorrect Phiscal Year'));
            return;
        }

        $post = Yii::$app->request->post();
        if(isset($post['id'])) {
            $model = StatOdaDetail::findOne($post['id']);
            if(isset($model)) {
                $model->deleted = 1;
                if(!$model->save())
                    MyHelper::response(HttpCode::INTERNAL_SERVER_ERROR, json_encode($model->errors));
            }
        }

    }

    public function actionPrint($year) {
        $year = PhiscalYear::findOne($year);
        if(!isset($year)) {
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app', 'Incorrect Phiscal Year'));
            return;
        }

        $models = StatOdaDetail::find()->alias('d')
            ->join('join', 'stat_oda e', 'e.id = d.stat_oda_id and e.phiscal_year_id=:year', [':year' => $year->id])
            ->where(['deleted' => 0])->orderBy('id')->asArray()->all();

        return $this->renderPartial('../ministry/print', [
            'content' => $this->renderPartial('table', [
                    'models' => $models,
                    'year' => $year,
                ]
            )]);
    }

    public function actionDownload($year) {
        $year = PhiscalYear::findOne($year);
        if(!isset($year)) {
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app', 'Incorrect Phiscal Year'));
            return;
        }

        $models = StatOdaDetail::find()->alias('d')
            ->join('join', 'stat_oda e', 'e.id = d.stat_oda_id and e.phiscal_year_id=:year', [':year' => $year->id])
            ->where(['deleted' => 0])->orderBy('id')->asArray()->all();

        return $this->renderPartial('../ministry/excel', [
            'file' => 'stat oda '. $year['year'].'.xls',
            'content' => $this->renderPartial('table', [
                    'models' => $models,
                    'year' => $year
                ]
            )]);
    }
}
