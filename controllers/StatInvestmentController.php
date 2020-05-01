<?php

namespace app\controllers;

use app\components\MyHelper;
use app\models\Attachment;
use app\models\Menu;
use app\models\PhiscalYear;
use app\models\Project;
use app\models\StatInvestment;
use app\models\StatInvestmentDetail;
use app\services\AuthenticationService;
use Codeception\Util\HttpCode;
use Yii;
use yii\db\Exception;
use yii\web\Controller;

/**
 * StatInvestmentController implements the CRUD actions for StatInvestment model.
 */
class StatInvestmentController extends Controller
{
    /**
     * Lists all StatInvestment models.
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
                MyHelper::response(
                    HttpCode::UNAUTHORIZED,
                    Yii::t('app', 'HTTP Error 401- You are not authorized to access this operaton due to invalid authentication') . " with ID:  " . $controller_id . "/ " . $acton_id
                );
                return;
            }
        }

        $years = PhiscalYear::find()->orderBy('year')
            ->where(['deleted' => 0])
            ->asArray()->all();

        $projects = Project::find()
            ->where(['deleted' => 0])
            ->orderBy('position')
            ->asArray()->all();
        return json_encode([
            'years' => $years,
            'projects' => $projects,
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

        $models = Project::find()->where(['deleted' => 0])->orderBy('position')->asArray()->all();

        $sql = "SELECT d.*, i.* FROM stat_investment_detail d join stat_investment i ON i.id = d.stat_investment_id and i.phiscal_year_id=1 WHERE (d.deleted=0) AND (d.project_id=:project_id)";
        foreach ($models as $i => $model) {
            $models[$i]['details'] = Yii::$app->db->createCommand($sql)
                ->bindParam(':project_id', $model['id'])
                ->queryAll();
        }
        return json_encode([
            'models' => $models
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
        if (!isset($post['StatInvestmentDetail'])) {
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
            $model = StatInvestment::find()->where(['phiscal_year_id' => $year->id])->one();
            if (!isset($model)) {
                $model = new StatInvestment();
                $model->user_id = Yii::$app->user->id;
                $model->phiscal_year_id = $year->id;
            }
            $model->last_update = date('Y-m-d H:i:s');
            $model->saved = 1;
            if (!$model->save()) throw new Exception(json_encode($model->errors));

            if (!isset($post['StatInvestmentDetail']['id'])) {
                $detail = new StatInvestmentDetail();
                $detail->stat_investment_id = $model->id;
                $detail->project_id = $post['StatInvestmentDetail']['project']['id'];
            } else {
                $detail = StatInvestmentDetail::findOne($post['StatInvestmentDetail']['id']);
                if (!isset($detail)) {
                    MyHelper::response(HttpCode::NOT_FOUND, 'Not Found');
                    return;
                }
            }
            $detail->load($post);

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

        $models = Project::find()->where(['deleted' => 0])->orderBy('position')->asArray()->all();

        $sql = "SELECT d.*, i.* FROM stat_investment_detail d join stat_investment i ON i.id = d.stat_investment_id and i.phiscal_year_id=1 WHERE (d.deleted=0) AND (d.project_id=:project_id)";
        foreach ($models as $i => $model) {
            $models[$i]['details'] = Yii::$app->db->createCommand($sql)
                ->bindParam(':project_id', $model['id'])
                ->queryAll();
        }

        return $this->renderPartial('../ministry/print', [
            'content' => $this->renderPartial('table', ['models' => $models, 'year' => $year])
        ]);
    }

    public function actionDelete($year)
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
        $post = Yii::$app->request->post();
        if (!isset($post['id'])) {
            MyHelper::response(HttpCode::BAD_REQUEST, Yii::t('app', 'Incorrect ID'));
            return;
        }

        StatInvestmentDetail::deleteAll(['id' => $post['id']]);
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

        $models = Project::find()->where(['deleted' => 0])->orderBy('position')->asArray()->all();

        $sql = "SELECT d.*, i.* FROM stat_investment_detail d join stat_investment i ON i.id = d.stat_investment_id and i.phiscal_year_id=1 WHERE (d.deleted=0) AND (d.project_id=:project_id)";
        foreach ($models as $i => $model) {
            $models[$i]['details'] = Yii::$app->db->createCommand($sql)
                ->bindParam(':project_id', $model['id'])
                ->queryAll();
        }

        return $this->renderPartial('../ministry/excel', [
            'file' => 'Statistic of Investment ' . $year->year . '.xls',
            'content' => $this->renderPartial('table', ['models' => $models, 'year' => $year])
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

        $menu = Menu::find()->where(['table_name' => 'stat_investment'])->one();
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
                ':table' => 'stat_investment'
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
