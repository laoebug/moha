<?php

namespace app\controllers;

use app\components\MyHelper;
use app\models\Attachment;
use app\models\LegalType;
use app\models\Menu;
use app\models\PhiscalYear;
use app\models\StatLegal;
use app\models\StatLegalDetail;
use app\services\AuthenticationService;
use Codeception\Util\HttpCode;
use Yii;
use yii\db\ActiveQuery;
use yii\db\Exception;
use yii\web\Controller;

/**
 * StatLegalController implements the CRUD actions for StatLegal model.
 */
class StatLegalController extends BaseController
{
   
    /**
     * Lists all StatLegal models.
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

        $years = PhiscalYear::find()->orderBy('year')
            ->where(['deleted' => 0])->asArray()->all();

        $legalTypes = LegalType::find()
            ->with([
                'legals' => function (ActiveQuery $query) {
                    $query->where(['deleted' => 0])->orderBy('position');
                }
            ])
            ->where(['deleted' => 0])->orderBy('position')->asArray()->all();

        return json_encode([
            'years' => $years,
            'legalTypes' => $legalTypes
        ]);
    }

    public function actionEnquiry_old($year)
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

        $model = StatLegal::find()->where(['phiscal_year_id' => $year->id])->one();
        $models = [];
        if (!isset($model)) {
            // MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app', 'No Data'));
            // return;
            $models = [];
        } else {

            $models = LegalType::find()
                ->alias('t')
                ->with([
                    'legals' => function (ActiveQuery $query) use ($year) {
                        $query->where(['deleted' => 0])
                            ->select('d.*, l.*')
                            ->alias('l')
                            ->join('left join', 'stat_legal_detail d', 'd.legal_id = l.id')
                            ->orderBy('position');
                    }
                ])
                ->where(['deleted' => 0])
                ->orderBy('position')->asArray()->all();
        }
        return json_encode([
            'models' => $models
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

        $model = StatLegal::find()->where(['phiscal_year_id' => $year->id])->one();
        $models = [];
        if (!isset($model)) {
            
            $models = [];
        } else {

            $models = LegalType::find()
                ->alias('t')
                ->with([
                    'statLegalDetails' => function (ActiveQuery $query) use ($year, $model) {
                        $query->where('stat_legal_id=:stat_legal_id', [':stat_legal_id' => $model->id])
                            ->select('d.*')
                            ->alias('d')
                            ->join('join', 'legal_type lt', 'd.legal_type_id = lt.id')
                            ->join('join', 'stat_legal sl','sl.id = d.stat_legal_id')
                            ->join('join', 'phiscal_year phy','phy.id = sl.phiscal_year_id and sl.phiscal_year_id=:phiscal_year_id',[':phiscal_year_id'=>$year->id])
                            ->orderBy('d.id DESC');
                    }

                ])
                ->where(['deleted' => 0])
                ->orderBy('position')->asArray()->all();
        }
         
        return json_encode([
            'models' => $models
        ]);
    }



    public function actionInquiry($year, $legal)
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

        $model = StatLegalDetail::find()->alias('d')
            ->with(['legal'])
            ->join('join', 'stat_legal l', 'l.id=d.stat_legal_id and l.phiscal_year_id=:year', [':year' => $year->id])
            ->where(['legal_id' => $legal])
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
       

        if (!isset($post['StatLegalDetail'])) {
            MyHelper::response(HttpCode::BAD_REQUEST, Yii::t('app', 'Inccorect Request Method'));
            return;
        }
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
            $model = StatLegal::find()->where(['phiscal_year_id' => $year->id])->one();
            if (!isset($model)) {
                $model = new StatLegal();
                $model->user_id = Yii::$app->user->id;
                $model->phiscal_year_id = $year->id;
            }
            $model->last_update = date('Y-m-d H:i:s');
            $model->saved = 1;
            if (!$model->save()) throw new Exception(json_encode($model->errors));
            
            // $detail = StatLegalDetail::find()->alias('d')
            //     ->join('join', 'stat_legal l', 'd.stat_legal_id=l.id and l.phiscal_year_id=:year', [':year' => $year->id])
            //     ->where(['legal_name' => $post['StatLegalDetail']['legal_name']])
            //     ->one();
            $detail = new StatLegalDetail();        
            if (isset($post['StatLegalDetail']['id'])) {                                            
                $detail = StatLegalDetail::find()->where('id = :id', [':id' => $post['StatLegalDetail']['id']])->one();
            }                    
            
            
            $detail->legal_name = $post['StatLegalDetail']['legal_name'];            
            $detail->stat_legal_id = $model->id;           
            $detail->legal_type_id = $post['StatLegalDetail']['legalType'];
            
            $detail->load($post);            
            if (!$detail->save()) throw new Exception(json_encode($detail->errors));
            $transaction->commit();
        } catch (Exception $exception) {
            $transaction->rollBack();
            MyHelper::response(HttpCode::INTERNAL_SERVER_ERROR, $exception->getMessage());
            return;
        }
        
    }






    //     public function actionSave_Old($year) {

    //     	$user = Yii::$app->user->identity;
    //     	$controller_id = Yii::$app->controller->id;
    //     	$acton_id = Yii::$app->controller->action->id;
    //     	if ($user->role ["name"] != Yii::$app->params ['DEFAULT_ADMIN_ROLE']) {
    //     		if (! AuthenticationService::isAccessibleAction ( $controller_id, $acton_id )) {
    //     			MyHelper::response ( HttpCode::UNAUTHORIZED, Yii::t ( 'app', 'HTTP Error 401- You are not authorized to access this operaton due to invalid authentication' ) . " with ID:  " . $controller_id . "/ " . $acton_id );
    //     			return;
    //     		}
    //     	}

    //         $post = Yii::$app->request->post();
    //         if(!isset($post['StatLegalDetail'])) {
    //             MyHelper::response(HttpCode::BAD_REQUEST, Yii::t('app', 'Inccorect Request Method'));
    //             return;
    //         }
    //         $year = PhiscalYear::findOne($year);
    //         if(!isset($year)) {
    //             MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app', 'Inccorect Phiscal Year'));
    //             return;
    //         }
    //         if($year->status != 'O') {
    //             MyHelper::response(HttpCode::METHOD_NOT_ALLOWED, Yii::t('app', 'The Year is not allowed to input'));
    //             return;
    //         }

    //         $transaction = Yii::$app->db->beginTransaction();
    //         try {
    //             $model = StatLegal::find()->where(['phiscal_year_id' => $year->id])->one();
    //             if(!isset($model)) {
    //                 $model = new StatLegal();
    //                 $model->user_id = Yii::$app->user->id;
    //                 $model->phiscal_year_id = $year->id;
    //             }
    //             $model->last_update = date('Y-m-d H:i:s');
    //             $model->saved = 1;
    //             if(!$model->save()) throw new Exception(json_encode($model->errors));

    //             $detail = StatLegalDetail::find()->alias('d')
    //                 ->join('join', 'stat_legal l', 'd.stat_legal_id=l.id and l.phiscal_year_id=:year', [':year' => $year->id])
    //                 ->where(['legal_id' => $post['StatLegalDetail']['legal']['id']])
    //                 ->one();
    // //            return json_encode(['detail' => $detail]);exit;

    //             if(!isset($detail)) {
    //                 $detail = new StatLegalDetail();
    //                 $detail->legal_id = $post['StatLegalDetail']['legal']['id'];
    //                 $detail->stat_legal_id = $model->id;
    //             }
    //             $detail->load($post);

    //             if(!$detail->save()) throw new Exception(json_encode($detail->errors));
    //             $transaction->commit();
    //         } catch (Exception $exception) {
    //             $transaction->rollBack();
    //             MyHelper::response(HttpCode::INTERNAL_SERVER_ERROR, $exception->getMessage());
    //             return;
    //         }
    //     }


    public function actionPrint($year)
    {
        $year = PhiscalYear::findOne($year);
        if (!isset($year)) {
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app', 'Inccorect Phiscal Year'));
            return;
        }

        $model = StatLegal::find()->where(['phiscal_year_id' => $year->id])->one();
        if (!isset($model)) {
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app', 'No Data'));
            return;
        }

        // $models = LegalType::find()
        //     ->alias('t')
        //     ->with([
        //         'legals' => function (ActiveQuery $query) use ($year) {
        //             $query->where(['deleted' => 0])
        //                 ->select('d.*, l.*')
        //                 ->alias('l')
        //                 ->join('left join', 'stat_legal_detail d', 'd.legal_id = l.id')
        //                 ->orderBy('position');
        //         }
        //     ])
        //     ->where(['deleted' => 0])
        //     ->orderBy('position')->asArray()->all();

        $models = LegalType::find()
                ->alias('t')
                ->with([
                    'statLegalDetails' => function (ActiveQuery $query) use ($year, $model) {
                        $query->where('stat_legal_id=:stat_legal_id', [':stat_legal_id' => $model->id])
                            ->select('d.*')
                            ->alias('d')
                            ->join('join', 'legal_type lt', 'd.legal_type_id = lt.id')
                            ->join('join', 'stat_legal sl','sl.id = d.stat_legal_id')
                            ->join('join', 'phiscal_year phy','phy.id = sl.phiscal_year_id and sl.phiscal_year_id=:phiscal_year_id',[':phiscal_year_id'=>$year->id])
                            ->orderBy('d.id DESC');
                    }

                ])
                ->where(['deleted' => 0])
                ->orderBy('position')->asArray()->all();


        return $this->renderPartial('../ministry/print', [
            'content' => $this->renderPartial('table', ['models' => $models, 'year' => $year])
        ]);
    }

    public function actionDownload($year)
    {
        $year = PhiscalYear::findOne($year);
        if (!isset($year)) {
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app', 'Inccorect Phiscal Year'));
            return;
        }

        $model = StatLegal::find()->where(['phiscal_year_id' => $year->id])->one();
        if (!isset($model)) {
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app', 'No Data'));
            return;
        }

        // $models = LegalType::find()
        //     ->alias('t')
        //     ->with([
        //         'legals' => function (ActiveQuery $query) use ($year) {
        //             $query->where(['deleted' => 0])
        //                 ->select('d.*, l.*')
        //                 ->alias('l')
        //                 ->join('left join', 'stat_legal_detail d', 'd.legal_id = l.id')
        //                 ->orderBy('position');
        //         }
        //     ])
        //     ->where(['deleted' => 0])
        //     ->orderBy('position')->asArray()->all();

        $models = LegalType::find()
                ->alias('t')
                ->with([
                    'statLegalDetails' => function (ActiveQuery $query) use ($year, $model) {
                        $query->where('stat_legal_id=:stat_legal_id', [':stat_legal_id' => $model->id])
                            ->select('d.*')
                            ->alias('d')
                            ->join('join', 'legal_type lt', 'd.legal_type_id = lt.id')
                            ->join('join', 'stat_legal sl','sl.id = d.stat_legal_id')
                            ->join('join', 'phiscal_year phy','phy.id = sl.phiscal_year_id and sl.phiscal_year_id=:phiscal_year_id',[':phiscal_year_id'=>$year->id])
                            ->orderBy('d.id DESC');
                    }

                ])
                ->where(['deleted' => 0])
                ->orderBy('position')->asArray()->all();
         
        

        return $this->renderPartial('../ministry/excel', [
            'file' => 'Statistic of Internal Legal ' . $year->year . '.xls',
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

        $menu = Menu::find()->where(['table_name' => 'stat_legal'])->one();
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
                ':table' => 'stat_legal'
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
