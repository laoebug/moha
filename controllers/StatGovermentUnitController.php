<?php

namespace app\controllers;

use app\models\Ministry;
use app\models\MinistryGroup;
use app\models\PhiscalYear;
use app\models\StatGovermentUnitDetail;
use function foo\func;
use Yii;
use app\models\StatGovermentUnit;
use app\models\StatGovermentUnitSearch;
use yii\db\ActiveQuery;
use yii\db\Exception;
use yii\web\BadRequestHttpException;
use yii\web\Controller;
use yii\web\MethodNotAllowedHttpException;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use yii\web\Response;
use yii\web\ServerErrorHttpException;

/**
 * StatGovermentUnitController implements the CRUD actions for StatGovermentUnit model.
 */
class StatGovermentUnitController extends Controller
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
     * Lists all StatGovermentUnit models.
     * @return mixed
     */
    public function actionIndex($year = null)
    {
        $table = null;
        if(isset($year)) {
            $table = $this->enquiry($year);
        }
        return $this->render('index');
    }

    public function actionGet() {
        $years = PhiscalYear::find()
            ->where(['deleted' => 0])->asArray()->all();

        $ministries = Ministry::find()
            ->where(['deleted' => 0])->orderBy('position')->asArray()->all();

        return json_encode([
            "years" => $years,
            "ministries" => $ministries,
        ]);
    }

    private function enquiry($year, $showstatus = true) {
        $ministries = Ministry::find()
            ->where(['deleted' => 0])->orderBy('position')->all();

        $model = StatGovermentUnit::find()
            ->with([
                'statGovermentUnitDetails' => function(ActiveQuery $query) {
                    $query
                        ->with(['ministry' => function(ActiveQuery $query) {
                            $query->orderBy('position');
                        }]);
                }
            ])
            ->where(['phiscal_year_id' => $year])
            ->one();

        return $this->renderPartial('table', [
            'showstatus' => $showstatus,
            'ministries' => $ministries,
            'model' => $model,
            'year' => $model->phiscalYear,
        ]);
    }

    public function actionEnquiry($year) {
        return $this->enquiry($year);
    }

    public function actionInquiry($year, $ministry) {
        $detail = StatGovermentUnitDetail::find()
            ->with(['statGovermentUnit' => function(ActiveQuery $query) use($year) {
                $query->where(['phiscal_year_id' => $year]);
            }])
            ->where(['ministry_id' => $ministry])->asArray()->one();
        return json_encode($detail);
    }

    public function actionSave() {
        $post = Yii::$app->request->post();
        if(isset($post)) {
            $year = PhiscalYear::findOne($post['year']);
            if(!isset($year)) throw new BadRequestHttpException(Yii::t('app', 'Incorrect Phiscal Year'));
            if($year->status != "O") throw new MethodNotAllowedHttpException(Yii::t('app', 'The Year is not allowed to input'));

            $transaction = Yii::$app->db->beginTransaction();
            try {
                $model = StatGovermentUnit::find()->where(['phiscal_year_id' => $year->id])->one();
                if(!isset($model)) {
                    $model = new StatGovermentUnit();
                    $model->phiscal_year_id = $year->id;
                }
                $model->user_id = Yii::$app->user->id;
                $model->saved = 1;
                $model->last_update = date('Y-m-d H:i:s');
                if(!$model->save()) throw new Exception(json_encode($model->errors));

                $detail = StatGovermentUnitDetail::find()
                    ->where(['stat_goverment_unit_id' => $model->id, 'ministry_id' => $post['ministry']])->one();
                if(!isset($detail)) {
                    $detail = new StatGovermentUnitDetail();
                    $detail->ministry_id = $post['ministry'];
                    $detail->stat_goverment_unit_id = $model->id;
                }
                $detail->office = $post['office'];
                $detail->department = $post['department'];
                $detail->insitute = $post['insitute'];
                $detail->center = $post['center'];
                $detail->remark = $post['remark'];
                if(!$detail->save()) throw new Exception(json_encode($detail->errors));

                $transaction->commit();
                return $this->enquiry($year);
            } catch (Exception $exception) {
                $transaction->rollBack();
                throw new ServerErrorHttpException(Yii::t($exception->getMessage()));
            }
        }
    }

    public function actionPrint($year) {
        $year =PhiscalYear::findOne($year);
        if(!isset($year)) throw new  NotFoundHttpException(Yii::t('app', 'Inccorect Phiscal Year'));

        return $this->renderPartial('print', [
            'content' => $this->enquiry($year->id, false)
        ]);
    }

    public function actionDownload($year) {
        $year =PhiscalYear::findOne($year);
        if(!isset($year)) throw new  NotFoundHttpException(Yii::t('app', 'Inccorect Phiscal Year'));

        return $this->renderPartial('excel', [
            'file' => 'stat_goverment_unit_'.$year->year.'.xls',
            'content' => $this->enquiry($year->id, false)
        ]);
    }

    /**
     * Finds the StatGovermentUnit model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return StatGovermentUnit the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = StatGovermentUnit::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
}
