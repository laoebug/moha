<?php

namespace app\controllers;

use app\components\MyHelper;
use app\models\LegalType;
use app\models\PhiscalYear;
use Codeception\Util\HttpCode;
use function foo\func;
use Yii;
use app\models\StatLegal;
use app\models\StatLegalSearch;
use yii\db\ActiveQuery;
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

        $models = LegalType::find()
            ->alias('t')
            ->with([
                'legals' => function(ActiveQuery $query) use($year) {
                    $query->where(['deleted' => 0])
                        ->select('d.*, l.*')
                        ->alias('l')
                        ->join('left join', 'stat_legal_detail d', 'd.legal_id = l.id')
                        ->join('join', 'stat_legal s', 's.id=d.stat_legal_id and s.phiscal_year_id=:year', [':year' => $year->id])
                        ->orderBy('position');
                }
            ])
            ->where(['deleted' => 0])
            ->orderBy('position')->asArray()->all();

        return json_encode([
            'models' => $models
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
