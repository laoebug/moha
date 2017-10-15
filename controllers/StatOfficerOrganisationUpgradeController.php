<?php

namespace app\controllers;

use app\components\MyHelper;
use app\models\Attachment;
use app\models\Menu;
use app\models\Organisation;
use app\models\PhiscalYear;
use app\models\StatOfficerOrganisationUpgrade;
use app\models\StatOfficerOrganisationUpgradeDetail;
use Codeception\Util\HttpCode;
use Yii;
use yii\db\Exception;
use yii\web\Controller;

/**
 * StatOfficerOrganisationUpgradeController implements the CRUD actions for StatOfficerOrganisationUpgrade model.
 */
class StatOfficerOrganisationUpgradeController extends Controller
{
    public $columns = [
        'doctor_in_total', 'doctor_in_women', 'doctor_out_total', 'doctor_out_women',
        'master_in_total', 'master_in_women', 'master_out_total', 'master_out_women',
        'bachelor_in_total', 'bachelor_in_women', 'bachelor_out_total', 'bachelor_out_women',

        'high_in_total', 'high_in_women', 'high_out_total', 'high_out_women',
        'middle_in_total', 'middle_in_women', 'middle_out_total', 'middle_out_women',
        'begin_in_total', 'begin_in_women', 'begin_out_total', 'begin_out_women',
    ];

    /**
     * Lists all StatOfficerOrganisation models.
     * @return mixed
     */
    public function actionIndex()
    {
        return $this->render('index', ['cols' => $this->columns]);
    }

    public function actionGet()
    {
        $years = PhiscalYear::find()->where(['deleted' => 0])->asArray()->all();
        $organisations = Organisation::find()->where(['deleted' => 0])->orderBy('position')->asArray()->all();

        return json_encode([
            'years' => $years,
            'organisations' => $organisations,
        ]);
    }

    public function actionEnquiry($year)
    {
        $year = PhiscalYear::findOne($year);
        if (!isset($year)) {
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app', 'Incorrect Phiscal Year'));
            return;
        }

        $model = StatOfficerOrganisationUpgrade::find()->where(['phiscal_year_id' => $year->id])->one();
        if (!isset($model)) {
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app', 'No Data'));
            return;
        }

        $models = Organisation::find()->alias('m')
            ->select('m.*, d.*')
            ->join('left join', 'stat_officer_organisation_upgrade_detail d', 'd.organisation_id=m.id and d.stat_officer_organisation_upgrade_id=:id', [':id' => $model->id])
            ->where(['deleted' => 0])->orderBy('m.position')->asArray()->all();

        $query = StatOfficerOrganisationUpgradeDetail::find()
            ->select(['stat_officer_organisation_upgrade_id' => 'stat_officer_organisation_upgrade_id']);
        foreach ($this->columns as $column)
            $query->addSelect([$column => "ifnull(sum($column), 0)"]);

        $stat = $query->where(['stat_officer_organisation_upgrade_id' => $model->id])->asArray()->one();
        $data = null;
        if (isset($stat))
            if (isset($stat['stat_officer_organisation_upgrade_id'])) {
                $sum = 0;
                foreach ($this->columns as $column)
                    $sum += $stat[$column];
                $percent = 100 / $sum;

                foreach ($this->columns as $column)
                    if (strpos($column, 'total'))
                        $data[] = number_format($stat[$column] * $percent, 2);
            }

        return json_encode([
            'models' => $models,
            'stat' => [
                'series' => [Yii::t('app', 'Organisation Officer Upgrading')],
                'labels' => [
                    Yii::t('app', 'Doctor Local')
                    , Yii::t('app', 'Doctor Oversea')
                    , Yii::t('app', 'Master Local')
                    , Yii::t('app', 'Master Oversea')
                    , Yii::t('app', 'Bachelor Local')
                    , Yii::t('app', 'Bachelor Oversea')

                    , Yii::t('app', 'High Local')
                    , Yii::t('app', 'High Oversea')
                    , Yii::t('app', 'Middle Local')
                    , Yii::t('app', 'Middle Oversea')
                    , Yii::t('app', 'Begin Local')
                    , Yii::t('app', 'Begin Oversea')
                ],
                'data' => $data
            ],
        ]);
    }

    public function actionInquiry($year, $organisation)
    {
        $year = PhiscalYear::findOne($year);
        if (!isset($year)) {
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app', 'Incorrect Phiscal Year'));
            return;
        }

        $model = StatOfficerOrganisationUpgradeDetail::find()->alias('d')
            ->join('join', 'stat_officer_organisation_upgrade o', 'o.id = d.stat_officer_organisation_upgrade_id and o.phiscal_year_id=:year', [':year' => $year->id])
            ->where(['d.organisation_id' => $organisation])
            ->asArray()->one();

        return json_encode([
            'model' => $model
        ]);
    }

    public function actionSave($year)
    {
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
            $model = StatOfficerOrganisationUpgrade::find()->where(['phiscal_year_id' => $year->id])->one();
            if (!isset($model)) {
                $model = new StatOfficerOrganisationUpgrade();
                $model->user_id = Yii::$app->user->id;
                $model->phiscal_year_id = $year->id;
            }
            $model->last_update = date('Y-m-d H:i:s');
            $model->saved = 1;
            if (!$model->save()) throw new Exception(json_encode($model->errors));

            $detail = StatOfficerOrganisationUpgradeDetail::find()->alias('d')
                ->join('join', 'stat_officer_organisation_upgrade o', 'o.id = d.stat_officer_organisation_upgrade_id and o.phiscal_year_id=:year', [':year' => $year->id])
                ->where(['organisation_id' => $post['Model']['organisation']['id']])
                ->one();

            if (!isset($detail)) {
                $detail = new StatOfficerOrganisationUpgradeDetail();
                $detail->stat_officer_organisation_upgrade_id = $model->id;
                $detail->organisation_id = $post['Model']['organisation']['id'];
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
        $year = PhiscalYear::findOne($year);
        if (!isset($year)) {
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app', 'Incorrect Phiscal Year'));
            return;
        }

        $model = StatOfficerOrganisationUpgrade::find()->where(['phiscal_year_id' => $year->id])->one();
        if (!isset($model)) {
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app', 'No Data'));
            return;
        }

        $models = Organisation::find()->alias('m')
            ->select('m.*, d.*')
            ->join('left join', 'stat_officer_organisation_upgrade_detail d', 'd.organisation_id=m.id and d.stat_officer_organisation_upgrade_id=:id', [':id' => $model->id])
            ->where(['deleted' => 0])->orderBy('m.position')->asArray()->all();

        return $this->renderPartial('../ministry/print', [
            'content' => $this->renderPartial('table', [
                'models' => $models, 'year' => $year, 'cols' => $this->columns
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

        $model = StatOfficerOrganisationUpgrade::find()->where(['phiscal_year_id' => $year->id])->one();
        if (!isset($model)) {
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app', 'No Data'));
            return;
        }

        $models = Organisation::find()->alias('m')
            ->select('m.*, d.*')
            ->join('left join', 'stat_officer_organisation_upgrade_detail d', 'd.organisation_id=m.id and d.stat_officer_organisation_upgrade_id=:id', [':id' => $model->id])
            ->where(['deleted' => 0])->orderBy('m.position')->asArray()->all();

        return $this->renderPartial('../ministry/excel', [
            'file' => 'Stat Officers Organisation Upgrade ' . $year->year . '.xls',
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

        $menu = Menu::find()->where(['table_name' => 'stat_officer_organisation_upgrade'])->one();
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
                ':table' => 'stat_officer_organisation_upgrade'
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
