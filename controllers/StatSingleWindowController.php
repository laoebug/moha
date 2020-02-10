<?php

namespace app\controllers;

use app\components\MyHelper;
use app\models\Attachment;
use app\models\Menu;
use app\models\Ministry;
use app\models\PhiscalYear;
use app\models\Province;
use app\models\StatSingleWindow;
use app\models\StatSingleWindowDetail;
use app\services\AuthenticationService;
use Codeception\Util\HttpCode;
use Exception;
use Yii;
use yii\db\ActiveQuery;
use yii\web\Controller;
use yii\web\ServerErrorHttpException;

/**
 * StatSingleWindowController implements the CRUD actions for StatSingleWindow model.
 */
class StatSingleWindowController extends Controller
{
    public $table = 'stat_single_window';

    /**
     * Lists all StatSingleGatewayImplementation models.
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
        if ($user->role ["name"] != Yii::$app->params ['DEFAULT_ADMIN_ROLE']) {
            if (!AuthenticationService::isAccessibleAction($controller_id, $acton_id)) {
                MyHelper::response(HttpCode::UNAUTHORIZED, Yii::t('app', 'HTTP Error 401- You are not authorized to access this operaton due to invalid authentication') . " with ID:  " . $controller_id . "/ " . $acton_id);
                return;
            }
        }

        return json_encode([
            'years' => PhiscalYear::find()->orderBy('year')->where(['deleted' => 0])->asArray()->all(),
            'ministries' => Ministry::find()->where(['deleted' => 0])->orderBy('position')->asArray()->all(),
            'provinces' => Province::find()->where(['deleted' => 0])->orderBy('position')->asArray()->all(),
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
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app', 'Inccorect Phiscal Year'));
            return;
        }

        $model = StatSingleWindow::find()->where(['phiscal_year_id' => $year])->one();
        if (!isset($model)) {
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app', 'No Data'));
            return;
        }

        $models = Ministry::find()->alias('m')
            ->select('m.*,`d`.`name` as `servicename`, `d`.`remark`')
            ->addSelect([
                'start_date' => 'DATE_FORMAT(`start_date`, "%d-%m-%Y")',
            ])
            ->join('left join', $this->table . '_detail d', 'd.ministry_id = m.id and d.' . $this->table . '_id=:id', [':id' => $model->id])
            ->where('deleted=0 and ministry_group_id in (1,2)')
            ->orderBy('m.position')->asArray()->all();

        return json_encode([
            'models' => $models,
        ]);
    }

    public function actionInquiry($year, $pid = 0, $mid = 0)
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
        if (!isset($year)) throw HttpException(Yii::t('app', 'Inccorect Phiscal Year'));

        $model = StatSingleWindowDetail::find()
            ->alias('d')
            ->join('join', $this->table . ' i', 'd.' . $this->table . '_id=i.id and i.phiscal_year_id=:year', [
                ':year' => $year->id
            ])
            ->where(['d.ministry_id' => $mid, 'd.province_id' => $pid])
            ->join('left join', 'ministry m', 'm.id = d.ministry_id and m.deleted=0')
            ->join('left join', 'province p', 'p.id = d.province_id and p.deleted=0')
            ->asArray()->one();

        if (isset($model))
            if (isset($model['start_date']))
                $model['start_date'] = MyHelper::convertdatefordisplay($model['start_date']);

        return json_encode([
            'model' => $model
        ]);
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

        $post = Yii::$app->request->post();
        if (isset($post)) {
            $year = PhiscalYear::findOne($year);
            if (!isset($year)) {
                MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app', 'Inccorect Phiscal Year'));
                return;
            }
            if ($year->status != 'O') {
                MyHelper::response(HttpCode::METHOD_NOT_ALLOWED, Yii::t('app', 'The Year is not allowed to input'));
                return;
            }

            $transaction = Yii::$app->db->beginTransaction();
            try {
                $model = StatSingleWindow::find()
                    ->where(['phiscal_year_id' => $year->id])->one();
                if (!isset($model)) {
                    $model = new StatSingleWindow();
                    $model->user_id = Yii::$app->user->id;
                    $model->phiscal_year_id = $year->id;
                }
                $model->last_update = date('Y-m-d H:i:s');
                $model->saved = 1;
                if (!$model->save())
                    throw new ServerErrorHttpException(json_encode($model->errors));

                $detail = StatSingleWindowDetail::find()
                    ->where(['ministry_id' => $post['Model']['ministry']['id'], 'stat_single_gateway_implementation_id' => $model->id])
                    ->one();
                if (!isset($detail)) {
                    $detail = new StatSingleWindowDetail();
                    $detail->stat_single_gateway_implementation_id = $model->id;
                    $detail->ministry_id = $post['Model']['ministry']['id'];
                }
                $detail->remark = $post['Model']['remark'];
                if (isset($post['Model']['start_date']) && $post['Model']['start_date'] != '')
                    $detail->start_date = date('Y-m-d', strtotime($post['Model']['start_date']));
                else $detail->start_date = null;
                $detail->name = $post['Model']['name'];
                if (!$detail->save())
                    throw new ServerErrorHttpException(json_encode($detail->errors));

                $transaction->commit();
            } catch (Exception $exception) {
                $transaction->rollBack();
                MyHelper::response(HttpCode::INTERNAL_SERVER_ERROR, $exception->getMessage());
                return;
            }
        }
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
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app', 'Inccorect Phiscal Year'));
            return;
        }

        $model = StatSingleWindowDetail::find()
            ->with([
                'statSingleGatewayImplementationDetails' => function (ActiveQuery $query) {
                    $query->alias('d')
                        ->join('right join', 'ministry m', 'm.id=d.ministry_id')
                        ->orderBy('m.position');
                }
            ])->where(['phiscal_year_id' => $year->id])->one();
        return $this->renderPartial('print', ['content' => $this->renderPartial('table', ['model' => $model])]);
    }

    public function actionDelete()
    {
        if (!isset($_POST['id'])) {
            MyHelper::response(HttpCode::NOT_FOUND, 'ບໍ່ພົບຂໍ້ມູນ');
            return;
        }
        StatSingleWindowDetail::deleteAll(['id' => $_POST['id']]);
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
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app', 'Inccorect Phiscal Year'));
            return;
        }

        $model = StatSingleWindowDetail::find()
            ->with([
                'statSingleGatewayImplementationDetails' => function (ActiveQuery $query) {
                    $query->alias('d')
                        ->join('right join', 'ministry m', 'm.id=d.ministry_id')
                        ->orderBy('m.position');
                }
            ])->where(['phiscal_year_id' => $year->id])->one();
        return $this->renderPartial('excel', [
            'file' => 'Single Gateway Implementation ' . $year->year . '.xls',
            'content' => $this->renderPartial('table', ['model' => $model])
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

        $menu = Menu::find()->where(['table_name' => 'stat_single_gateway_implementation'])->one();
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
                ':table' => 'stat_single_gateway_implementation'
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