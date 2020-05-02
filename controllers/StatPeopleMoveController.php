<?php

namespace app\controllers;

use app\components\MyHelper;
use app\models\Attachment;
use app\models\Menu;
use app\models\PhiscalYear;
use app\models\Province;
use app\models\StatPeopleMove;
use app\models\StatPeopleMoveDetail;
use app\services\AuthenticationService;
use Codeception\Util\HttpCode;
use Yii;
use yii\web\Controller;
use yii\base\Exception;
use yii\helpers\ArrayHelper;

/**
 * StatPeopleMoveController implements the CRUD actions for StatPeopleMove model.
 */
class StatPeopleMoveController extends Controller
{
    public $COLUMNS = [
        'total_district',
        'total_village',
        'total_family',
        'movein_total',
        'movein_women',
        'born_total',
        'born_women',
        'wedding_laolao',
        'wedding_laofor',
        'divorce_laolao',
        'divorce_laofor',
        'sign_total',
        'sign_women',
        'resign_total',
        'resign_women',
        'changename_total',
        'changename_women',
        'changesurname_total',
        'changesurname_women',
        'movein_village_total',
        'movein_village_women',
        'movein_district_total',
        'movein_district_women',
        'movein_province_total',
        'movein_province_women',
        'moveout_village_total',
        'moveout_village_women',
        'moveout_district_total',
        'moveout_district_women',
        'moveout_province_total',
        'moveout_province_women',
        'die_total',
        'die_women',
        'real_total',
        'real_women',
    ];

