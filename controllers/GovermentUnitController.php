<?php

namespace app\controllers;

use app\models\Branch;
use app\models\BranchGroup;
use app\models\Govermentlevel;
use app\models\PhiscalYear;
use app\models\StatGovermentUnit;
use app\models\StatGovermentUnitDetail;
use Yii;
use app\models\GovermentUnit;
use yii\db\Exception;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;

/**
 * GovermentUnitController implements the CRUD actions for GovermentUnit model.
 */
class GovermentUnitController extends Controller
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

    public function actionReport($phiscalyearid) {
        $year = PhiscalYear::find()
            ->where(['id' => $phiscalyearid, 'deleted' => 0])
            ->one();
        if(!isset($year)) return Yii::t('app','Incorrect Phiscal Year');

        $branchgroups = BranchGroup::find()
            ->with([
                'branches' => function (\yii\db\ActiveQuery $query) {
                    $query->andWhere(['deleted' => 0])
                        ->orderBy('id');
                },
            ])
            ->orderBy('id')
            ->all();

        $govermentlevels = Govermentlevel::find()
            ->where(['deleted' => 0])
            ->orderBy('id')
            ->all();

        return $this->renderPartial('report', [
            'year' => $year,
            'branchgroups' => $branchgroups,
            'govermentlevels' => $govermentlevels
        ]);
    }

    public function actionCreate($id) {
        $year = PhiscalYear::find()
            ->where(['id' => $id, 'deleted' => 0])
            ->one();
        if(!isset($year))
            Yii::$app->session->setFlash('danger', Yii::t('app','Incorrect Phiscal Year'));

        $transaction = Yii::$app->db->beginTransaction();
        try {
            $model = StatGovermentUnit::find()
                ->where(['phiscal_year_id' => $id])
                ->one();
            if (!isset($model)) {
                $model = new StatGovermentUnit();
                $model->user_id = Yii::$app->user->id;
                $model->phiscal_year_id = $id;
                $model->last_update = date('Y-m-d H:i:s');
                if (!$model->save())
                    throw new Exception(json_encode($model->errors));

                $branches = Branch::find()->where(['deleted' => 0])->orderBy("id")->all();
                $levels = Govermentlevel::find()->where(['deleted'])->orderBy('id')->all();
                foreach ($branches as $branch)
                    foreach ($levels as $level) {
                        $detail = new StatGovermentUnitDetail();
                        $detail->branch_id = $branch->id;
                        $detail->goverment_level_id = $level->id;
                        $detail->stat_goverment_unit_id = $model->id;
                        if(!$detail->save())
                            throw new Exception(json_encode($model->errors));
                    }
                $transaction->commit();
            }
            return $this->redirect(['update', 'id' => $id]);
        } catch (Exception $ex) {
            $transaction->rollBack();
            Yii::$app->session->setFlash('danger', $ex->getMessage());
            return $this->redirect(['index']);
        }
    }

    public function actionUpdate($id) {
        $year = PhiscalYear::find()
            ->where(['id' => $id, 'deleted' => 0])
            ->one();
        if(!isset($year)) {
            Yii::$app->session->setFlash('danger', Yii::t('app','Incorrect Phiscal Year'));
            return $this->redirect(['index']);
        }

        if($year->status != "O") {
            Yii::$app->session->setFlash('danger', Yii::t('app','Phiscal Year is not allowed to input data'));
            return $this->redirect(['index']);
        }

        $model = StatGovermentUnit::find()
            ->where(['phiscal_year_id' => $year->id])
            ->one();
        if(!isset($model)) {
            return $this->redirect(['create', 'id' => $id]);
        }

        $branchgroups = BranchGroup::find()
            ->with([
                'branches' => function (\yii\db\ActiveQuery $query) {
                    $query->andWhere(['deleted' => 0])
                        ->orderBy('position');
                },
            ])
            ->orderBy('position')
            ->all();

        $govermentlevels = Govermentlevel::find()
            ->where(['deleted' => 0])
            ->orderBy('position')
            ->all();

        return $this->render('update', [
            'year' => $year,
            'model' => $model,
            'branchgroups' => $branchgroups,
            'govermentlevels' => $govermentlevels
        ]);

        $post = Yii::$app->request->post();
        if (isset($post)) {
            $model->last_update = date('Y-m-d H:i:s');
            if (!$model->save())
                throw new Exception(json_encode($model->errors));
        }
    }

    /**
     * Lists all GovermentUnit models.
     * @return mixed
     */
    public function actionIndex()
    {
        $phiscalyears = PhiscalYear::find()
            ->where(['deleted' => 0])
            ->orderBy('year')
            ->all();
        return $this->render('index', [
            'phiscalyears' => $phiscalyears,
        ]);
    }

    /**
     * Finds the GovermentUnit model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return GovermentUnit the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = GovermentUnit::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
}
