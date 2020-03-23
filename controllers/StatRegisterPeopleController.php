<?php

namespace app\controllers;

use app\components\MyHelper;
use app\models\PhiscalYear;
use Yii;
use app\models\StatRegisterPeople;
use app\models\StatRegisterPeopleDetail;
use app\services\AuthenticationService;
use Codeception\Util\HttpCode;
use Exception;
use yii\helpers\ArrayHelper;
use yii\web\Controller;

/**
 * StatRegisterPeopleController implements the CRUD actions for StatRegisterPeople model.
 */
class StatRegisterPeopleController extends Controller
{
    public $COLUMNS = ['born', 'die', 'married_laolao', 'divorce_laolao', 'movein', 'moveout'];


    public function beforeAction($action)
    {
        $user = Yii::$app->user->identity;
        $this->enableCsrfValidation = true;
        $controller_id = Yii::$app->controller->id;
        $acton_id = Yii::$app->controller->action->id;
        if ($user->role["name"] != Yii::$app->params['DEFAULT_ADMIN_ROLE']) {
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

    public function actionGet()
    {
        $user = Yii::$app->user->identity;
        $controller_id = Yii::$app->controller->id;
        $acton_id = Yii::$app->controller->action->id;
        if ($user->role["name"] != Yii::$app->params['DEFAULT_ADMIN_ROLE']) {
            if (!AuthenticationService::isAccessibleAction($controller_id, $acton_id)) {
                MyHelper::response(HttpCode::UNAUTHORIZED, Yii::t('app', 'HTTP Error 401- You are not authorized to access this operaton due to invalid authentication') . " with ID:  " . $controller_id . "/ " . $acton_id);
                return;
            }
        }

        $years = PhiscalYear::find()->orderBy('year')
            ->where(['deleted' => 0])->asArray()->all();

        return json_encode([
            'years' => $years
        ]);
    }

    public function actionEnquiry($year)
    {
        $user = Yii::$app->user->identity;
        $controller_id = Yii::$app->controller->id;
        $acton_id = Yii::$app->controller->action->id;
        if ($user->role["name"] != Yii::$app->params['DEFAULT_ADMIN_ROLE']) {
            if (!AuthenticationService::isAccessibleAction($controller_id, $acton_id)) {
                MyHelper::response(HttpCode::UNAUTHORIZED, Yii::t('app', 'HTTP Error 401- You are not authorized to access this operaton due to invalid authentication') . " with ID:  " . $controller_id . "/ " . $acton_id);
                return;
            }
        }
        $year = PhiscalYear::findOne($year);
        if (!isset($year)) {
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app', 'Inccorect Phiscal Year'));
            return;
        }
        $model = StatRegisterPeople::find()
            ->where(['phiscal_year_id' => $year->id])
            ->one();
        if (!isset($model)) {
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app', 'No Data'));
            return;
        }
        $detail = $model->getStatRegisterPeopleDetails()
            ->select(['born', 'die', 'married_laolao', 'divorce_laolao', 'movein', 'moveout'])
            ->asArray()->one();
        return json_encode([
            'model' => $detail,
            'stat' => [
                'labels' => [
                    'ເກີດ',
                    'ເສຍຊີວິດ',
                    'ແຕ່ງດອງ ລາວ-ລາວ',
                    'ຢ່າຮ້າງ ລາວ-ລາວ',
                    'ຍ້າຍມາ',
                    'ຍ້າຍອອກ'
                ],
                'series' => [$year->year],
                'data' => [
                    $detail['born'],
                    $detail['die'],
                    $detail['married_laolao'],
                    $detail['divorce_laolao'],
                    $detail['movein'],
                    $detail['moveout']
                ]
            ],
        ]);
    }

    public function actionSave($year)
    {
        $user = Yii::$app->user->identity;
        $controller_id = Yii::$app->controller->id;
        $acton_id = Yii::$app->controller->action->id;
        if ($user->role["name"] != Yii::$app->params['DEFAULT_ADMIN_ROLE']) {
            if (!AuthenticationService::isAccessibleAction($controller_id, $acton_id)) {
                MyHelper::response(HttpCode::UNAUTHORIZED, Yii::t('app', 'HTTP Error 401- You are not authorized to access this operaton due to invalid authentication') . " with ID:  " . $controller_id . "/ " . $acton_id);
                return;
            }
        }
        $post = Yii::$app->request->post();
        if (!isset($post)) {
            MyHelper::response(HttpCode::BAD_REQUEST, Yii::t('app', 'Inccorect Request Mehotd'));
            return;
        }

        $year = PhiscalYear::findOne($year);
        if (!isset($year)) {
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app', 'Inccorect Phiscal Year'));
            return;
        }

        if ($year->status != 'O') {
            MyHelper::response(HttpCode::METHOD_NOT_ALLOWED, Yii::t('app', 'The Year is not allow to input'));
            return;
        }

        $transaction = Yii::$app->db->beginTransaction();
        try {
            $model = StatRegisterPeople::find()
                ->where(['phiscal_year_id' => $year->id])
                ->one();
            if (!isset($model)) {
                $model = new StatRegisterPeople();
                $model->phiscal_year_id = $year->id;
                $model->user_id = Yii::$app->user->id;
                $model->deleted = 0;
            }
            $model->last_update = date('Y-m-d H:i:s');
            if (!$model->save()) throw new Exception(json_encode($model->errors));

            $detail = StatRegisterPeopleDetail::find()
                ->where(['stat_register_people_id' => $model->id])
                ->one();
            if (!isset($detail)) {
                $detail = new StatRegisterPeopleDetail();
                $detail->stat_register_people_id = $model->id;
            }
            foreach ($this->COLUMNS as $col)
                $detail->$col = isset($post['Model'][$col]) ? $post['Model'][$col] : null;

            if (!$detail->save()) throw new Exception(json_encode($detail->errors));
            $transaction->commit();
        } catch (Exception $exception) {
            $transaction->rollBack();
            MyHelper::response(HttpCode::INTERNAL_SERVER_ERROR, $exception->getMessage());
            return;
        }
    }
}
