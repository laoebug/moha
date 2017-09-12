<?php

namespace app\controllers;

use app\components\MyHelper;
use app\models\LegalType;
use app\models\PhiscalYear;
use app\models\StatLegalDetail;
use Codeception\Util\HttpCode;
use function foo\func;
use Yii;
use app\models\StatLegal;
use app\models\StatLegalSearch;
use yii\db\ActiveQuery;
use yii\db\Exception;
use yii\web\Controller;
use yii\web\MethodNotAllowedHttpException;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;

/**
 * StatLegalController implements the CRUD actions for StatLegal model.
 */
class StatLegalController extends Controller
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
     * Lists all StatLegal models.
     * @return mixed
     */
    public function actionIndex()
    {
        return $this->render('index');
    }

    public function actionGet() {
        $years = PhiscalYear::find()
            ->where(['deleted' => 0])->asArray()->all();

        $legalTypes = LegalType::find()
            ->with([
                'legals' => function(ActiveQuery $query) {
                    $query->where(['deleted' => 0])->orderBy('position');
                }
            ])
            ->where(['deleted' => 0])->orderBy('position')->asArray()->all();

        return json_encode([
            'years' => $years,
            'legalTypes' => $legalTypes
        ]);
    }

    public function actionEnquiry($year) {
        $year = PhiscalYear::findOne($year);
        if(!isset($year)) {
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app', 'Inccorect Phiscal Year'));
            return;
        }

        $model = StatLegal::find()->where(['phiscal_year_id' => $year->id])->one();
        if(!isset($model)) {
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app', 'No Data'));
            return;
        }

        $models = LegalType::find()
            ->alias('t')
            ->with([
                'legals' => function(ActiveQuery $query) use($year) {
                    $query->where(['deleted' => 0])
                        ->select('d.*, l.*')
                        ->alias('l')
                        ->join('left join', 'stat_legal_detail d', 'd.legal_id = l.id')
                        ->orderBy('position');
                }
            ])
            ->where(['deleted' => 0])
            ->orderBy('position')->asArray()->all();

        return json_encode([
            'models' => $models
        ]);
    }

    public function actionInquiry($year, $legal) {
        $year = PhiscalYear::findOne($year);
        if(!isset($year)) {
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app', 'Inccorect Phiscal Year'));
            return;
        }

        $model = StatLegalDetail::find()->alias('d')
            ->with(['legal'])
            ->join('join', 'stat_legal l', 'l.id=d.stat_legal_id and l.phiscal_year_id=:year', [':year' => $year->id])
            ->where(['legal_id' => $legal])
            ->asArray()->one();

        return json_encode([
            'model' => $model
        ]);
    }

    public function actionSave($year) {
        $post = Yii::$app->request->post();
        if(!isset($post['StatLegalDetail'])) {
            MyHelper::response(HttpCode::BAD_REQUEST, Yii::t('app', 'Inccorect Request Method'));
            return;
        }
        $year = PhiscalYear::findOne($year);
        if(!isset($year)) {
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app', 'Inccorect Phiscal Year'));
            return;
        }
        if($year->status != 'O') {
            MyHelper::response(HttpCode::METHOD_NOT_ALLOWED, Yii::t('app', 'The Year is not allowed to input'));
            return;
        }

        $transaction = Yii::$app->db->beginTransaction();
        try {
            $model = StatLegal::find()->where(['phiscal_year_id' => $year->id])->one();
            if(!isset($model)) {
                $model = new StatLegal();
                $model->user_id = Yii::$app->user->id;
                $model->phiscal_year_id = $year->id;
            }
            $model->last_update = date('Y-m-d H:i:s');
            $model->saved = 1;
            if(!$model->save()) throw new Exception(json_encode($model->errors));

            $detail = StatLegalDetail::find()->alias('d')
                ->join('join', 'stat_legal l', 'd.stat_legal_id=l.id and l.phiscal_year_id=:year', [':year' => $year->id])
                ->where(['legal_id' => $post['StatLegalDetail']['legal']['id']])
                ->one();
//            return json_encode(['detail' => $detail]);exit;

            if(!isset($detail)) {
                $detail = new StatLegalDetail();
                $detail->legal_id = $post['StatLegalDetail']['legal']['id'];
                $detail->stat_legal_id = $model->id;
            }
            $detail->load($post);

            if(!$detail->save()) throw new Exception(json_encode($detail->errors));
            $transaction->commit();
        } catch (Exception $exception) {
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

        $model = StatLegal::find()->where(['phiscal_year_id' => $year->id])->one();
        if(!isset($model)) {
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app', 'No Data'));
            return;
        }

        $models = LegalType::find()
            ->alias('t')
            ->with([
                'legals' => function(ActiveQuery $query) use($year) {
                    $query->where(['deleted' => 0])
                        ->select('d.*, l.*')
                        ->alias('l')
                        ->join('left join', 'stat_legal_detail d', 'd.legal_id = l.id')
                        ->orderBy('position');
                }
            ])
            ->where(['deleted' => 0])
            ->orderBy('position')->asArray()->all();

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

        $model = StatLegal::find()->where(['phiscal_year_id' => $year->id])->one();
        if(!isset($model)) {
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app', 'No Data'));
            return;
        }

        $models = LegalType::find()
            ->alias('t')
            ->with([
                'legals' => function(ActiveQuery $query) use($year) {
                    $query->where(['deleted' => 0])
                        ->select('d.*, l.*')
                        ->alias('l')
                        ->join('left join', 'stat_legal_detail d', 'd.legal_id = l.id')
                        ->orderBy('position');
                }
            ])
            ->where(['deleted' => 0])
            ->orderBy('position')->asArray()->all();

        return $this->renderPartial('../ministry/excel', [
            'file' => 'Statistic of Internal Legal '. $year->year.'.xls',
            'content' => $this->renderPartial('table', ['models' => $models, 'year' => $year])
        ]);
    }
    /**
     * Finds the StatLegal model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return StatLegal the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = StatLegal::findOne($id)) !== null) {
            return $model;
        } else {
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app', 'The requested page does not exist.'));
            return;
        }
    }
}
