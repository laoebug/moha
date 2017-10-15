<?php

namespace app\controllers;

use app\components\MyHelper;
use app\models\Attachment;
use app\models\Menu;
use app\models\PhiscalYear;
use app\models\Province;
use app\models\StatPopulationMovement;
use app\models\StatPopulationMovementDetail;
use Codeception\Util\HttpCode;
use Yii;
use yii\db\Exception;
use yii\web\Controller;

/**
 * StatPopulationMovementController implements the CRUD actions for StatPopulationMovement model.
 */
class StatPopulationMovementController extends Controller
{
    public $COLUMNS = [
        'district'
        , 'village'
        , 'population_total'
        , 'population_women'
        , 'born_total'
        , 'born_women'
        , 'die_total'
        , 'die_women'
        , 'married'
        , 'divorce'
        , 'movein_total'
        , 'movein_women'
        , 'moveout_total'
        , 'moveout_women'
        , 'real_total'
        , 'real_women'
    ];

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
        $years = PhiscalYear::find()
            ->where(['deleted' => 0])->asArray()->all();

        $provinces = Province::find()
            ->where(['deleted' => 0])
            ->orderBy('province_code')
            ->asArray()->all();

        return json_encode([
            'years' => $years,
            'provinces' => $provinces
        ]);
    }

    public function actionEnquiry($year)
    {
        $year = PhiscalYear::findOne($year);
        if (!isset($year)) {
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app', 'Incorrect Phiscal Year'));
            return;
        }

        return json_encode([
            'models' => $this->getModels($year)
        ]);
    }

    private function getModels($year)
    {
        $model = StatPopulationMovement::find()
            ->where(['phiscal_year_id' => $year])->one();
        if (!isset($model)) {
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app', 'No Data'));
            return;
        }

        return Province::find()
            ->alias('p')
            ->select('p.*, d.*')
            ->join('left join', 'stat_population_movement_detail d', 'd.province_id = p.id and d.stat_population_movement_id=:id', [':id' => $model->id])
            ->where(['p.deleted' => 0])->orderBy('p.province_code')->asArray()->all();
    }

    public function actionInquiry($year, $province)
    {
        $year = PhiscalYear::findOne($year);
        if (!isset($year)) {
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app', 'Incorrect Phiscal Year'));
            return;
        }

        $model = StatPopulationMovementDetail::find()
            ->alias('d')
            ->join('join', 'stat_population_movement l', 'l.id = d.stat_population_movement_id and l.phiscal_year_id=:year', [':year' => $year->id])
            ->where(['d.province_id' => $province])
            ->asArray()->one();

        return json_encode([
            'model' => $model
        ]);
    }

    public function actionSave($year)
    {
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
            $model = StatPopulationMovement::find()
                ->where(['phiscal_year_id' => $year->id])
                ->one();
            if (!isset($model)) {
                $model = new StatPopulationMovement();
                $model->phiscal_year_id = $year->id;
                $model->user_id = Yii::$app->user->id;
            }
            $model->saved = 1;
            $model->last_update = date('Y-m-d H:i:s');
            if (!$model->save()) throw new Exception(json_encode($model->errors));

            $detail = StatPopulationMovementDetail::find()
                ->where(['stat_population_movement_id' => $model->id, 'province_id' => $post['StatPopulationMovementDetail']['province']['id']])
                ->one();
            if (!isset($detail)) {
                $detail = new StatPopulationMovementDetail();
                $detail->province_id = $post['StatPopulationMovementDetail']['province']['id'];
                $detail->stat_population_movement_id = $model->id;
            }
            foreach ($this->COLUMNS as $col)
                $detail->$col = isset($post['StatPopulationMovementDetail'][$col]) ? $post['StatPopulationMovementDetail'][$col] : null;

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
        $year = PhiscalYear::findOne($year);
        if (!isset($year)) {
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app', 'Incorrect Phiscal Year'));
            return;
        }

        return $this->renderPartial('../ministry/excel', [
            'file' => 'Stat Local Administration ' . $year->year . '.xls',
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

        $menu = Menu::find()->where(['table_name' => 'stat_population_movement'])->one();
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
                ':table' => 'stat_population_movement'
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