    /**
     * Lists all StatPeopleMove models.
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
            'years' => $years,
            'provinces' => Province::find()->where('deleted=0')->orderBy('position')->asArray()->all()
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
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app', 'Incorrect Phiscal Year'));
            return;
        }

        $models = $this->getModels($year);
        $years = PhiscalYear::find()->select('id, year, status')->orderBy('year')->asArray()->all();
        return json_encode([
            'models' => $models,
            'stats' => [
                'wedding' => [
                    'labels' => ArrayHelper::getColumn($years, 'year'),
                    'series' => ['ແຕ່ງດອງ ລາວ-ລາວ', 'ແຕ່ງດອງລາວ-ຕ່າງປະເທດ'],
                    'data' => [
                        isset($models) ? ArrayHelper::getColumn($models, 'wedding_laolao') : [],
                        isset($models) ? ArrayHelper::getColumn($models, 'wedding_laofor') : [],
                    ]
                ],
                'divorce' => [
                    'labels' => ArrayHelper::getColumn($years, 'year'),
                    'series' => ['ຢ່າຮ້າງ ລາວ-ລາວ', 'ຢ່າຮ້າງລາວ-ຕ່າງປະເທດ'],
                    'data' => [
                        isset($models) ? ArrayHelper::getColumn($models, 'divorce_laolao') : [],
                        isset($models) ? ArrayHelper::getColumn($models, 'divorce_laofor') : [],
                    ]
                ],
                'movein' => [
                    'labels' => ArrayHelper::getColumn($years, 'year'),
                    'series' => ['ຈຳນວນ ພົນລະເມືອງ ຍົກມາ (ລວມ)', 'ຈຳນວນ ພົນລະເມືອງ ຍົກມາ (ຍິງ)'],
                    'data' => [
                        isset($models) ? ArrayHelper::getColumn($models, 'movein_total') : [],
                        isset($models) ? ArrayHelper::getColumn($models, 'movein_women') : [],
                    ]
                ],
                'born' => [
                    'labels' => ArrayHelper::getColumn($years, 'year'),
                    'series' => ['ຈຳນວນເກີດ (ລວມ)', 'ຈຳນວນເກີດ (ຍິງ)'],
                    'data' => [
                        isset($models) ? ArrayHelper::getColumn($models, 'born_total') : [],
                        isset($models) ? ArrayHelper::getColumn($models, 'born_women') : [],
                    ]
                ],
                'sign' => [
                    'labels' => ArrayHelper::getColumn($years, 'year'),
                    'series' => ['ການໄດ້ສັນຊາດລາວ (ລວມ)', 'ການໄດ້ສັນຊາດລາວ (ຍິງ)'],
                    'data' => [
                        isset($models) ? ArrayHelper::getColumn($models, 'sign_total') : [],
                        isset($models) ? ArrayHelper::getColumn($models, 'sign_women') : [],
                    ]
                ],
                'resign' => [
                    'labels' => ArrayHelper::getColumn($years, 'year'),
                    'series' => ['ການປະສັນຊາດລາວ (ລວມ)', 'ການປະສັນຊາດລາວ (ຍິງ)'],
                    'data' => [
                        isset($models) ? ArrayHelper::getColumn($models, 'resign_total') : [],
                        isset($models) ? ArrayHelper::getColumn($models, 'resign_women') : [],
                    ]
                ],
                'changename' => [
                    'labels' => ArrayHelper::getColumn($years, 'year'),
                    'series' => ['ການປ່ຽນຊື່ (ລວມ)', 'ການປ່ຽນຊື່ (ຍິງ)'],
                    'data' => [
                        isset($models) ? ArrayHelper::getColumn($models, 'changename_total') : [],
                        isset($models) ? ArrayHelper::getColumn($models, 'changename_women') : []
                    ]
                ],
                'changesurname' => [
                    'labels' => ArrayHelper::getColumn($years, 'year'),
                    'series' => ['ການປ່ຽນ ນາມສະກຸນ (ລວມ)', 'ການປ່ຽນ ນາມສະກຸນ (ຍິງ)'],
                    'data' => [
                        isset($models) ? ArrayHelper::getColumn($models, 'changesurname_total') : [],
                        isset($models) ? ArrayHelper::getColumn($models, 'changesurname_women') : [],
                    ]
                ],
                'movein' => [
                    'labels' => ArrayHelper::getColumn($years, 'year'),
                    'series' => ['ການຍົກຍ້າຍມາ ບ້ານ-ບ້ານ', 'ການຍົກຍ້າຍມາ ເມືອງ-ເມືອງ', 'ການຍົກຍ້າຍມາ ແຂວງ-ແຂວງ'],
                    'data' => [
                        isset($models) ? ArrayHelper::getColumn($models, 'movein_village_total') : [],
                        isset($models) ? ArrayHelper::getColumn($models, 'movein_district_total') : [],
                        isset($models) ? ArrayHelper::getColumn($models, 'movein_province_total') : [],
                    ]
                ],
                'moveout' => [
                    'labels' => ArrayHelper::getColumn($years, 'year'),
                    'series' => ['ການຍົກຍ້າຍໄປ ບ້ານ-ບ້ານ', 'ການຍົກຍ້າຍໄປ ເມືອງ-ເມືອງ', 'ການຍົກຍ້າຍໄປ ແຂວງ-ແຂວງ'],
                    'data' => [
                        isset($models) ? ArrayHelper::getColumn($models, 'moveout_village') : [],
                        isset($models) ? ArrayHelper::getColumn($models, 'moveout_district') : [],
                        isset($models) ? ArrayHelper::getColumn($models, 'moveout_province') : [],
                    ]
                ],
                'die' => [
                    'labels' => ArrayHelper::getColumn($years, 'year'),
                    'series' => ['ຈຳນວນ ເສຍຊີວິດ (ລວມ)', 'ຈຳນວນ ເສຍຊີວິດ (ຍິງ)'],
                    'data' => [
                        isset($models) ? ArrayHelper::getColumn($models, 'die_total') : [],
                        isset($models) ? ArrayHelper::getColumn($models, 'die_women') : [],
                    ]
                ],
                'real' => [
                    'labels' => ArrayHelper::getColumn($years, 'year'),
                    'series' => ['ຈຳນວນ ພົນລະເມືອງ ຕົວຈິງ (ລວມ)', 'ຈຳນວນ ພົນລະເມືອງ ຕົວຈິງ (ຍິງ)'],
                    'data' => [
                        isset($models) ? ArrayHelper::getColumn($models, 'real_total') : [],
                        isset($models) ? ArrayHelper::getColumn($models, 'real_women') : []
                    ]
                ],
            ]
        ]);
    }

    private function getModels($year)
    {
        $model = StatPeopleMove::find()
            ->where(['phiscal_year_id' => $year])->one();
        if (!isset($model)) {
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app', 'No Data'));
            return;
        }
        $models = Province::find()
            ->alias('province')
            ->select('province.*, d.*')
            ->join('left join', 'stat_people_move_detail d', 'd.province_id = province.id and d.stat_people_move_id=:id', [':id' => $model->id]);
        $user = Yii::$app->user->identity;
        if (isset($user->role->province_id)) {
            $models = $models->andWhere(['province.id' => $user->role->province_id]);
        }
        return $models->orderBy('province.position')->asArray()->all();
    }

    public function actionInquiry($year, $province)
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
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app', 'Incorrect Phiscal Year'));
            return;
        }

        $model = StatPeopleMoveDetail::find()
            ->alias('d')
            ->join('join', 'stat_people_move l', 'l.id = d.stat_people_move_id and l.phiscal_year_id=:year', [':year' => $year->id])
            ->where(['d.province_id' => $province]);
        $user = Yii::$app->user->identity;
        if (isset($user->role->province_id)) {
            $model = $model->andWhere(['d.province_id' => $user->role->province_id]);
        }
        $model = $model
            ->asArray()->one();

        return json_encode([
            'model' => $model,
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
            MyHelper::response(HttpCode::BAD_REQUEST, Yii::t('app', 'Incorrect Request Mehotd'));
            return;
        }

        $year = PhiscalYear::findOne($year);
        if (!isset($year)) {
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app', 'Incorrect Phiscal Year'));
            return;
        }

        if ($year->status != 'O') {
            MyHelper::response(HttpCode::METHOD_NOT_ALLOWED, Yii::t('app', 'The Year is not allow to input'));
            return;
        }

        $transaction = Yii::$app->db->beginTransaction();
        try {
            $model = StatPeopleMove::find()
                ->where(['phiscal_year_id' => $year->id])
                ->one();
            if (!isset($model)) {
                $model = new StatPeopleMove();
                $model->phiscal_year_id = $year->id;
                $model->user_id = Yii::$app->user->id;
            }
            $model->deleted = 0;
            $model->last_update = date('Y-m-d H:i:s');

            if (!$model->save()) {
                throw new Exception($model->errors);
            }
            $detail = StatPeopleMoveDetail::find()
                ->where(['stat_people_move_id' => $model->id, 'province_id' => $post['Model']['province']['id']])
                ->one();
            if (!isset($detail)) {
                $detail = new StatPeopleMoveDetail();
                $detail->province_id = $post['Model']['province']['id'];
                $detail->stat_people_move_id = $model->id;
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

    public function actionPrint($year)
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
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app', 'Incorrect Phiscal Year'));
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

    public function actionDownload($year)
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
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app', 'Incorrect Phiscal Year'));
            return;
        }

        return $this->renderPartial('../ministry/excel', [
            'file' => 'PeopleMove' . $year->year . '.xls',
            'content' => $this->renderPartial('table', [
                'year' => $year,
                'cols' => $this->COLUMNS,
                'models' => $this->getModels($year)
            ])
        ]);
    }

    public function actionUpload($year)
    {
        $year = PhiscalYear::findOne($year);
        if (!isset($year)) {
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app', 'Incorrect Phiscal Year'));
            return;
        }

        $post = Yii::$app->request->post();
        if (!isset($post)) {
            MyHelper::response(HttpCode::METHOD_NOT_ALLOWED, Yii::t('app', 'Incorrect Request'));
            return;
        }

        if (!isset($_FILES['file_upload'])) {
            MyHelper::response(HttpCode::METHOD_NOT_ALLOWED, Yii::t('app', 'Incorrect Request'));
            return;
        }

        $menu = Menu::find()->where(['table_name' => 'stat_people_move'])->one();
        if (!isset($menu)) {
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app', 'Data Not Found'));
            return;
        }

        $dir = 'upload/';
        if (!is_dir($dir)) mkdir($dir);
        $dir .= date('Y');
        if (!is_dir($dir)) mkdir($dir);

        $tmp_name = $_FILES['file_upload']['tmp_name'];
        $name = $_FILES['file_upload']['name'];
        $names = explode(".", $name);
        $ext = end($names);
        $filename = $menu->table_name . "_" . date('Y_m_d_His') . '.' . $ext;

        if (!move_uploaded_file($tmp_name, $dir . "/" . $filename)) {
            MyHelper::response(HttpCode::INTERNAL_SERVER_ERROR, "ພົບບັນຫາໃນການອັບໂຫຼດຟາຍ");
            return;
        }

        $model = new Attachment();
        $model->phiscal_year_id = $year->id;
        $model->menu_id = $menu->id;
        $model->user_id = Yii::$app->user->id;
        $model->deleted = 0;
        $model->name = $filename;
        $model->issued_no = $post['issued_no'];
        $model->issued_date = MyHelper::convertdatefordb($post['issued_date']);
        $model->issued_by = $post['issued_by'];
        $model->upload_date = date('Y-m-d H:i:s');
        $model->original_name = $name;
        $model->dir = date('Y');
        if (!$model->save()) {
            unlink($dir . "/" . $filename);
            MyHelper::response(HttpCode::INTERNAL_SERVER_ERROR, json_encode($model->errors));
            return;
        }
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
                ':table' => 'stat_people_move'
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
}
