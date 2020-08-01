<?php

namespace app\controllers;

use app\components\MyHelper;
use app\models\Attachment;
use app\models\Menu;
use app\models\Ministry;
use app\models\PhiscalYear;
use app\models\StatGovermentUnit;
use app\models\StatGovermentUnitDetail;
use app\services\AuthenticationService;
use Codeception\Util\HttpCode;
use Yii;
use yii\db\ActiveQuery;
use yii\db\Exception;
use yii\web\Controller;

/**
 * StatGovermentUnitController implements the CRUD actions for StatGovermentUnit model.
 */
class StatGovermentUnitController extends Controller
{
    /**
     * Lists all StatGovermentUnit models.
     * @return mixed
     */
    public function actionIndex($year = null)
    {
        $table = null;
        if (isset($year)) {
            $table = $this->enquiry($year);
        }
        return $this->render('index');
    }

    private function enquiry($year, $showstatus = false)
    {
        $year = PhiscalYear::findOne($year);
        if (!isset($year)) {
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app', 'Incorrect Phiscal Year'));
            return;
        }

        $ministries = Ministry::getMistryByYear($year);

        $sql = "select m.position, m.name, m.ministry_group_id, o1.* from (select sugd.*,sgu.user_id,sgu.saved,sgu.last_update, sgu.phiscal_year_id from stat_goverment_unit_detail sugd
            , stat_goverment_unit sgu
            where sugd.stat_goverment_unit_id = sgu.id
            and sgu.phiscal_year_id=:phiscal_year_id) o1, ministry m
            where o1.ministry_id=m.id and m.deleted=:deleted and m.ministry_group_id in (1,2) order by m.position ASC ";

        $params = [":phiscal_year_id" => $year->id, ":deleted" => 0];

        $models =  StatGovermentUnitDetail::findBySql($sql, $params)->asArray()->all();


        if (!isset($models)) {
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app', 'No Data'));
            return;
        }

