<?php

namespace app\controllers;

use app\components\MyHelper;
use app\models\OfficerLevel;
use app\models\PhiscalYear;
use app\models\StatContractDetail;
use Codeception\Util\HttpCode;
use Yii;
use app\models\StatContract;
use app\models\StatContractSearch;
use yii\db\Exception;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;

/**
 * StatContractController implements the CRUD actions for StatContract model.
 */
class StatContractController extends Controller
{
    /**
     * Lists all StatContract models.
     * @return mixed
     */
    public function actionIndex()
    {
        return $this->render('index');
    }

    public function actionGet() {
        $years = PhiscalYear::find()->asArray()->all();
        $levels = OfficerLevel::find()->where(['deleted' => 0])->orderBy('position')->asArray()->all();

        return json_encode([
            'years' => $years,
            'levels' => $levels
        ]);
    }

    public function actionEnquiry($year) {
        $year = PhiscalYear::findOne($year);
        if(!isset($year)) {
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app', 'Incorrect Phiscal Year'));
            return;
        }

        $models = StatContractDetail::find()->alias('d')
            ->select('d.*')
            ->addSelect('l.name')
            ->join('join', 'officer_level l', 'l.id = d.officer_level_id')
            ->join('join', 'stat_contract e', 'e.id = d.stat_contract_id and e.phiscal_year_id=:year', [':year' => $year->id])
            ->asArray()->all();

        return json_encode(['models' => $models]);
    }

    public function actionInquiry($year, $level) {
        $year = PhiscalYear::findOne($year);
        if(!isset($year)) {
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app', 'Incorrect Phiscal Year'));
            return;
        }

        $model = StatContractDetail::find()->alias('d')
            ->join('join', 'stat_contract e', 'e.id = d.stat_contract_id and e.phiscal_year_id=:year', [':year' => $year->id])
            ->where(['d.officer_level_id' => $level])
            ->asArray()->one();
        return json_encode([
            'model' => $model
        ]);
    }

    public function actionSave($year) {
        $post = Yii::$app->request->post();
        if(!isset($post['Model'])) {
            MyHelper::response(HttpCode::BAD_REQUEST, Yii::t('app', 'Incorrect Request Method'));
            return;
        }

        $year = PhiscalYear::findOne($year);
        if(!isset($year)) {
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app', 'Incorrect Phiscal Year'));
            return;
        }

        $transaction = Yii::$app->db->beginTransaction();
        try {
            $model = StatContract::find()->where(['phiscal_year_id'=> $year->id])
                ->one();
            if(!isset($model)) {
                $model = new StatContract();
                $model->user_id = Yii::$app->user->id;
                $model->phiscal_year_id = $year->id;
            }
            $model->saved = 1;
            $model->last_update = date('Y-m-d H:i:s');
            if(!$model->save()) throw new \yii\db\Exception(json_encode($model->errors));

            $detail = StatContractDetail::find()->where([
                'stat_contract_id' => $model->id,
                'officer_level_id' => $post['Model']['level']['id'],
            ])->one();

            if(!isset($detail)) {
                $detail = new StatContractDetail();
                $detail->stat_contract_id = $model->id;
                $detail->officer_level_id = $post['Model']['level']['id'];
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

    public function actionPrint($year) {
        $year = PhiscalYear::findOne($year);
        if(!isset($year)) {
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app', 'Incorrect Phiscal Year'));
            return;
        }

        $models = StatContractDetail::find()->alias('d')
            ->select('d.*,l.name')
            ->join('join', 'officer_level l', 'l.id = d.officer_level_id')
            ->join('join', 'stat_contract e', 'e.id = d.stat_contract_id and e.phiscal_year_id=:year', [':year' => $year->id])
            ->asArray()->all();

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

        $models = StatContractDetail::find()->alias('d')
            ->select('d.*,l.name')
            ->join('join', 'officer_level l', 'l.id = d.officer_level_id')
            ->join('join', 'stat_contract e', 'e.id = d.stat_contract_id and e.phiscal_year_id=:year', [':year' => $year->id])
            ->asArray()->all();

        return $this->renderPartial('../ministry/excel', [
            'file' => 'stat contract '. $year['year'].'.xls',
            'content' => $this->renderPartial('table', [
                    'models' => $models,
                    'year' => $year
                ]
            )]);
    }
}
