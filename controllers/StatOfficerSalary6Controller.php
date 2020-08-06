<?php

namespace app\controllers;

use app\components\MyHelper;
use app\models\Attachment;
use app\models\Menu;
use app\models\Ministry;
use app\models\PhiscalYear;
use app\models\StatOfficerSalary6;
use app\models\StatOfficerSalary6Detail;
use app\models\StudyLevel;
use app\services\AuthenticationService;
use Codeception\Util\HttpCode;
use Yii;
use yii\db\Exception;
use yii\web\Controller;

/**
 * StatOfficerSalary6Controller implements the CRUD actions for StatOfficerSalary6 model.
 */
class StatOfficerSalary6Controller extends BaseController
{
    public $table = 'stat_officer_salary6';
    /**
     * Lists all StatOfficerSalary6 models.
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

        $years = PhiscalYear::find()->where(['deleted' => 0])->orderBy('year')->asArray()->all();
        $ministries = Ministry::find()->where(['deleted' => 0])->orderBy('position')->asArray()->all();
        $levels = StudyLevel::find()->where(['deleted' => 0])->orderBy('position')->asArray()->all();
        return json_encode([
            "years" => $years,
            "ministries" => $ministries,
            "levels" => $levels
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

        $model = StatOfficerSalary6::find()->where(['phiscal_year_id' => $year->id])->one();
        if (!isset($model)) {
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app', 'No Data'));
            return;
        }

        $models = Ministry::find()->where('deleted=0')->orderBy('position')->asArray()->all();

        foreach ($models as $key => $model) {
            $models[$key]['items'] = StatOfficerSalary6Detail::find()->alias('d')
                ->select('d.*, t.name ministry, s.name level')
                ->join('left join', $this->table . ' m', 'd.' . $this->table . '_id = m.id and m.phiscal_year_id=:year', [
                    ':year' => $year->id
                ])
                ->join('left join', 'ministry t', 't.id = d.ministry_id')
                ->join('left join', 'study_level s', 's.id = d.study_level_id')
                ->where('(d.deleted is null or d.deleted=0) and d.ministry_id=:ministry', [':ministry' => $model['id']])
                ->asArray()->all();
        }

        return json_encode([
            'models' => $models
        ]);
    }

    public function actionInquiry($year, $ministry, $level)
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

        $model = StatOfficerSalary6Detail::find()->alias('d')
            ->join('join', $this->table . ' m', 'm.id = d.' . $this->table . '_id and m.phiscal_year_id=:year', [':year' => $year->id])
            ->where('(d.deleted is null or d.deleted = 0) and d.ministry_id=:ministry and d.study_level_id=:level', [
                ':ministry' => $ministry,
                ':level' => $level,
            ])
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

        $year = PhiscalYear::findOne($year);
        if (!isset($year)) {
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app', 'Incorrect Phiscal Year'));
            return;
        }

        $post = Yii::$app->request->post();
        if (!isset($post)) {
            MyHelper::response(HttpCode::BAD_REQUEST, Yii::t('app', 'Incorrect Request Method'));
            return;
        }

        if ($year->status != "O") {
            MyHelper::response(HttpCode::METHOD_NOT_ALLOWED, Yii::t('app', 'The Year is not allowed to input'));
            return;
        }

        $transaction = Yii::$app->db->beginTransaction();
        try {
            $model = StatOfficerSalary6::find()->where(['phiscal_year_id' => $year->id])->one();
            if (!isset($model)) {
                $model = new StatOfficerSalary6();
                $model->phiscal_year_id = $year->id;
            }
            $model->user_id = Yii::$app->user->id;
            $model->last_update = date('Y-m-d H:i:s');
            if (!isset($model->deleted))
                $model->deleted = 0;

            if (!$model->save()) throw new Exception(json_encode($model->errors));

            $detail = StatOfficerSalary6Detail::find()
                ->where([
                    $this->table . '_id' => $model->id,
                    'ministry_id' => $post['model']['ministry'],
                    'study_level_id' => $post['model']['level']
                ])->one();
            if (!isset($detail)) {
                $detail = new StatOfficerSalary6Detail();
                $detail->ministry_id = $post['model']['ministry'];
                $detail->study_level_id = $post['model']['level'];
                $detail->stat_officer_salary6_id = $model->id;
            }
            $detail->load($post['model']);
            $detail->step1 = $post['model']['step1'];
            $detail->step2 = $post['model']['step2'];
            $detail->step3 = $post['model']['step3'];
            $detail->step4 = $post['model']['step4'];
            $detail->step5 = $post['model']['step5'];
            $detail->step6 = $post['model']['step6'];

            $detail->step1_women = $post['model']['step1_women'];
            $detail->step2_women = $post['model']['step2_women'];
            $detail->step3_women = $post['model']['step3_women'];
            $detail->step4_women = $post['model']['step4_women'];
            $detail->step5_women = $post['model']['step5_women'];
            $detail->step6_women = $post['model']['step6_women'];

            if (!$detail->save()) throw new Exception(json_encode($detail->errors));

            $transaction->commit();
        } catch (Exception $exception) {
            $transaction->rollBack();
            MyHelper::response(HttpCode::INTERNAL_SERVER_ERROR, $exception->getMessage());
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

        $model = StatOfficerSalary6::find()->where(['phiscal_year_id' => $year->id])->one();
        if (!isset($model)) {
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app', 'No Data'));
            return;
        }

        $models = Ministry::find()->where('deleted=0')->orderBy('position')->asArray()->all();

        foreach ($models as $key => $model) {
            $models[$key]['items'] = StatOfficerSalary6Detail::find()->alias('d')
                ->select('d.*, t.name ministry, s.name level')
                ->join('left join', $this->table . ' m', 'd.' . $this->table . '_id = m.id and m.phiscal_year_id=:year', [
                    ':year' => $year->id
                ])
                ->join('left join', 'ministry t', 't.id = d.ministry_id')
                ->join('left join', 'study_level s', 's.id = d.study_level_id')
                ->where('(d.deleted is null or d.deleted=0) and d.ministry_id=:ministry', [':ministry' => $model['id']])
                ->asArray()->all();
        }

        return $this->renderPartial('../ministry/print', [
            'content' => $this->renderPartial('table', ['year' => $year, 'models' => $models])
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

        $model = StatOfficerSalary6::find()->where(['phiscal_year_id' => $year->id])->one();
        if (!isset($model)) {
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app', 'No Data'));
            return;
        }

        $models = Ministry::find()->where('deleted=0')->orderBy('position')->asArray()->all();

        foreach ($models as $key => $model) {
            $models[$key]['items'] = StatOfficerSalary6Detail::find()->alias('d')
                ->select('d.*, t.name ministry, s.name level')
                ->join('left join', $this->table . ' m', 'd.' . $this->table . '_id = m.id and m.phiscal_year_id=:year', [
                    ':year' => $year->id
                ])
                ->join('left join', 'ministry t', 't.id = d.ministry_id')
                ->join('left join', 'study_level s', 's.id = d.study_level_id')
                ->where('(d.deleted is null or d.deleted=0) and d.ministry_id=:ministry', [':ministry' => $model['id']])
                ->asArray()->all();
        }

        return $this->renderPartial('../ministry/excel', [
            'file' => $this->table . $year->year . '.xls',
            'content' => $this->renderPartial('table', ['year' => $year, 'models' => $models])
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

        $menu = Menu::find()->where(['table_name' => 'stat_3create'])->one();
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

    public function actionDelete()
    {
        $post = Yii::$app->request->post();
        if (!isset($post)) {
            MyHelper::response(HttpCode::METHOD_NOT_ALLOWED, Yii::t('app', 'Incorrect Request'));
            return;
        }
        $model = StatOfficerSalary6Detail::find()->where(['id' => $post['id']])->one();
        if (!isset($model)) {
            MyHelper::response(HttpCode::NOT_FOUND, 'NOT_FOUND');
            return;
        }
        StatOfficerSalary6Detail::updateAll(['deleted' => 1], ['id' => $model->id]);
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
                ':table' => 'stat_3create'
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

   
}
