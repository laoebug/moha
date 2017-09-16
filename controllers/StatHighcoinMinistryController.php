<?php

namespace app\controllers;

use app\components\MyHelper;
use app\models\Award;
use app\models\Ministry;
use app\models\PhiscalYear;
use app\models\StatHighcoinMinistryDetail;
use Codeception\Util\HttpCode;
use Yii;
use app\models\StatHighcoinMinistry;
use app\models\StatHighcoinMinistrySearch;
use yii\db\Exception;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;

/**
 * StatHighcoinMinistryController implements the CRUD actions for StatHighcoinMinistry model.
 */
class StatHighcoinMinistryController extends Controller
{
    public function actionIndex()
    {
        return $this->render('index');
    }

    public function actionGet() {
        $years = PhiscalYear::find()->where(['deleted' => 0])->asArray()->all();
        $awards = Award::find()->where(['deleted' => 0])->orderBy('position')->asArray()->all();
        $ministries = Ministry::find()->where(['deleted' =>0])->orderBy('position')->asArray()->all();

        return json_encode([
            'years' => $years,
            'awards' => $awards,
            'ministries' => $ministries
        ]);
    }

    public function actionEnquiry($year) {
        $year = PhiscalYear::findOne($year);
        if(!isset($year)) {
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app', 'Incorrect Phiscal Year'));
            return;
        }
        $models = StatHighcoinMinistryDetail::find()->alias('d')
            ->select([
                'd.*',
                'ministry' => 'm.name',
                'award' => 'a.name'
            ])
            ->join('join', 'stat_highcoin_ministry t', 't.id=d.stat_highcoin_ministry_id and t.phiscal_year_id=:year', [':year'=> $year->id])
            ->join('join', 'ministry m', 'm.id=d.ministry_id')
            ->join('join', 'award a', 'a.id=d.award_id')
            ->asArray()->all();

        return json_encode([
            'models' => $models
        ]);
    }

    public function actionInquiry($year, $ministry, $award) {
        $year = PhiscalYear::findOne($year);
        if(!isset($year)) {
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app', 'Incorrect Phiscal Year'));
            return;
        }

        $model = StatHighcoinMinistryDetail::find()->alias('d')
            ->join('join', 'stat_highcoin_ministry m', 'm.id = d.stat_highcoin_ministry_id and m.phiscal_year_id=:year', [':year' => $year->id])
            ->where([
                'award_id' => $award,
                'ministry_id' => $ministry,
            ])->asArray()->one();

        return json_encode(['model' => $model]);
    }

    public function actionSave($year) {
        $year = PhiscalYear::findOne($year);
        if(!isset($year)) {
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app', 'Incorrect Phiscal Year'));
            return;
        }

        $post = Yii::$app->request->post();
        if(isset($post)) {
            $transaction = Yii::$app->db->beginTransaction();
            try {
                $model = StatHighcoinMinistry::find()->where(['phiscal_year_id' => $year->id])->one();
                if (!isset($model)) {
                    $model = new StatHighcoinMinistry();
                    $model->phiscal_year_id = $year->id;
                    $model->user_id = Yii::$app->user->id;
                }
                $model->last_update = date('Y-m-d H:i:s');
                $model->saved = 1;

                if (!$model->save()) throw new Exception(json_encode($model->errors));

                $detail = StatHighcoinMinistryDetail::find()
                ->where([
                    'stat_highcoin_ministry_id' => $model->id,
                    'ministry_id' => $post['Model']['ministry']['id'],
                    'award_id' => $post['Model']['award']['id'],
                ])->one();
                if(!isset($detail)) {
                    $detail = new StatHighcoinMinistryDetail();
                    $detail->stat_highcoin_ministry_id = $model->id;
                    $detail->ministry_id= $post['Model']['ministry']['id'];
                    $detail->award_id= $post['Model']['award']['id'];
                }
                $detail->attributes = $post['Model'];
                if (!$detail->save()) throw new Exception(json_encode($detail->errors));

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
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app', 'Incorrect Phiscal Year'));
            return;
        }

        $models = StatHighcoinMinistryDetail::find()->alias('d')
            ->select([
                'd.*',
                'ministry' => 'm.name',
                'award' => 'a.name'
            ])
            ->join('join', 'stat_highcoin_ministry t', 't.id=d.stat_highcoin_ministry_id and t.phiscal_year_id=:year', [':year'=> $year->id])
            ->join('join', 'ministry m', 'm.id=d.ministry_id')
            ->join('join', 'award a', 'a.id=d.award_id')
            ->asArray()->all();


        return $this->renderPartial('../ministry/print', ['content' => $this->renderPartial('table', ['models' => $models, 'year' => $year])]);
    }

    public function actionDownload($year) {
        $year = PhiscalYear::findOne($year);
        if(!isset($year)) {
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app', 'Incorrect Phiscal Year'));
            return;
        }
        $models = StatHighcoinMinistryDetail::find()->alias('d')
            ->select([
                'd.*',
                'ministry' => 'm.name',
                'award' => 'a.name'
            ])
            ->join('join', 'stat_highcoin_ministry t', 't.id=d.stat_highcoin_ministry_id and t.phiscal_year_id=:year', [':year'=> $year->id])
            ->join('join', 'ministry m', 'm.id=d.ministry_id')
            ->join('join', 'award a', 'a.id=d.award_id')
            ->asArray()->all();

        return $this->renderPartial('../ministry/excel', [
            'file' => 'Research '. $year->year . '.xls',
            'content' => $this->renderPartial('table', ['models' => $models, 'year' => $year])
        ]);
    }

    /**
     * Finds the StatHighcoinMinistry model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return StatHighcoinMinistry the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = StatHighcoinMinistry::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
}
