<?php

namespace app\controllers;

use app\components\MyHelper;
use app\models\Award;
use app\models\Ministry;
use app\models\PhiscalYear;
use app\models\StatVictoryoverseaMinistryDetail;
use Codeception\Util\HttpCode;
use Yii;
use app\models\StatVictoryoverseaMinistry;
use app\models\StatVictoryoverseaMinistrySearch;
use yii\db\Exception;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;

/**
 * StatVictoryoverseaMinistryController implements the CRUD actions for StatVictoryoverseaMinistry model.
 */
class StatVictoryoverseaMinistryController extends Controller
{
    public $columns = [
        'free1_personal','free1_team',
        'free2_personal','free2_team',
        'free3_personal','free3_team',

        'revo1_personal','revo1_team',
        'revo2_personal','revo2_team',
        'revo3_personal','revo3_team',

        'labo1_personal','labo1_team',
        'labo2_personal','labo2_team',
        'labo3_personal','labo3_team',

        'deve1_personal','deve1_team',
        'deve2_personal','deve2_team',
        'deve3_personal','deve3_team',

        'frien_personal','frien_team'
    ];

    public $lables = ['ຫຼຽນໄຊອິດສະຫຼະ', 'ຫຼຽນໄຊປະຕິວັດຊະນະເລີດ', 'ຫຼຽນໄຊແຮງງານ', 'ຫຼຽນໄຊພັດທະນາ'];
    public $levels = ['ຊັ້ນ I', 'ຊັ້ນ II', 'ຊັ້ນ III'];

    public function actionIndex()
    {
        return $this->render('index', [
            'labels' => $this->lables,
            'levels' => $this->levels
        ]);
    }

    public function actionGet() {
        $years = PhiscalYear::find()->where(['deleted' => 0])->asArray()->all();
        $awards = Award::find()->where(['deleted' => 0])->orderBy('position')->asArray()->all();
        $ministries = Ministry::find()->where(['deleted' =>0])->orderBy('position')->asArray()->all();

        return json_encode([
            'years' => $years,
            'awards' => $awards,
            'ministries' => $ministries
        ]);
    }

    public function actionEnquiry($year) {
        $year = PhiscalYear::findOne($year);
        if(!isset($year)) {
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app', 'Incorrect Phiscal Year'));
            return;
        }
        $models = StatVictoryoverseaMinistryDetail::find()->alias('d')
            ->select([
                'd.*',
                'ministry' => 'm.name',
                'award' => 'a.name'
            ])
            ->join('join', 'stat_victoryoversea_ministry t', 't.id=d.stat_victoryoversea_ministry_id and t.phiscal_year_id=:year', [':year'=> $year->id])
            ->join('join', 'ministry m', 'm.id=d.ministry_id')
            ->join('join', 'award a', 'a.id=d.award_id')
            ->orderBy('m.position')
            ->asArray()->all();

        return json_encode([
            'models' => $models
        ]);
    }

    public function actionInquiry($year, $ministry, $award) {
        $year = PhiscalYear::findOne($year);
        if(!isset($year)) {
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app', 'Incorrect Phiscal Year'));
            return;
        }

        $model = StatVictoryoverseaMinistryDetail::find()->alias('d')
            ->join('join', 'stat_victoryoversea_ministry m', 'm.id = d.stat_victoryoversea_ministry_id and m.phiscal_year_id=:year', [':year' => $year->id])
            ->where([
                'award_id' => $award,
                'ministry_id' => $ministry,
            ])->asArray()->one();

        return json_encode(['model' => $model]);
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
                $model = StatVictoryoverseaMinistry::find()->where(['phiscal_year_id' => $year->id])->one();
                if (!isset($model)) {
                    $model = new StatVictoryoverseaMinistry();
                    $model->phiscal_year_id = $year->id;
                    $model->user_id = Yii::$app->user->id;
                }
                $model->last_update = date('Y-m-d H:i:s');
                $model->saved = 1;

                if (!$model->save()) throw new Exception(json_encode($model->errors));

                $detail = StatVictoryoverseaMinistryDetail::find()
                    ->where([
                        'stat_victoryoversea_ministry_id' => $model->id,
                        'ministry_id' => $post['Model']['ministry']['id'],
                        'award_id' => $post['Model']['award']['id'],
                    ])->one();
                if(!isset($detail)) {
                    $detail = new StatVictoryoverseaMinistryDetail();
                    $detail->ministry_id = $post['Model']['ministry']['id'];
                    $detail->award_id = $post['Model']['award']['id'];
                    $detail->stat_victoryoversea_ministry_id = $model->id;
                }
                $detail->attributes = $post['Model'];

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

        $models = StatVictoryoverseaMinistryDetail::find()->alias('d')
            ->select([
                'd.*',
                'ministry' => 'm.name',
                'award' => 'a.name'
            ])
            ->join('join', 'stat_victoryoversea_ministry t', 't.id=d.stat_victoryoversea_ministry_id and t.phiscal_year_id=:year', [':year'=> $year->id])
            ->join('join', 'ministry m', 'm.id=d.ministry_id')
            ->join('join', 'award a', 'a.id=d.award_id')
            ->asArray()->all();


        return $this->renderPartial('../ministry/print', [
            'content' => $this->renderPartial('table', [
                'models' => $models,
                'year' => $year,
                'cols' => $this->columns,
                'labels' => $this->lables,
                'levels' => $this->levels,
            ])
        ]);
    }

    public function actionDownload($year) {
        $year = PhiscalYear::findOne($year);
        if(!isset($year)) {
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app', 'Incorrect Phiscal Year'));
            return;
        }
        $models = StatVictoryoverseaMinistryDetail::find()->alias('d')
            ->select([
                'd.*',
                'ministry' => 'm.name',
                'award' => 'a.name'
            ])
            ->join('join', 'stat_victoryoversea_ministry t', 't.id=d.stat_victoryoversea_ministry_id and t.phiscal_year_id=:year', [':year'=> $year->id])
            ->join('join', 'ministry m', 'm.id=d.ministry_id')
            ->join('join', 'award a', 'a.id=d.award_id')
            ->asArray()->all();

        return $this->renderPartial('../ministry/excel', [
            'file' => 'Victory Oversea Ministry '. $year->year . '.xls',
            'content' => $this->renderPartial('table', [
                'models' => $models,
                'year' => $year,
                'cols' => $this->columns,
                'labels' => $this->lables,
                'levels' => $this->levels,
            ])
        ]);
    }

    /**
     * Finds the StatVictoryoverseaMinistry model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return StatVictoryoverseaMinistry the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = StatVictoryoverseaMinistry::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
}
