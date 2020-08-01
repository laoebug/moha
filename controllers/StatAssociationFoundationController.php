<?php

namespace app\controllers;

use app\components\MyHelper;
use app\models\ApproverLevel;
use app\models\Attachment;
use app\models\Menu;
use app\models\PhiscalYear;
use app\models\StatAssociationFoundation;
use app\models\StatAssociationFoundationDetail;
use app\services\AuthenticationService;
use Codeception\Util\HttpCode;
use Yii;
use yii\db\ActiveQuery;
use yii\db\Exception;
use yii\web\Controller;

/**
 * StatAssociationFoundationController implements the CRUD actions for StatAssociationFoundation model.
 */
class StatAssociationFoundationController extends Controller
{
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

    /**
     * Lists all StatAssociationFoundation models.
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

        $user = Yii::$app->user->identity;

        $years = PhiscalYear::find()->orderBy('year')
            ->where(['deleted' => 0])->asArray()->all();


        $approverLevels = ApproverLevel::find()
            ->alias('l')
            ->with([
                'approvers' => function (ActiveQuery $query) use ($user) {
                    $query->alias('a')
                        ->with([
                            'province' => function (ActiveQuery $query) use ($user) {

                                $query = $query->alias('province')
                                    ->andWhere(['province.deleted' => 0]);
                                if (!empty($user->role->province_id)) {
                                    $query = $query->andWhere(['province.id' => $user->role->province_id]);
                                }
                                $query->orderBy('province.position');
                            },
                            'ministry' => function (ActiveQuery $query) {
                                $query->orderBy('position');
                            }
                        ])
                        ->where(['a.deleted' => 0]);
                    if (!empty($user->role->province_id)) {
                        $query->andWhere(['province_id' => $user->role->province_id]);
                    }
                }
            ])
            ->where(['l.deleted' => 0])->orderBy('l.position');


        if (!empty($user->role->province_id)) {
            $approverLevels = $approverLevels->andWhere(['code' => 'P']);
        }

        $approverLevels = $approverLevels->asArray()->all();

        // $approverLevels = ApproverLevel::find()->asArray()->all();
        return json_encode([
            "years" => $years,
            "approverLevels" => $approverLevels,
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

        $model = StatAssociationFoundation::find()->where(['phiscal_year_id' => $year->id])->one();

        if (!isset($model)) {
            // MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app', 'No Data'));
            // return;
            $models = [];
        } else {


            $models = ApproverLevel::find()
                ->with([
                    'approvers' => function (ActiveQuery $query) use ($year, $model) {
                        $query->where(['deleted' => 0])
                            ->with([
                                'province' => function (ActiveQuery $query) {
                                    $query->andWhere(['deleted' => 0])
                                        ->orderBy('position');
                                },
                                'ministry' => function (ActiveQuery $query) {
                                    $query->orderBy('position');
                                }
                            ])
                            ->alias('a')
                            ->select('a.*, d.*')
                            ->join('join', 'stat_association_foundation_detail d', 'a.id = d.approver_id and d.stat_association_foundation_id=:id', [':id' => $model->id]);

                        $user = Yii::$app->user->identity;
                        if (!empty($user->role->province_id)) {
                            $query->andWhere(['d.approver_id' => $user->role->province_id]);
                        }
                    }
                ])->alias('l')
                ->where(['l.deleted' => 0])
                ->orderBy('l.position, position')
                ->asArray()->all();
        }
        if (count($models) <= 0) {
            $models = [];
        }
        return json_encode([
            'models' => $models
        ]);
    }

    public function actionInquiry($year, $approver)
    {
        $year = PhiscalYear::findOne($year);
        if (!isset($year)) {
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app', 'Incorrect Phiscal Year'));
            return;
        }

        $model = StatAssociationFoundationDetail::find()->where(['approver_id' => $approver])
            ->alias('d')
            ->join('join', 'stat_association_foundation f', 'f.id = d.stat_association_foundation_id and f.phiscal_year_id=:year', [':year' => $year->id])
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
        if (!isset($post)) {
            MyHelper::response(HttpCode::BAD_REQUEST, Yii::t('app', 'Incorrect Request Method'));
            return;
        }

        $year = PhiscalYear::findOne($year);
        if (!isset($year)) {
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app', 'Incorrect Phiscal Year'));
            return;
        }

        if ($year->status != 'O') {
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app', 'The Year is not allowed to input'));
            return;
        }

        $transaction = Yii::$app->db->beginTransaction();
        try {
            $model = StatAssociationFoundation::find()
                ->where(['phiscal_year_id' => $year->id])->one();
            if (!isset($model)) {
                $model = new StatAssociationFoundation();
                $model->user_id = Yii::$app->user->id;
                $model->phiscal_year_id = $year->id;
            }
            $model->last_update = date('Y-m-d H:i:s');
            $model->saved = 1;
            if (!$model->save()) throw new Exception(json_encode($model->errors));

            $detail = StatAssociationFoundationDetail::find()
                ->where(['stat_association_foundation_id' => $model->id, 'approver_id' => $post['StatAssociationFoundationDetail']['approver']['id']])
                ->one();
            if (!isset($detail)) {
                $detail = new StatAssociationFoundationDetail();
                $detail->stat_association_foundation_id = $model->id;
                $detail->approver_id = $post['StatAssociationFoundationDetail']['approver']['id'];
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
        $year = PhiscalYear::findOne($year);
        if (!isset($year)) {
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app', 'Incorrect Phiscal Year'));
            return;
        }

        $model = StatAssociationFoundation::find()->where(['phiscal_year_id' => $year->id])->one();
        if (!isset($model)) {
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app', 'No Data'));
            return;
        }

        $models = ApproverLevel::find()
            ->with([
                'approvers' => function (ActiveQuery $query) use ($year, $model) {
                    $query->where(['deleted' => 0])
                        ->with([
                            'province' => function (ActiveQuery $query) {
                                $user = Yii::$app->user->identity;
                                $query = $query->alias('province')->andWhere(['province.deleted' => 0]);
                                if (!empty($user->role->province_id)) {
                                    $query = $query->andWhere(['province.id' => $user->role->province_id]);
                                }
                                $query->orderBy('province.position');
                            },
                            'ministry' => function (ActiveQuery $query) {
                                $query->alias('m')
                                    ->orderBy('m.position');
                            }
                        ])
                        ->alias('a')
                        ->select('a.*, d.*')
                        ->join('left join', 'stat_association_foundation_detail d', 'a.id = d.approver_id and d.stat_association_foundation_id=:id', [':id' => $model->id]);
                }
            ])->alias('l')
            ->where(['l.deleted' => 0])->orderBy('l.position')->asArray()->all();


        return $this->renderPartial('../ministry/print', [
            'content' => $this->renderPartial('table', ['models' => $models, 'year' => $year])
        ]);
    }

    public function actionDownload($year)
    {
        $year = PhiscalYear::findOne($year);
        if (!isset($year)) {
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app', 'Incorrect Phiscal Year'));
            return;
        }

        $model = StatAssociationFoundation::find()->where(['phiscal_year_id' => $year->id])->one();
        if (!isset($model)) {
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app', 'No Data'));
            return;
        }

        $models = ApproverLevel::find()
            ->with([
                'approvers' => function (ActiveQuery $query) use ($year, $model) {
                    $query->where(['deleted' => 0])
                        ->with([
                            'province' => function (ActiveQuery $query) {
                                $query->alias('province')
                                    ->orderBy('province.position');
                            },
                            'ministry' => function (ActiveQuery $query) {
                                $query->alias('m')
                                    ->orderBy('m.position');
                            }
                        ])
                        ->alias('a')
                        ->select('a.*, d.*')
                        ->join('left join', 'stat_association_foundation_detail d', 'a.id = d.approver_id and d.stat_association_foundation_id=:id', [':id' => $model->id]);
                }
            ])->alias('l')
            ->where(['l.deleted' => 0])->orderBy('l.position')->asArray()->all();


        return $this->renderPartial('../ministry/excel', [
            'file' => 'Stat Association Foundation ' . $year->year . '.xls',
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

        $menu = Menu::find()->where(['table_name' => 'stat_association_foundation'])->one();
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
                ':table' => 'stat_association_foundation'
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
