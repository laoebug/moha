<?php

namespace app\controllers;

use app\components\MyHelper;
use app\models\Attachment;
use app\models\Menu;
use app\models\Ministry;
use app\models\PhiscalYear;
use app\models\StatOfficerMinistryTrain;
use app\models\StatOfficerMinistryTrainDetail;
use app\services\AuthenticationService;
use Codeception\Util\HttpCode;
use Yii;
use yii\db\Exception;
use yii\web\Controller;

/**
 * StatOfficerMinistryTrainController implements the CRUD actions for StatOfficerMinistryTrain model.
 */
class StatOfficerMinistryTrainController extends Controller
{
    public $columns = [
        'tech_in_total', 'tech_in_women', 'tech_out_total', 'tech_out_women',
        'theo_in_total', 'theo_in_women', 'theo_out_total', 'theo_out_women',
    ];

    /**
     * Lists all StatOfficerMinistry models.
     * @return mixed
     */
    public function actionIndex()
    {
        return $this->render('index');
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

        $years = PhiscalYear::find()->orderBy('year')->where(['deleted' => 0])->asArray()->all();
        $ministries = Ministry::find()
            ->where(['deleted' => 0])
            ->andWhere('ministry_group_id in (1,2,3)')
            ->orderBy('position')->asArray()->all();

        return json_encode([
            'years' => $years,
            'ministries' => $ministries,
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

        $model = StatOfficerMinistryTrain::find()->where(['phiscal_year_id' => $year->id])->one();
        if (!isset($model)) {
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app', 'No Data'));
            return;
        }

        $models = Ministry::find()->alias('m')
            ->select('m.*, d.*')
            ->join('left join', 'stat_officer_ministry_train_detail d', 'd.ministry_id=m.id and d.stat_officer_ministry_train_id=:id', [':id' => $model->id])
            ->where(['deleted' => 0, 'ministry_group_id' => 1])->orderBy('m.position')->asArray()->all();

        $stat = StatOfficerMinistryTrainDetail::find()
            ->select([
                'stat_officer_ministry_train_id' => 'stat_officer_ministry_train_id',
                'tech_in_total' => 'sum(d.tech_in_total)',
                'tech_out_total' => 'sum(d.tech_out_total)',
                'theo_in_total' => 'sum(d.theo_in_total)',
                'theo_out_total' => 'sum(d.theo_out_total)',
            ])->alias('d')
            ->join('left join', 'ministry m', 'm.id = d.ministry_id and m.deleted=0')
            ->where(['d.stat_officer_ministry_train_id' => $model->id])
            ->asArray()->one();
        $data = null;
        if (isset($stat))
            if (isset($stat['stat_officer_ministry_train_id'])) {
                $percent = 100 / ($stat['tech_in_total'] + $stat['tech_out_total'] + $stat['theo_in_total'] + $stat['theo_out_total']);
                $data = [
                    number_format($stat['tech_in_total'] * $percent, 2),
                    number_format($stat['tech_out_total'] * $percent, 2),
                    number_format($stat['theo_in_total'] * $percent, 2),
                    number_format($stat['theo_out_total'] * $percent, 2),
                ];
            }

        return json_encode([
            'models' => $models,
            'stat' => [
                'labels' => [
                    'ວິຊາສະເພາະ ພາຍໃນ', 'ວິຊາສະເພາະ ຕາງປະເທດ', 'ທິດສະດີ ພາຍໃນ', 'ທິດສະດີ ຕາງປະເທດ'
                ],
                'data' => $data
            ],
        ]);
    }

    public function actionInquiry($year, $ministry)
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

        $model = StatOfficerMinistryTrainDetail::find()->alias('d')
            ->join('join', 'stat_officer_ministry_train o', 'o.id = d.stat_officer_ministry_train_id and o.phiscal_year_id=:year', [':year' => $year->id])
            ->join('left join', 'ministry m', 'm.id = d.ministry_id and m.deleted=0')
            ->where(['d.ministry_id' => $ministry])
            ->asArray()->one();

        return json_encode([
            'model' => $model
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
        if (!isset($post['Model'])) {
            MyHelper::response(HttpCode::BAD_REQUEST, Yii::t('app', 'Incorrect Request Method'));
            return;
        }
        $year = PhiscalYear::findOne($year);
        if (!isset($year)) {
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app', 'Incorrect Phiscal Year'));
            return;
        }
        if ($year->status != 'O') {
            MyHelper::response(HttpCode::METHOD_NOT_ALLOWED, Yii::t('app', 'The Year is not allowed to input'));
            return;
        }

        $transaction = Yii::$app->db->beginTransaction();
        try {
            $model = StatOfficerMinistryTrain::find()->where(['phiscal_year_id' => $year->id])->one();
            if (!isset($model)) {
                $model = new StatOfficerMinistryTrain();
                $model->user_id = Yii::$app->user->id;
                $model->phiscal_year_id = $year->id;
            }
            $model->last_update = date('Y-m-d H:i:s');
            $model->saved = 1;
            if (!$model->save()) throw new Exception(json_encode($model->errors));

            $detail = StatOfficerMinistryTrainDetail::find()->alias('d')
                ->join('join', 'stat_officer_ministry_train o', 'o.id = d.stat_officer_ministry_train_id and o.phiscal_year_id=:year', [':year' => $year->id])
                ->where(['ministry_id' => $post['Model']['ministry']['id']])
                ->one();

            if (!isset($detail)) {
                $detail = new StatOfficerMinistryTrainDetail();
                $detail->stat_officer_ministry_train_id = $model->id;
                $detail->ministry_id = $post['Model']['ministry']['id'];
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

        $model = StatOfficerMinistryTrain::find()->where(['phiscal_year_id' => $year->id])->one();
        if (!isset($model)) {
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app', 'No Data'));
            return;
        }

        $models = Ministry::find()->alias('m')
            ->select('m.*, d.*')
            ->join('left join', 'stat_officer_ministry_train_detail d', 'd.ministry_id=m.id and d.stat_officer_ministry_train_id=:id', [':id' => $model->id])
            ->where(['deleted' => 0])->orderBy('m.position')->asArray()->all();

        return $this->renderPartial('../ministry/print', [
            'content' => $this->renderPartial('table', [
                'models' => $models, 'year' => $year, 'cols' => $this->columns
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

        $model = StatOfficerMinistryTrain::find()->where(['phiscal_year_id' => $year->id])->one();
        if (!isset($model)) {
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app', 'No Data'));
            return;
        }

        $models = Ministry::find()->alias('m')
            ->select('m.*, d.*')
            ->join('left join', 'stat_officer_ministry_train_detail d', 'd.ministry_id=m.id and d.stat_officer_ministry_train_id=:id', [':id' => $model->id])
            ->where(['deleted' => 0])->orderBy('m.position')->asArray()->all();

        return $this->renderPartial('../ministry/excel', [
            'file' => 'Stat Officers Ministry Train ' . $year->year . '.xls',
            'content' => $this->renderPartial('table', ['models' => $models, 'year' => $year, 'cols' => $this->columns])
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

        $menu = Menu::find()->where(['table_name' => 'stat_officer_ministry_train'])->one();
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
                ':table' => 'stat_officer_ministry_train'
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
