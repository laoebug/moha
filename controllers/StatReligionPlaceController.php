<?php

namespace app\controllers;

use app\components\MyHelper;
use app\models\Attachment;
use app\models\Menu;
use app\models\PhiscalYear;
use app\models\Province;
use app\models\StatReligionPlace;
use app\models\StatReligionPlaceDetail;
use app\services\AuthenticationService;
use Codeception\Util\HttpCode;
use Yii;
use yii\base\Exception;
use yii\web\Controller;
use app\models\ProvinceAndYearService;

/**
 * StatReligionPlaceController implements the CRUD actions for StatReligionPlace model.
 */
class StatReligionPlaceController extends BaseController
{
    /**
     * Lists all StatReligionPlace models.
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


        return ProvinceAndYearService::getProvincesAndYears();
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

        $model = StatReligionPlace::find()->where(['phiscal_year_id' => $year->id])->one();
        if (!isset($model)) {
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app', 'No Data'));
            return;
        }

        $models = Province::find()->alias('p')->select('p.*, d.*')
            ->join('left join', 'stat_religion_place_detail d', 'd.province_id = p.id and d.stat_religion_place_id=:id', [':id' => $model->id]);

        $user = Yii::$app->user->identity;
        if (isset($user->role->province_id)) {
            $models = $models->where(['d.province_id' => $user->role->province_id]);
        }
        $models = $models->orderBy([
            'p.position' => SORT_ASC
        ])->asArray()->all();



        $stat = StatReligionPlaceDetail::find()
            ->select([
                'phiscal_year_id' => 'r.phiscal_year_id',
                'buddhis' => 'sum(d.buddhis_total + d.buddhis_nomonk + d.buddhis_sim + d.buddhis_nosim)',
                'christ' => 'sum(d.christ_cato_total + d.christ_news_total + d.christ_sat_total)',
                'bahai' => 'r.phiscal_year_id, sum(d.bahai_total)',
                'idslam' => 'r.phiscal_year_id, sum(d.idslam_total)',
            ])->alias('d')
            ->join('join', 'stat_religion_place r', 'r.id = d.stat_religion_place_id and r.phiscal_year_id=:year', [':year' => $year->id]);


        if (isset($user->role->province_id)) {
            $stat = $stat->andWhere(['d.province_id' => $user->role->province_id]);
        }
        $stat = $stat->asArray()->one();
        $data = null;
        if (isset($stat))
            if (isset($stat['phiscal_year_id'])) {
                $s = $stat['buddhis'] + $stat['christ'] + $stat['bahai'] + $stat['idslam'];
                if ($s > 0) {
                    $percent = 100 / $s;
                    $data = [
                        number_format($stat['buddhis'] * $percent, 2),
                        number_format($stat['christ'] * $percent, 2),
                        number_format($stat['bahai'] * $percent, 2),
                        number_format($stat['idslam'] * $percent, 2),
                    ];
                } else {
                    $data = [];
                }
            }

        return json_encode([
            'models' => $models,
            'stat' => [
                'labels' => [
                    "ສາສະໜາພຸດ", "ສາສະໜາເຍຊູຄຣິດ", "ສາສະໜາບາຮາຍ", "ສາສະໜາອິດສະລາມ"
                ],
                'data' => $data
            ],
        ]);
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

        $model = StatReligionPlaceDetail::find()
            ->alias('d')
            ->join('join', 'stat_religion_place l', 'l.id = d.stat_religion_place_id and l.phiscal_year_id=:year', [':year' => $year->id])
            ->where(['d.province_id' => $province]);

        $user = Yii::$app->user->identity;
        if (isset($user->role->province_id)) {
            $model = $model->andWhere(['d.province_id' => $user->role->province_id]);
        }
        $model = $model
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

        if ($year->status != 'O') {
            MyHelper::response(HttpCode::METHOD_NOT_ALLOWED, Yii::t('app', 'The Year is not allow to input'));
            return;
        }

        $post = Yii::$app->request->post();
        if (!isset($post)) {
            MyHelper::response(HttpCode::BAD_REQUEST, Yii::t('app', 'Incorrect Request Mehotd'));
            return;
        }
        if ($year->status != 'O') {
            MyHelper::response(HttpCode::METHOD_NOT_ALLOWED, "The year is not allow to input");
            return;
        }

        $transaction = Yii::$app->db->beginTransaction();
        try {
            $model = StatReligionPlace::find()
                ->where(['phiscal_year_id' => $year->id])
                ->one();
            if (!isset($model)) {
                $model = new StatReligionPlace();
                $model->phiscal_year_id = $year->id;
                $model->user_id = Yii::$app->user->id;
            }
            $model->saved = 1;
            $model->last_update = date('Y-m-d H:i:s');
            if (!$model->save()) throw new Exception(json_encode($model->errors));

            $detail = StatReligionPlaceDetail::find()
                ->where(['stat_religion_place_id' => $model->id, 'province_id' => $post['StatReligionPlaceDetail']['province']['id']])
                ->one();
            if (!isset($detail)) {
                $detail = new StatReligionPlaceDetail();
                $detail->province_id = $post['StatReligionPlaceDetail']['province']['id'];
                $detail->stat_religion_place_id = $model->id;
            }
            $detail->buddhis_total = @$post['StatReligionPlaceDetail']['buddhis_total'];
            $detail->buddhis_monk = @$post['StatReligionPlaceDetail']['buddhis_monk'];
            $detail->buddhis_nomonk = @$post['StatReligionPlaceDetail']['buddhis_nomonk'];
            $detail->buddhis_agreement_built_temple = @$post['StatReligionPlaceDetail']['buddhis_agreement_built_temple'];
            $detail->buddhis_no_agreement_built_temple = @$post['StatReligionPlaceDetail']['buddhis_no_agreement_built_temple'];
            $detail->buddhis_sim = @$post['StatReligionPlaceDetail']['buddhis_sim'];
            $detail->buddhis_nosim = @$post['StatReligionPlaceDetail']['buddhis_nosim'];
            $detail->christ_news_total = @$post['StatReligionPlaceDetail']['christ_news_total'];
            $detail->christ_news_not = @$post['StatReligionPlaceDetail']['christ_news_not'];
            $detail->christ_sat_total = @$post['StatReligionPlaceDetail']['christ_sat_total'];
            $detail->christ_sat_not = @$post['StatReligionPlaceDetail']['christ_sat_not'];
            $detail->christ_cato_total = @$post['StatReligionPlaceDetail']['christ_cato_total'];
            $detail->christ_cato_not = @$post['StatReligionPlaceDetail']['christ_cato_not'];
            $detail->bahai_total = @$post['StatReligionPlaceDetail']['bahai_total'];
            $detail->bahai_not = @$post['StatReligionPlaceDetail']['bahai_not'];
            $detail->idslam_total = @$post['StatReligionPlaceDetail']['idslam_total'];
            $detail->idslam_not = @$post['StatReligionPlaceDetail']['idslam_not'];
            $detail->remark = @$post['StatReligionPlaceDetail']['remark'];

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

        $model = StatReligionPlace::find()->where(['phiscal_year_id' => $year->id])->one();
        if (!isset($model)) {
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app', 'No Data'));
            return;
        }

        $models = Province::find()->alias('p')->select('p.*, d.*')
            ->join('left join', 'stat_religion_place_detail d', 'd.province_id = p.id and d.stat_religion_place_id=:id', [':id' => $model->id]);


        $user = Yii::$app->user->identity;
        if (isset($user->role->province_id)) {
            $models = $models->where(['d.province_id' => $user->role->province_id]);
        }
        $models = $models->orderBy([
            'p.position' => SORT_ASC
        ])->asArray()->all();

        return $this->renderPartial('../ministry/print', [
            'content' => $this->renderPartial('table', ['models' => $models, "year" => $year])
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

        $model = StatReligionPlace::find()->where(['phiscal_year_id' => $year->id])->one();
        if (!isset($model)) {
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app', 'No Data'));
            return;
        }

        $models = Province::find()->alias('province')->select('province.*, d.*')
            ->join('left join', 'stat_religion_place_detail d', 'd.province_id = province.id and d.stat_religion_place_id=:id', [':id' => $model->id])
            ->asArray()->all();

        return $this->renderPartial('../ministry/excel', [
            'file' => 'Stat Local Administration ' . $year->year . '.xls',
            'content' => $this->renderPartial('table', ['models' => $models, "year" => $year])
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

        $menu = Menu::find()->where(['table_name' => 'stat_religion_place'])->one();
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
                ':table' => 'stat_religion_place'
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
