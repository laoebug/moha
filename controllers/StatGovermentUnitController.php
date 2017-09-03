<?php

namespace app\controllers;

use app\models\BranchGroup;
use app\models\PhiscalYear;
use app\models\StatGovermentUnitDetail;
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

        $branchgroups = BranchGroup::find()
            ->with([
                'branches' => function(ActiveQuery $query)  {
                    $query
                        ->where(['deleted' => 0])
                        ->orderBy('position');
                }
            ])->where(['deleted' => 0])->orderBy('position')->asArray()->all();

        return json_encode([
            "years" => $years,
            "branchgroups" => $branchgroups,
        ]);
    }

    private function enquiry($year) {
        $groups = BranchGroup::find()
            ->with([
                'branches' => function(ActiveQuery $query) {
                    $query->where(['deleted' => 0])->orderBy('position');
                }
            ])
            ->where(['deleted' => 0])->orderBy('position')->all();

        $model = StatGovermentUnit::find()
            ->with([
                'statGovermentUnitDetails' => function(ActiveQuery $query) {
                    $query->orderBy('branch_id');
                }
            ])
            ->where(['phiscal_year_id' => $year])
            ->one();
        return $this->renderPartial('table', [
            'groups' => $groups,
            'model' => $model,
            'year' => $model->phiscalYear,
        ]);
    }

    public function actionEnquiry($year) {
        return $this->enquiry($year);
    }

    public function actionInquiry($year, $branch) {
        $detail = StatGovermentUnitDetail::find()
            ->with(['statGovermentUnit' => function(ActiveQuery $query) use($year) {
                $query->where(['phiscal_year_id' => $year]);
            }])
            ->where(['branch_id' => $branch])->asArray()->one();
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
                    ->where(['stat_goverment_unit_id' => $model->id, 'branch_id' => $post['branch']])->one();
                if(!isset($detail)) {
                    $detail = new StatGovermentUnitDetail();
                    $detail->branch_id = $post['branch'];
                    $detail->stat_goverment_unit_id = $model->id;
                }
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
