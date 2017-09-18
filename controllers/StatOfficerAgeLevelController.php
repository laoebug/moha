<?php

namespace app\controllers;

use app\components\MyHelper;
use app\models\OfficerLevel;
use app\models\PhiscalYear;
use app\models\StatOfficerAgelevelDetail;
use Codeception\Util\HttpCode;
use Yii;
use app\models\StatOfficerAgeLevel;
use app\models\StatOfficerAgeLevelSearch;
use yii\db\Exception;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;

/**
 * StatOfficerAgeLevelController implements the CRUD actions for StatOfficerAgeLevel model.
 */
class StatOfficerAgeLevelController extends Controller
{
    public $columns = [
        'total_18', 'women_18',
        'total_20', 'women_20',
        'total_25', 'women_25',
        'total_30', 'women_30',
        'total_35', 'women_35',
        'total_40', 'women_40',
        'total_45', 'women_45',
        'total_50', 'women_50',
        'total_55', 'women_55',
        'total_60', 'women_60',
        'total_60p', 'women_60p',
    ];

    public $labels = [
        '<18', '18-20','21-25', '26-30', '31-35', '35-40', '41-45', '46-50', '51-55', '56-60', '60+'
    ];

    /**
     * Lists all StatOfficerAgeLevel models.
     * @return mixed
     */
    public function actionIndex()
    {
        return $this->render('index', [
            'columns' => $this->columns,
            'labels' => $this->labels
        ]);
    }

    public function actionGet() {
        $years = PhiscalYear::find()->where(['deleted' => 0])->asArray()->all();
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

        $models = StatOfficerAgelevelDetail::find()->alias('d')
            ->select('d.*')->addSelect(['name' => 'l.name'])
            ->join('join', 'stat_officerage_level s', 's.id = d.stat_officerage_level_id and s.phiscal_year_id=:year', [':year' => $year->id])
            ->join('join', 'officer_level l', 'l.id=d.officer_level_id')
            ->asArray()->all();

        return json_encode(['models' => $models]);
    }

    public function actionInquiry($year, $level) {
        $year = PhiscalYear::findOne($year);
        if(!isset($year)) {
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app', 'Incorrect Phiscal Year'));
            return;
        }

        $model = StatOfficerAgeLevelDetail::find()->alias('d')
            ->join('join', 'stat_officerage_level s', 's.id = d.stat_officerage_level_id and s.phiscal_year_id=:year', [':year' => $year->id])
            ->where(['officer_level_id' => $level])
            ->asArray()->one();

        return json_encode([
            'model' => $model
        ]);
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
                $model = StatOfficerAgeLevel::find()->where(['phiscal_year_id' => $year->id])->one();
                if(!isset($model)) {
                    $model = new StatOfficerAgeLevel();
                    $model->phiscal_year_id = $year->id;
                    $model->user_id = Yii::$app->user->id;
                }
                $model->saved = 1;
                $model->last_update = date('Y-m-d H:i:s');
                if(!$model->save()) throw new Exception(json_encode($model->errors));

                $detail = StatOfficerAgeLevelDetail::find()
                    ->where(['stat_officer_agelevel_id' => $model->id,'officer_level_id' => $post['Model']['level']['id']])
                    ->one();
                if(!isset($detail)) {
                    $detail = new StatOfficerAgeLevelDetail();
                    $detail->stat_officer_agelevel_id = $model->id;
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
        }
    }

    public function actionPrint($year) {
        $year = PhiscalYear::findOne($year);
        if(!isset($year)) {
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app', 'Incorrect Phiscal Year'));
            return;
        }

        $models = StatOfficerAgeLevelDetail::find()->alias('d')
            ->select('d.*')->addSelect(['name' => 'l.name'])
            ->join('join', 'stat_officerage_level s', 's.id = d.stat_officerage_level_id and s.phiscal_year_id=:year', [':year' => $year->id])
            ->join('join', 'officer_level l', 'l.id=d.officer_level_id')
            ->asArray()->all();

        return $this->renderPartial('../ministry/print', [
            'content' => $this->renderPartial('table', [
                'labels' => $this->labels,
                'columns' => $this->columns,
                'models' => $models,
                'year' => $year
            ])
        ]);
    }

    public function actionDownload($year) {
        $year = PhiscalYear::findOne($year);
        if(!isset($year)) {
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app', 'Incorrect Phiscal Year'));
            return;
        }

        $models = StatOfficerAgeLevelDetail::find()->alias('d')
            ->select('d.*')->addSelect(['name' => 'l.name'])
            ->join('join', 'stat_officerage_level s', 's.id = d.stat_officerage_level_id and s.phiscal_year_id=:year', [':year' => $year->id])
            ->join('join', 'officer_level l', 'l.id=d.officer_level_id')
            ->asArray()->all();

        return $this->renderPartial('../ministry/excel', [
            'file' => 'Stat Officer AgeLevel '. $year->year . '.xls',
            'content' => $this->renderPartial('table', [
                'labels' => $this->labels,
                'columns' => $this->columns,
                'models' => $models,
                'year' => $year
            ])
        ]);
    }

    /**
     * Finds the StatOfficerAgeLevel model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return StatOfficerAgeLevel the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = StatOfficerAgeLevel::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
}
