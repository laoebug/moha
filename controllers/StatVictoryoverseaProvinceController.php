<?php

namespace app\controllers;

use app\components\MyHelper;
use app\models\Attachment;
use app\models\Award;
use app\models\PhiscalYear;
use app\models\Province;
use app\models\StatVictoryoverseaProvince;
use app\models\StatVictoryoverseaProvinceDetail;
use app\services\AuthenticationService;
use Codeception\Util\HttpCode;
use Yii;
use yii\db\Exception;
use yii\web\Controller;
use yii\web\NotFoundHttpException;

/**
 * StatVictoryoverseaProvinceController implements the CRUD actions for StatVictoryoverseaProvince model.
 */
class StatVictoryoverseaProvinceController extends Controller
{
    public $columns = [
        'free1_personal', 'free1_team',
        'free2_personal', 'free2_team',
        'free3_personal', 'free3_team',

        'revo1_personal', 'revo1_team',
        'revo2_personal', 'revo2_team',
        'revo3_personal', 'revo3_team',

        'labo1_personal', 'labo1_team',
        'labo2_personal', 'labo2_team',
        'labo3_personal', 'labo3_team',

        'deve1_personal', 'deve1_team',
        'deve2_personal', 'deve2_team',
        'deve3_personal', 'deve3_team',

        'frien_personal', 'frien_team'
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

    public function actionGet()
    {
        $user = Yii::$app->user->identity;
        $controller_id = Yii::$app->controller->id;
        $acton_id = Yii::$app->controller->action->id;
        if ($user->role ["name"] != Yii::$app->params ['DEFAULT_ADMIN_ROLE']) {
            if (!AuthenticationService::isAccessibleAction($controller_id, $acton_id)) {
                MyHelper::response(HttpCode::UNAUTHORIZED, Yii::t('app', 'HTTP Error 401- You are not authorized to access this operaton due to invalid authentication') . " with ID:  " . $controller_id . "/ " . $acton_id);
                return;
            }
        }
        $years = PhiscalYear::find()->orderBy('year')->where(['deleted' => 0])->asArray()->all();
        $awards = Award::find()->where(['deleted' => 0])->orderBy('position')->asArray()->all();
        $provinces = Province::find()->asArray()->all();

        return json_encode([
            'years' => $years,
            'awards' => $awards,
            'provinces' => $provinces
        ]);
    }

    public function actionEnquiry($year)
    {
        $user = Yii::$app->user->identity;
        $controller_id = Yii::$app->controller->id;
        $acton_id = Yii::$app->controller->action->id;
        if ($user->role ["name"] != Yii::$app->params ['DEFAULT_ADMIN_ROLE']) {
            if (!AuthenticationService::isAccessibleAction($controller_id, $acton_id)) {
                MyHelper::response(HttpCode::UNAUTHORIZED, Yii::t('app', 'HTTP Error 401- You are not authorized to access this operaton due to invalid authentication') . " with ID:  " . $controller_id . "/ " . $acton_id);
                return;
            }
        }
        $year = PhiscalYear::findOne($year);
        if (!isset($year)) {
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app', 'Incorrect Phiscal Year'));
            return;
        }
        $models = StatVictoryoverseaProvinceDetail::find()->alias('d')
            ->select([
                'd.*',
                'province' => 'province.province_name',
                'award' => 'a.name'
            ])
            ->join('join', 'stat_victoryoversea_province t', 't.id=d.stat_victoryoversea_province_id and t.phiscal_year_id=:year', [':year' => $year->id])
            ->join('join', 'province', 'province.id=d.province_id')
            ->join('join', 'award a', 'a.id=d.award_id');
        $user = Yii::$app->user->identity;
        if (isset($user->role->province_id)) {
            $models = $models->andWhere(['d.province_id' => $user->role->province_id]);
        }
        $models = $models->orderBy('province.position')
            ->asArray()->all();

        return json_encode([
            'models' => $models
        ]);
    }

    public function actionInquiry($year, $province, $award)
    {
        $user = Yii::$app->user->identity;
        $controller_id = Yii::$app->controller->id;
        $acton_id = Yii::$app->controller->action->id;
        if ($user->role ["name"] != Yii::$app->params ['DEFAULT_ADMIN_ROLE']) {
            if (!AuthenticationService::isAccessibleAction($controller_id, $acton_id)) {
                MyHelper::response(HttpCode::UNAUTHORIZED, Yii::t('app', 'HTTP Error 401- You are not authorized to access this operaton due to invalid authentication') . " with ID:  " . $controller_id . "/ " . $acton_id);
                return;
            }
        }
        $year = PhiscalYear::findOne($year);
        if (!isset($year)) {
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app', 'Incorrect Phiscal Year'));
            return;
        }

        $model = StatVictoryoverseaProvinceDetail::find()->alias('d')
            ->join('join', 'stat_victoryoversea_province m', 'm.id = d.stat_victoryoversea_province_id and m.phiscal_year_id=:year', [':year' => $year->id])
            ->where([
                'award_id' => $award,
                'province_id' => $province,
            ]);
        $user = Yii::$app->user->identity;
        if (isset($user->role->province_id)) {
            $model = $model->andWhere(['d.province_id' => $user->role->province_id]);
        }
        $model = $model->asArray()->one();

        return json_encode(['model' => $model]);
    }

    public function actionSave($year)
    {
        $user = Yii::$app->user->identity;
        $controller_id = Yii::$app->controller->id;
        $acton_id = Yii::$app->controller->action->id;
        if ($user->role ["name"] != Yii::$app->params ['DEFAULT_ADMIN_ROLE']) {
            if (!AuthenticationService::isAccessibleAction($controller_id, $acton_id)) {
                MyHelper::response(HttpCode::UNAUTHORIZED, Yii::t('app', 'HTTP Error 401- You are not authorized to access this operaton due to invalid authentication') . " with ID:  " . $controller_id . "/ " . $acton_id);
                return;
            }
        }
        $year = PhiscalYear::findOne($year);
        if (!isset($year)) {
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app', 'Incorrect Phiscal Year'));
            return;
        }
        if ($year->status != 'O') {
            MyHelper::response(HttpCode::METHOD_NOT_ALLOWED, "The year is not allow to input");
            return;
        }

        $post = Yii::$app->request->post();
        if (isset($post)) {
            $transaction = Yii::$app->db->beginTransaction();
            try {
                $model = StatVictoryoverseaProvince::find()->where(['phiscal_year_id' => $year->id])->one();
                if (!isset($model)) {
                    $model = new StatVictoryoverseaProvince();
                    $model->phiscal_year_id = $year->id;
                    $model->user_id = Yii::$app->user->id;
                }
                $model->last_update = date('Y-m-d H:i:s');
                $model->saved = 1;

                if (!$model->save()) throw new Exception(json_encode($model->errors));

                $detail = StatVictoryoverseaProvinceDetail::find()
                    ->where([
                        'stat_victoryoversea_province_id' => $model->id,
                        'province_id' => $post['Model']['province']['id'],
                        'award_id' => $post['Model']['award']['id'],
                    ])->one();
                if (!isset($detail)) {
                    $detail = new StatVictoryoverseaProvinceDetail();
                    $detail->province_id = $post['Model']['province']['id'];
                    $detail->award_id = $post['Model']['award']['id'];
                    $detail->stat_victoryoversea_province_id = $model->id;
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

    public function actionDelete()
    {
        $post = Yii::$app->request->post();
        if (isset($post['Model']))
            if (isset($post['Model']['id']))
                return StatVictoryoverseaProvinceDetail::deleteAll(['id' => $post['Model']['id']]);
    }

    public function actionPrint($year)
    {
        $user = Yii::$app->user->identity;
        $controller_id = Yii::$app->controller->id;
        $acton_id = Yii::$app->controller->action->id;
        if ($user->role ["name"] != Yii::$app->params ['DEFAULT_ADMIN_ROLE']) {
            if (!AuthenticationService::isAccessibleAction($controller_id, $acton_id)) {
                MyHelper::response(HttpCode::UNAUTHORIZED, Yii::t('app', 'HTTP Error 401- You are not authorized to access this operaton due to invalid authentication') . " with ID:  " . $controller_id . "/ " . $acton_id);
                return;
            }
        }
        $year = PhiscalYear::findOne($year);
        if (!isset($year)) {
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app', 'Incorrect Phiscal Year'));
            return;
        }

        $models = StatVictoryoverseaProvinceDetail::find()->alias('d')
            ->select([
                'd.*',
                'province' => 'province.province_name',
                'award' => 'a.name'
            ])
            ->join('join', 'stat_victoryoversea_province t', 't.id=d.stat_victoryoversea_province_id and t.phiscal_year_id=:year', [':year' => $year->id])
            ->join('join', 'province', 'province.id=d.province_id')
            ->join('join', 'award a', 'a.id=d.award_id');
        $user = Yii::$app->user->identity;
        if (isset($user->role->province_id)) {
            $models = $models->andWhere(['d.province_id' => $user->role->province_id]);
        }
        $models = $models->orderBy('province.position')->asArray()->all();

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

    public function actionDownload($year)
    {
        $user = Yii::$app->user->identity;
        $controller_id = Yii::$app->controller->id;
        $acton_id = Yii::$app->controller->action->id;
        if ($user->role ["name"] != Yii::$app->params ['DEFAULT_ADMIN_ROLE']) {
            if (!AuthenticationService::isAccessibleAction($controller_id, $acton_id)) {
                MyHelper::response(HttpCode::UNAUTHORIZED, Yii::t('app', 'HTTP Error 401- You are not authorized to access this operaton due to invalid authentication') . " with ID:  " . $controller_id . "/ " . $acton_id);
                return;
            }
        }
        $year = PhiscalYear::findOne($year);
        if (!isset($year)) {
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app', 'Incorrect Phiscal Year'));
            return;
        }
        $models = StatVictoryoverseaProvinceDetail::find()->alias('d')
            ->select([
                'd.*',
                'province' => 'm.province_name',
                'award' => 'a.name'
            ])
            ->join('join', 'stat_victoryoversea_province t', 't.id=d.stat_victoryoversea_province_id and t.phiscal_year_id=:year', [':year' => $year->id])
            ->join('join', 'province m', 'm.id=d.province_id')
            ->join('join', 'award a', 'a.id=d.award_id');
        $user = Yii::$app->user->identity;
        if (isset($user->role->province_id)) {
            $models = $models->andWhere(['d.province_id' => $user->role->province_id]);
        }
        $models = $models->orderBy('province.position')->asArray()->all();
        return $this->renderPartial('../ministry/excel', [
            'file' => 'Victory Oversea Province ' . $year->year . '.xls',
            'content' => $this->renderPartial('table', [
                'models' => $models,
                'year' => $year,
                'cols' => $this->columns,
                'labels' => $this->lables,
                'levels' => $this->levels,
            ])
        ]);
    }


    public function actionGetreferences($year)
    {
        $year = PhiscalYear::findOne($year);
        if (!isset($year)) {
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app', 'Incorrect Phiscal Year'));
            return;
        }

        $files = Attachment::find()->alias('a')
            ->join('join', 'menu m', 'm.id = a.menu_id and m.table_name=:table', [
                ':table' => 'stat_victoryoversea_ministry'
            ])
            ->where(['a.deleted' => 0, 'a.phiscal_year_id' => $year->id])
            ->orderBy('upload_date desc')
            ->asArray()->all();

        return json_encode([
            'files' => $files
        ]);
    }

    public function actionDeletefile($year)
    {
        $year = PhiscalYear::findOne($year);
        if (!isset($year)) {
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app', 'Incorrect Phiscal Year'));
            return;
        }
        if ($year->status != 'O') {
            MyHelper::response(HttpCode::METHOD_NOT_ALLOWED, "The year is not allow to input");
            return;
        }
        $post = Yii::$app->request->post();
        if (isset($post)) {
            $model = Attachment::findOne($post['id']);
            if (!isset($model)) {
                MyHelper::response(HttpCode::NOT_FOUND, "Data not found");
                return;
            }
            $model->deleted = 1;
            echo 'upload/' . $model->dir . '/' . $model->name;
            if (!is_dir('upload/' . $model->dir . '/backup')) mkdir('upload/' . $model->dir . '/backup');

            if (!copy('upload/' . $model->dir . '/' . $model->name, 'upload/' . $model->dir . '/backup/' . $model->name)) {
                MyHelper::response(HttpCode::INTERNAL_SERVER_ERROR, "Cannot move file");
                return;
            }

            if (!unlink('upload/' . $model->dir . '/' . $model->name)) {
                MyHelper::response(HttpCode::INTERNAL_SERVER_ERROR, "Cannot delete file");
                return;
            }

            if (!$model->save()) {
                MyHelper::response(HttpCode::INTERNAL_SERVER_ERROR, json_encode($model->errors));
                return;
            }
        }
    }

    /**
     * Finds the StatVictoryoverseaProvince model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return StatVictoryoverseaProvince the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = StatVictoryoverseaProvince::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }

    public function beforeAction($action)
    {
        $user = Yii::$app->user->identity;
        $this->enableCsrfValidation = true;
        $controller_id = Yii::$app->controller->id;
        $acton_id = Yii::$app->controller->action->id;
        if ($user->role ["name"] != Yii::$app->params ['DEFAULT_ADMIN_ROLE']) {
            if (!AuthenticationService::isAccessibleAction($controller_id, $acton_id)) {
                if (Yii::$app->request->isAjax) {
                    MyHelper::response(HttpCode::UNAUTHORIZED, Yii::t('app', 'HTTP Error 401- You are not authorized to access this operaton due to invalid authentication') . " with ID:  " . $controller_id . "/ " . $acton_id);
                    return;
                } else {
                    return $this->redirect([
                        'authentication/notallowed'
                    ]);
                }
            }
        }

        return parent::beforeAction($action);
    }

}
