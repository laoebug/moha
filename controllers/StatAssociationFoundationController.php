<?php

namespace app\controllers;

use app\components\MyHelper;
use app\models\ApproverLevel;
use app\models\PhiscalYear;
use app\models\StatAssociationFoundationDetail;
use Codeception\Util\HttpCode;
use function foo\func;
use Yii;
use app\models\StatAssociationFoundation;
use app\models\StatAssociationFoundationSearch;
use yii\db\ActiveQuery;
use yii\db\Exception;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;

/**
 * StatAssociationFoundationController implements the CRUD actions for StatAssociationFoundation model.
 */
class StatAssociationFoundationController extends Controller
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
     * Lists all StatAssociationFoundation models.
     * @return mixed
     */
    public function actionIndex()
    {
        return $this->render('index');
    }

    public function actionGet() {
        $years = PhiscalYear::find()
            ->where(['deleted' => 0])->asArray()->all();

        $approverLevels = ApproverLevel::find()
            ->alias('l')
            ->with([
                'approvers' => function(ActiveQuery $query) {
                    $query->alias('a')
                        ->with([
                            'province' => function(ActiveQuery $query) {
                                $query->alias('p')
                                    ->orderBy('p.position');
                            },
                            'ministry' => function(ActiveQuery $query) {
                                $query->alias('m')
                                    ->orderBy('m.position');
                            }
                        ])
                        ->where(['a.deleted' => 0]);
                }
            ])
            ->where(['l.deleted' => 0])->orderBy('l.position')->asArray()->all();

        return json_encode([
            "years" => $years,
            "approverLevels" => $approverLevels,
        ]);
    }

    public function actionEnquiry($year) {
        $year = PhiscalYear::findOne($year);
        if(!isset($year)) {
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app', 'Inccorect Phiscal Year'));
            return;
        }

        $models = ApproverLevel::find()
            ->with([
                'approvers' => function(ActiveQuery $query) use($year) {
                    $query->where(['deleted' => 0])
                        ->with([
                            'province' => function(ActiveQuery $query)  {
                                $query->alias('p')
                                    ->orderBy('p.position');
                            },
                            'ministry' => function(ActiveQuery $query)  {
                                $query->alias('m')
                                    ->orderBy('m.position');
                            }
                        ])
                        ->alias('a')
                        ->select('a.*, d.*')
                        ->join('left join', 'stat_association_foundation_detail d', 'a.id = d.approver_id')
                        ->join('join', 'stat_association_foundation f', 'f.id = d.stat_association_foundation_id and f.phiscal_year_id=:year', [':year' => $year->id])
                        ;
                }
            ])->alias('l')
            ->where(['l.deleted' => 0])->orderBy('l.position')->asArray()->all();

        return json_encode([
            'models' => $models
        ]);
    }

    public function actionInquiry($year, $approver) {
        $year = PhiscalYear::findOne($year);
        if(!isset($year)) {
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app', 'Inccorect Phiscal Year'));
            return;
        }

        $model = StatAssociationFoundationDetail::find()->where(['approver_id' => $approver])
            ->alias('d')
            ->join('join', 'stat_association_foundation f', 'f.id = d.stat_association_foundation_id and f.phiscal_year_id=:year', [':year' => $year->id])
            ->asArray()->one();

        return json_encode([
            'model' => $model
        ]);
    }

    public function actionSave($year) {
        $post = Yii::$app->request->post();
        if(!isset($post)) {
            MyHelper::response(HttpCode::BAD_REQUEST, Yii::t('app', 'Inccorect Request Method'));
            return;
        }

        $year = PhiscalYear::findOne($year);
        if(!isset($year)) {
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app', 'Inccorect Phiscal Year'));
            return;
        }

        if($year->status != 'O') {
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app', 'The Year is not allowed to input'));
            return;
        }

        $transaction = Yii::$app->db->beginTransaction();
        try {
            $model = StatAssociationFoundation::find()
                ->where(['phiscal_year_id' => $year->id])->one();
            if(!isset($model)) {
                $model = new StatAssociationFoundation();
                $model->user_id = Yii::$app->user->id;
                $model->phiscal_year_id = $year->id;
            }
            $model->last_update = date('Y-m-d H:i:s');
            $model->saved = 1;
            if(!$model->save()) throw new Exception(json_encode($model->errors));

            $detail = StatAssociationFoundationDetail::find()
                ->where(['stat_association_foundation_id' => $model->id, 'approver_id' => $post['StatAssociationFoundationDetail']['approver']['id']])
                ->one();
            if(!isset($detail)) {
                $detail = new StatAssociationFoundationDetail();
                $detail->stat_association_foundation_id = $model->id;
                $detail->approver_id = $post['StatAssociationFoundationDetail']['approver']['id'];
            }
            $detail->load($post);
            if(!$detail->save()) throw new Exception(json_encode($detail->errors));

            $transaction->commit();
        }catch (Exception $exception) {
            $transaction->rollBack();
            MyHelper::response(HttpCode::INTERNAL_SERVER_ERROR, $exception->getMessage());
            return;
        }
    }

    public function actionPrint($year) {
        $year = PhiscalYear::findOne($year);
        if(!isset($year)) {
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app', 'Inccorect Phiscal Year'));
            return;
        }
        $models = ApproverLevel::find()
            ->with([
                'approvers' => function(ActiveQuery $query) use($year) {
                    $query->where(['deleted' => 0])
                        ->with([
                            'province' => function(ActiveQuery $query)  {
                                $query->alias('p')
                                    ->orderBy('p.position');
                            },
                            'ministry' => function(ActiveQuery $query)  {
                                $query->alias('m')
                                    ->orderBy('m.position');
                            }
                        ])
                        ->alias('a')
                        ->select('a.*, d.*')
                        ->join('left join', 'stat_association_foundation_detail d', 'a.id = d.approver_id')
                        ->join('join', 'stat_association_foundation f', 'f.id = d.stat_association_foundation_id and f.phiscal_year_id=:year', [':year' => $year->id])
                    ;
                }
            ])->alias('l')
            ->where(['l.deleted' => 0])->orderBy('l.position')->asArray()->all();


        return $this->renderPartial('../ministry/print', [
            'content' => $this->renderPartial('table', ['models' => $models, 'year' => $year])
        ]);
    }

    public function actionDownload($year) {
        $year = PhiscalYear::findOne($year);
        if(!isset($year)) {
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app', 'Inccorect Phiscal Year'));
            return;
        }
        $models = ApproverLevel::find()
            ->with([
                'approvers' => function(ActiveQuery $query) use($year) {
                    $query->where(['deleted' => 0])
                        ->with([
                            'province' => function(ActiveQuery $query)  {
                                $query->alias('p')
                                    ->orderBy('p.position');
                            },
                            'ministry' => function(ActiveQuery $query)  {
                                $query->alias('m')
                                    ->orderBy('m.position');
                            }
                        ])
                        ->alias('a')
                        ->select('a.*, d.*')
                        ->join('left join', 'stat_association_foundation_detail d', 'a.id = d.approver_id')
                        ->join('join', 'stat_association_foundation f', 'f.id = d.stat_association_foundation_id and f.phiscal_year_id=:year', [':year' => $year->id])
                    ;
                }
            ])->alias('l')
            ->where(['l.deleted' => 0])->orderBy('l.position')->asArray()->all();


        return $this->renderPartial('../ministry/excel', [
            'file' => 'Stat Association Foundation '. $year->year . '.xls',
            'content' => $this->renderPartial('table', ['models' => $models, 'year' => $year])
        ]);
    }

    /**
     * Finds the StatAssociationFoundation model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return StatAssociationFoundation the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = StatAssociationFoundation::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
}