        return json_encode([
            'showstatus' => $showstatus,
            'ministries' => $ministries,
            'models' => $models,
            'year' => $year,
            'count'=>$ministries                    
        ]);
    }



    private function enquiryPrintDownload($year, $showstatus = true)
    {
        $year = PhiscalYear::findOne($year);
        if (!isset($year)) {
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app', 'Incorrect Phiscal Year'));
            return;
        }

        
       // $ministries = Ministry::getMistryList($year);
        
       $sql = "select m.position, m.name, m.ministry_group_id, o1.* from (select sugd.*,sgu.user_id,sgu.saved,sgu.last_update, sgu.phiscal_year_id from stat_goverment_unit_detail sugd
       , stat_goverment_unit sgu
       where sugd.stat_goverment_unit_id = sgu.id
       and sgu.phiscal_year_id=:phiscal_year_id) o1, ministry m
       where o1.ministry_id=m.id and m.deleted=:deleted and m.ministry_group_id in (1,2) order by m.position ASC ";

   $params = [":phiscal_year_id" => $year->id, ":deleted" => 0];

   $models =  StatGovermentUnitDetail::findBySql($sql, $params)->all();
        
        $model = StatGovermentUnit::find()
            ->with([
                'statGovermentUnitDetails' => function (ActiveQuery $query) {
                    $query
                        ->with(['ministry' => function (ActiveQuery $query) {
                            $query->where('ministry.deleted=0 and ministry.ministry_group_id in (1,2)')
                                ->orderBy('ministry.position');
                        }]);
                }
            ])
            ->where(['phiscal_year_id' => $year->id])
            ->one();

            // $model->statGovermentUnitDetails = StatGovermentUnitDetail::findBySql($sql, $params)->all();

        if (!isset($models)) {
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app', 'No Data'));
            return;
        }

        return $this->renderPartial('table', [
            'showstatus' => $showstatus,
            'ministries' => $models,
            'model' => $model,
            'year' => $year,
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

        $ministries = Ministry::find()
            ->where("deleted=0 and ministry_group_id in (1,2)")
            ->orderBy('position')
            ->asArray()->all();

        return json_encode([
            "years" => $years,
            "ministries" => $ministries,
        ]);
    }

    public function actionEnquiry($year)
    {
        return $this->enquiry($year);
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

        $sql = " 
        select m.position, m.name, m.ministry_group_id, o1.* from (select sugd.*,sgu.user_id,sgu.saved,sgu.last_update, sgu.phiscal_year_id from stat_goverment_unit_detail sugd
            , stat_goverment_unit sgu
            where sugd.stat_goverment_unit_id = sgu.id
            and sgu.phiscal_year_id=:phiscal_year_id) o1, ministry m
            where o1.ministry_id=m.id and m.deleted=:deleted and m.ministry_group_id in (1,2) 
            and o1.ministry_id=:ministry_id and o1.phiscal_year_id=:phiscal_year_id;

        ";

        $params = [":phiscal_year_id" => $year,":ministry_id"=>$ministry, ":deleted" => 0];
       
        $detail = StatGovermentUnitDetail::findBySql($sql, $params)->asArray()->one();


        return json_encode($detail);
    }

    public function actionSave()
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
            MyHelper::response(HttpCode::BAD_REQUEST, Yii::t('app', 'Incorrect Request Method'));
            return;
        }

        $year = PhiscalYear::findOne($post['year']);
        if (!isset($year)) {
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app', 'Incorrect Phiscal Year'));
            return;
        }

        if ($year->status != "O") {
            MyHelper::response(HttpCode::METHOD_NOT_ALLOWED, Yii::t('app', 'The Year is not allowed to input'));
            return;
        }

        $transaction = Yii::$app->db->beginTransaction();
        try {
            $model = StatGovermentUnit::find()->where(['phiscal_year_id' => $year->id])->one();
            if (!isset($model)) {
                $model = new StatGovermentUnit();
                $model->phiscal_year_id = $year->id;
            }
            $model->user_id = Yii::$app->user->id;
            $model->saved = 1;
            $model->last_update = date('Y-m-d H:i:s');
            if (!$model->save()) throw new Exception(json_encode($model->errors));

            $detail = StatGovermentUnitDetail::find()
                ->where(['stat_goverment_unit_id' => $model->id, 'ministry_id' => $post['ministry']])->one();
            if (!isset($detail)) {
                if($post['saveOrUpdate']){                
                $detail = new StatGovermentUnitDetail();
                $detail->ministry_id = $post['ministry'];
                $detail->stat_goverment_unit_id = $model->id;
                }
            }
            $detail->office = $post['office'];
            $detail->department = $post['department'];
            $detail->division = $post['division'];
            $detail->insitute = $post['insitute'];
            $detail->center = $post['center'];
            if(isset($post['remark'])){
                $detail->remark = $post['remark'];
            }else{
                $detail->remark=null;
            }
            
            if (!$detail->save()) throw new Exception(json_encode($detail->errors));

            $transaction->commit();
            

        } catch (Exception $exception) {
            $transaction->rollBack();
            MyHelper::response(HttpCode::INTERNAL_SERVER_ERROR, $exception->getMessage());
        }
    }

    public function actionDelete()
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
        if (isset($post)) {        
            $model = StatGovermentUnitDetail::findOne($post['id']);
            $model->delete();
            return json_encode($model->delete());
            
        }
    }
    


    public function actionPrint($year)
    {
        $year = PhiscalYear::findOne($year);
        if (!isset($year)) {
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app', 'Incorrect Phiscal Year'));
            return;
        }

        return $this->renderPartial('print', [
            'content' => $this->enquiryPrintDownload($year->id, false)
        ]);
    }

    public function actionDownload($year)
    {
        $year = PhiscalYear::findOne($year);
        if (!isset($year)) {
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app', 'Incorrect Phiscal Year'));
            return;
        }

        return $this->renderPartial('excel', [
            'file' => 'stat_goverment_unit_' . $year->year . '.xls',
            'content' => $this->enquiryPrintDownload($year->id, false)
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

        $menu = Menu::find()->where(['table_name' => 'stat_goverment_unit'])->one();
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
                ':table' => 'stat_goverment_unit'
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
