<?php

namespace app\controllers;

use app\components\MyHelper;
use app\models\OfficerLevel;
use app\models\PhiscalYear;
use app\models\StatOfficerTechnicalDetail;
use Codeception\Util\HttpCode;
use Yii;
use app\models\StatOfficerTechnical;
use app\models\StatOfficerTechnicalSearch;
use yii\db\Exception;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;

/**
 * StatOfficerTechnicalController implements the CRUD actions for StatOfficerTechnical model.
 */
class StatOfficerTechnicalController extends Controller
{
    public $columns = [
        'doctor',        
        'post_master',   
        'master',        
        'post_bachelor',
        'bachelor',      
        'high',          
        'middle',        
        'begin',         
        'hischool',      
        'second',        
        'primary',       
    ];

    public $labels = [
        'ປະລິນຍາເອກ', 'ເໜືອປະລິນຍາໂທ',
        'ປະລິນຍາໂທ', 'ເໜືອ ປ/ຕ ລົງເລິກຂະແໜງ',
        'ປະລິນຍາຕີ', 'ຊັ້ນສູງ ຫຼື ທຽນເທົ່າ',
        'ຊັ້ນກາງ', 'ຊັ້ນຕົ້ນ',
        'ມ/ຍ ປາຍ','ມ/ຍ ຕົ້ນ','ປະຖົມ',
    ];

    /**
     * Lists all StatOfficerTechnical models.
     * @return mixed
     */
    public function actionIndex()
    {
        return $this->render('index', [
            'labels' => $this->labels,
            'columns' => $this->columns,
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

        $models = StatOfficerTechnicalDetail::find()->alias('d')
            ->select('d.*')->addSelect(['name' => 'l.name'])
            ->join('join', 'stat_officer_technical s', 's.id = d.stat_officer_technical_id and s.phiscal_year_id=:year', [':year' => $year->id])
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

        $model = StatOfficerTechnicalDetail::find()->alias('d')
            ->join('join', 'stat_officer_technical s', 's.id = d.stat_officer_technical_id and s.phiscal_year_id=:year', [':year' => $year->id])
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
                $model = StatOfficerTechnical::find()->where(['phiscal_year_id' => $year->id])->one();
                if(!isset($model)) {
                    $model = new StatOfficerTechnical();
                    $model->phiscal_year_id = $year->id;
                    $model->user_id = Yii::$app->user->id;
                }
                $model->saved = 1;
                $model->last_update = date('Y-m-d H:i:s');
                if(!$model->save()) throw new Exception(json_encode($model->errors));

                $detail = StatOfficerTechnicalDetail::find()
                    ->where(['stat_officer_technical_id' => $model->id,'officer_level_id' => $post['Model']['level']['id']])
                    ->one();
                if(!isset($detail)) {
                    $detail = new StatOfficerTechnicalDetail();
                    $detail->stat_officer_technical_id = $model->id;
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

        $models = StatOfficerTechnicalDetail::find()->alias('d')
            ->select('d.*')->addSelect(['name' => 'l.name'])
            ->join('join', 'stat_officer_technical s', 's.id = d.stat_officer_technical_id and s.phiscal_year_id=:year', [':year' => $year->id])
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

        $models = StatOfficerTechnicalDetail::find()->alias('d')
            ->select('d.*')->addSelect(['name' => 'l.name'])
            ->join('join', 'stat_officer_technical s', 's.id = d.stat_officer_technical_id and s.phiscal_year_id=:year', [':year' => $year->id])
            ->join('join', 'officer_level l', 'l.id=d.officer_level_id')
            ->asArray()->all();

        return $this->renderPartial('../ministry/excel', [
            'file' => 'Stat Officer Technical '. $year->year . '.xls',
            'content' => $this->renderPartial('table', [
                'labels' => $this->labels,
                'columns' => $this->columns,
                'models' => $models,
                'year' => $year
            ])
        ]);
    }

    /**
     * Finds the StatOfficerTechnical model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return StatOfficerTechnical the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = StatOfficerTechnical::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
}
