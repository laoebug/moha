<?php

namespace app\controllers;

use app\components\MyHelper;
use app\models\PhiscalYear;
use app\models\StatInstituteTrainDetail;
use Codeception\Util\HttpCode;
use Yii;
use app\models\StatInstituteTrain;
use app\models\StatInstituteTrainSearch;
use yii\db\Exception;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;

/**
 * StatInstituteTrainController implements the CRUD actions for StatInstituteTrain model.
 */
class StatInstituteTrainController extends Controller
{

    public function actionIndex()
    {
        return $this->render('index');
    }

    public function actionGet() {
        $years = PhiscalYear::find()->where(['deleted' => 0])->asArray()->all();
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
        $models = StatInstituteTrainDetail::find()->alias('d')
            ->select('d.*')
            ->addSelect([
                'start_date' => 'date(start_date)',
                'end_date' => 'date(end_date)',
            ])
            ->join('join', 'stat_institute_train t', 't.id=d.stat_institute_train_id and t.phiscal_year_id=:year', [':year'=> $year->id])
            ->asArray()->all();

        foreach ($models as $i => $model) {
            if(isset($model->start_date))
                $models[$i]['start_date'] = MyHelper::convertdatefordisplay($model->start_date);
            if(isset($model->end_date))
                $models[$i]['end_date'] = MyHelper::convertdatefordisplay($model->end_date);
        }

        return json_encode([
            'models' => $models
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
                $model = StatInstituteTrain::find()->where(['phiscal_year_id' => $year->id])->one();
                if (!isset($model)) {
                    $model = new StatInstituteTrain();
                    $model->phiscal_year_id = $year->id;
                    $model->user_id = Yii::$app->user->id;
                }
                $model->last_update = date('Y-m-d H:i:s');
                $model->saved = 1;

                if (!$model->save()) throw new Exception(json_encode($model->errors));

                $detail = isset($post['Model']['id'])? StatInstituteTrainDetail::findOne($post['Model']['id']):new StatInstituteTrainDetail();
                $detail->attributes = $post['Model'];
                $detail->start_date = MyHelper::convertdatefordb($detail->start_date);
                $detail->end_date = MyHelper::convertdatefordb($detail->end_date);
                $detail->stat_institute_train_id = $model->id;
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

        $models = StatInstituteTrainDetail::find()->alias('d')
            ->join('join', 'stat_institute_train t', 't.id = d.stat_institute_train_id and t.phiscal_year_id=:year', [':year' => $year->id])
            ->asArray()->all();

        return $this->renderPartial('../ministry/print', ['content' => $this->renderPartial('table', ['models' => $models, 'year' => $year])]);
    }

    public function actionDownload($year) {
        $year = PhiscalYear::findOne($year);
        if(!isset($year)) {
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app', 'Incorrect Phiscal Year'));
            return;
        }

        $models = StatInstituteTrainDetail::find()->alias('d')
            ->join('join', 'stat_institute_train t', 't.id = d.stat_institute_train_id and t.phiscal_year_id=:year', [':year' => $year->id])
            ->asArray()->all();

        return $this->renderPartial('../ministry/excel', [
            'file' => 'Institute Training '. $year->year . '.xls',
            'content' => $this->renderPartial('table', ['models' => $models, 'year' => $year])
        ]);
    }

    /**
     * Finds the StatInstituteTrain model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return StatInstituteTrain the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = StatInstituteTrain::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
}
