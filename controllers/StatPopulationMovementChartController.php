<?php

namespace app\controllers;

use app\models\PhiscalYear;
use app\models\Province;
use app\models\StatPopulationMovementDetail;
use Codeception\Util\HttpCode;
use Yii;
use app\models\StatPopulationMovement;
use yii\helpers\ArrayHelper;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;

/**
 * StatPopulationMovementController implements the CRUD actions for StatPopulationMovement model.
 */
class StatPopulationMovementChartController extends Controller
{
    public $COLUMNS = [
        'population_total'
        ,'population_women'
        ,'province'
        ,'district'
        ,'village'
        ,'born_total'
        ,'born_women'
        ,'die_total'
        ,'die_women'
        ,'married'
        ,'divorce'
        ,'movein_total'
        ,'movein_women'
        ,'moveout_total'
        ,'moveout_women'
        ,'real_total'
        ,'real_women'
    ];

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
     * Lists all StatPopulationMovement models.
     * @return mixed
     */
    public function actionIndex()
    {
        return $this->render('index', [
            'columns' => $this->COLUMNS
        ]);
    }

    public function actionGet() {
        $years = PhiscalYear::find()
            ->where(['deleted' => 0])->asArray()->all();

        return json_encode([
            'years' => $years,
        ]);
    }

    public function actionEnquiry($year) {
        $year = PhiscalYear::findOne($year);
        if(!isset($year)) {
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app', 'Inccorect Phiscal Year'));
            return;
        }

        return json_encode([
//            'labels' =>
            'models' => $this->getModels($year)
        ]);
    }

    public function actionInquiry() {
        $years = PhiscalYear::find()->select('id, year, status')->asArray()->all();
        $year = implode(',', ArrayHelper::getColumn($years, 'id'));
        $models = $this->getModels();
        return json_encode(
            [
                'models' => $models,
                'stat' => [
                    'labels' => ArrayHelper::getColumn($years, 'year'),
                    'series' => [Yii::t('app', 'Total'), Yii::t('app', 'Women')],
                    'data' => [
                        ArrayHelper::getColumn($models, 'population_total'),
                        ArrayHelper::getColumn($models, 'population_women')
                    ]
                ],
            ]
        );
    }

    public function actionPrint($year) {
        $year = PhiscalYear::findOne($year);
        if(!isset($year)) {
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app', 'Inccorect Phiscal Year'));
            return;
        }

        return $this->renderPartial('../ministry/print', [
            'content' => $this->renderPartial('table', [
                'year' => $year,
                'cols' => $this->COLUMNS,
                'models' => $this->getModels($year)
            ])
        ]);
    }

    public function actionDownload($year) {
        $year = PhiscalYear::findOne($year);
        if(!isset($year)) {
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app', 'Inccorect Phiscal Year'));
            return;
        }

        return $this->renderPartial('../ministry/excel', [
            'file' => 'Stat Local Administration '. $year->year .'.xls',
            'content' => $this->renderPartial('table', [
                'year' => $year,
                'cols' => $this->COLUMNS,
                'models' => $this->getModels($year)
            ])
        ]);
    }

    public function getModels($year = "") { //1,2,3,
        $query = PhiscalYear::find()
            ->alias('y')
            ->select('y.year');
        foreach ($this->COLUMNS as $col)
            if($col == 'province')
                $query->addSelect("count(d.province_id) as $col");
            else
                $query->addSelect("sum(d.$col) as $col");

         $query->join('left join', 'stat_population_movement p', 'y.id = p.phiscal_year_id')
            ->join('join', 'stat_population_movement_detail d', 'p.id=d.stat_population_movement_id');

        if($year != "")
            $query->andWhere('y.id in (:year)', [":year" => $year]);

        $models = $query
            ->groupBy('y.id')
             ->orderBy('y.year')
             ->asArray()->all();
         return $models;
    }

    /**
     * Finds the StatPopulationMovement model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return StatPopulationMovement the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = StatPopulationMovement::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
}
