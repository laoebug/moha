<?php

namespace app\controllers;

use app\components\MyHelper;
use app\models\Attachment;
use app\models\Book;
use app\models\Menu;
use app\models\Ministry;
use app\models\Organisation;
use app\models\PhiscalYear;
use app\models\Province;
use app\models\StatDocument;
use app\models\StatDocumentDetail;
use app\services\AuthenticationService;
use Codeception\Util\HttpCode;
use Yii;
use yii\db\Exception;
use yii\web\Controller;

/**
 * StatDocumentController implements the CRUD actions for StatDocument model.
 */
class StatDocumentController extends BaseController
{
    /**
     * Lists all StatDocument models.
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

        $years = PhiscalYear::find()
            ->where(['deleted' => 0])
            ->orderBy('year')
            ->asArray()->all();
        $ministries = Ministry::find()
            ->where(['deleted' => 0, 'ministry_group_id' => 1])
            ->orderBy('position')
            ->asArray()->all();
        $equals = Ministry::find()->where(['deleted' => 0, 'ministry_group_id' => 2])
            ->orderBy('position')
            ->asArray()->all();
        $provinces = Province::find()->asArray()->all();
        $organisations = Organisation::find()->where(['deleted' => 0])->orderBy('position')->asArray()->all();
        $books = Book::find()->where(['deleted' => 0])->orderBy('position')->asArray()->all();
        return json_encode([
            'years' => $years,
            'books' => $books,
            'ministries' => $ministries,
            'equals' => $equals,
            'provinces' => $provinces,
            'organisations' => $organisations,
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

        $ministries = StatDocumentDetail::find()->alias('d')->select('d.*')->addSelect(['name' => 'm.name'])
            ->join('join', 'stat_document s', 's.id = d.stat_document_id and s.phiscal_year_id=:year', [':year' => $year->id])->where('ministry_id is not null')
            ->join('join', 'ministry m', 'm.id = d.ministry_id')
            ->where('ministry_id is not null and m.ministry_group_id =1 and m.deleted=0')
            ->orderBy('m.position')->asArray()->all();

        $equals = StatDocumentDetail::find()->alias('d')->select('d.*')->addSelect(['name' => 'm.name'])
            ->join('join', 'stat_document s', 's.id = d.stat_document_id and s.phiscal_year_id=:year', [':year' => $year->id])->where('ministry_id is not null')
            ->join('join', 'ministry m', 'm.id = d.ministry_id')
            ->where('ministry_id is not null and m.ministry_group_id=2 and m.deleted=0')
            ->orderBy('m.position')->asArray()->all();

        $organisations = StatDocumentDetail::find()->alias('d')->select('d.*')->addSelect(['name' => 'm.name'])
            ->join('join', 'stat_document s', 's.id = d.stat_document_id and s.phiscal_year_id=:year', [':year' => $year->id])->where('organisation_id is not null')
            ->join('join', 'organisation m', 'm.id = d.organisation_id')
            ->orderBy('m.position')->asArray()->all();

        $provinces = StatDocumentDetail::find()->alias('d')->select('d.*')->addSelect(['name' => 'm.province_name'])
            ->join('join', 'stat_document s', 's.id = d.stat_document_id and s.phiscal_year_id=:year', [':year' => $year->id])->where('province_id is not null')
            ->join('join', 'province m', 'm.id = d.province_id')
            ->orderBy('m.province_code')->asArray()->all();

        $books = StatDocumentDetail::find()->alias('d')->select('d.*')->addSelect(['name' => 'm.name'])
            ->join('join', 'stat_document s', 's.id = d.stat_document_id and s.phiscal_year_id=:year', [':year' => $year->id])->where('book_id is not null')
            ->join('join', 'book m', 'm.id = d.book_id')
            ->orderBy('m.position')->asArray()->all();

        return json_encode(
            [
                'models' => [
                    ['name' => 'ບັນດາກະຊວງ', 'details' => $ministries,],
                    ['name' => 'ອົງການທຽບເທົ່າ', 'details' => $equals,],
                    ['name' => 'ອົງການ ແລະ ພາກສ່ວນຕ່າງໆ', 'details' => $organisations,],
                    ['name' => 'ແຂວງ', 'details' => $provinces,],
                    ['name' => 'ເອກະສານປະເພດປຶ້ມ', 'details' => $books,],
                ]
            ]
        );
    }

    public function actionInquiry($year, $province = null, $ministry = null, $organisation = null, $book = null)
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

        if (!isset($province) && !isset($ministry) && !isset($organisation) && !isset($book)) {
            MyHelper::response(HttpCode::BAD_REQUEST, Yii::t('app', 'Bad Request'));
            return;
        }
        $year = PhiscalYear::findOne($year);
        if (!isset($year)) {
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app', 'Incorrect Phiscal Year'));
            return;
        }

        $query = StatDocumentDetail::find()->alias('d')
            ->join('join', 'stat_document s', 's.id = d.stat_document_id and s.phiscal_year_id=:year', [':year' => $year->id]);
        if (isset($ministry)) $query->where(['ministry_id' => $ministry]);
        if (isset($province)) $query->where(['province_id' => $province]);
        if (isset($organisation)) $query->where(['organisation_id' => $organisation]);
        if (isset($book)) $query->where(['book_id' => $book]);

        return json_encode(['model' => $query->asArray()->one()]);
    }

    public function actionSave($year)
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
            $transaction = Yii::$app->db->beginTransaction();
            try {
                $model = StatDocument::find()->where(['phiscal_year_id' => $year->id])->one();
                if (!isset($model)) {
                    $model = new StatDocument();
                    $model->phiscal_year_id = $year->id;
                    $model->user_id = Yii::$app->user->id;
                }
                $model->saved = 1;
                $model->last_update = date('Y-m-d H:i:s');
                if (!$model->save()) throw new Exception(json_encode($model->errors));

                $query = StatDocumentDetail::find()->alias('d')
                    ->join('join', 'stat_document s', 's.id = d.stat_document_id and s.phiscal_year_id=:year', [':year' => $year->id]);

                if ($post['Model']['section']['code'] == 'm' && isset($post['Model']['ministry']['id']))
                    $query->where([
                        'ministry_id' => $post['Model']['ministry']['id']
                    ]);

                else if ($post['Model']['section']['code'] == 'o' && isset($post['Model']['organisation']['id']))
                    $query->where([
                        'organisation_id' => $post['Model']['organisation']['id']
                    ]);

                else if ($post['Model']['section']['code'] == 'p' && isset($post['Model']['province']['id']))
                    $query->where([
                        'province_id' => $post['Model']['province']['id']
                    ]);
                else if ($post['Model']['section']['code'] == 'b' && isset($post['Model']['book']['id']))
                    $query->where([
                        'book_id' => $post['Model']['book']['id']
                    ]);

                $detail = $query->one();
                if (!isset($detail)) {
                    $detail = new StatDocumentDetail();
                    $detail->stat_document_id = $model->id;
                    if ($post['Model']['section']['code'] == 'm' && isset($post['Model']['ministry']['id']))
                        $detail->ministry_id = $post['Model']['ministry']['id'];

                    else if ($post['Model']['section']['code'] == 'o' && isset($post['Model']['organisation']['id']))
                        $detail->organisation_id = $post['Model']['organisation']['id'];

                    else if ($post['Model']['section']['code'] == 'p' && isset($post['Model']['province']['id']))
                        $detail->province_id = $post['Model']['province']['id'];

                    else if ($post['Model']['section']['code'] == 'b' && isset($post['Model']['book']['id']))
                        $detail->book_id = $post['Model']['book']['id'];
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
        return json_encode($year);
    }

    public function actionPrint($year)
    {
        $year = PhiscalYear::findOne($year);
        if (!isset($year)) {
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app', 'Incorrect Phiscal Year'));
            return;
        }

        $ministries = StatDocumentDetail::find()->alias('d')->select('d.*')->addSelect(['name' => 'm.name'])
            ->where('ministry_id is not null')
            ->join('join', 'stat_document s', 's.id = d.stat_document_id and s.phiscal_year_id=:year', [':year' => $year->id])->where('ministry_id is not null')
            ->join('join', 'ministry m', 'm.id = d.ministry_id')
            ->orderBy('m.position')->asArray()->all();

        $organisations = StatDocumentDetail::find()->alias('d')->select('d.*')->addSelect(['name' => 'm.name'])
            ->join('join', 'stat_document s', 's.id = d.stat_document_id and s.phiscal_year_id=:year', [':year' => $year->id])->where('organisation_id is not null')
            ->join('join', 'organisation m', 'm.id = d.organisation_id')
            ->orderBy('m.position')->asArray()->all();

        $provinces = StatDocumentDetail::find()->alias('d')->select('d.*')->addSelect(['name' => 'm.province_name'])
            ->join('join', 'stat_document s', 's.id = d.stat_document_id and s.phiscal_year_id=:year', [':year' => $year->id])->where('province_id is not null')
            ->join('join', 'province m', 'm.id = d.province_id')
            ->orderBy('m.province_code')->asArray()->all();

        $books = StatDocumentDetail::find()->alias('d')->select('d.*')->addSelect(['name' => 'm.name'])
            ->join('join', 'stat_document s', 's.id = d.stat_document_id and s.phiscal_year_id=:year', [':year' => $year->id])->where('book_id is not null')
            ->join('join', 'book m', 'm.id = d.book_id')
            ->orderBy('m.position')->asArray()->all();

        return $this->renderPartial('../ministry/print', [
            'content' => $this->renderPartial('table', [
                'year' => $year,
                'models' => [
                    ['name' => 'ກະຊວງ ແລະ ອົງການທຽບເທົ່າ', 'details' => $ministries,],
                    ['name' => 'ອົງການ ແລະ ພາກສ່ວນຕ່າງໆ', 'details' => $organisations,],
                    ['name' => 'ແຂວງ', 'details' => $provinces,],
                    ['name' => 'ເອກະສານປະເພດປຶ້ມ', 'details' => $books,]
                ]
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

        $ministries = StatDocumentDetail::find()->alias('d')->select('d.*')->addSelect(['name' => 'm.name'])
            ->where('ministry_id is not null')
            ->join('join', 'stat_document s', 's.id = d.stat_document_id and s.phiscal_year_id=:year', [':year' => $year->id])->where('ministry_id is not null')
            ->join('join', 'ministry m', 'm.id = d.ministry_id')
            ->orderBy('m.position')->asArray()->all();

        $organisations = StatDocumentDetail::find()->alias('d')->select('d.*')->addSelect(['name' => 'm.name'])
            ->join('join', 'stat_document s', 's.id = d.stat_document_id and s.phiscal_year_id=:year', [':year' => $year->id])->where('organisation_id is not null')
            ->join('join', 'organisation m', 'm.id = d.organisation_id')
            ->orderBy('m.position')->asArray()->all();

        $provinces = StatDocumentDetail::find()->alias('d')->select('d.*')->addSelect(['name' => 'm.province_name'])
            ->join('join', 'stat_document s', 's.id = d.stat_document_id and s.phiscal_year_id=:year', [':year' => $year->id])->where('province_id is not null')
            ->join('join', 'province m', 'm.id = d.province_id')
            ->orderBy('m.province_code')->asArray()->all();

        $books = StatDocumentDetail::find()->alias('d')->select('d.*')->addSelect(['name' => 'm.name'])
            ->join('join', 'stat_document s', 's.id = d.stat_document_id and s.phiscal_year_id=:year', [':year' => $year->id])->where('book_id is not null')
            ->join('join', 'book m', 'm.id = d.book_id')
            ->orderBy('m.position')->asArray()->all();

        return $this->renderPartial('../ministry/excel', [
            'file' => 'Stat Document ' . $year->year . '.xls',
            'content' => $this->renderPartial('table', [
                'year' => $year,
                'models' => [
                    ['name' => 'ກະຊວງ ແລະ ອົງການທຽບເທົ່າ', 'details' => $ministries,],
                    ['name' => 'ອົງການ ແລະ ພາກສ່ວນຕ່າງໆ', 'details' => $organisations,],
                    ['name' => 'ແຂວງ', 'details' => $provinces,],
                    ['name' => 'ເອກະສານປະເພດປຶ້ມ', 'details' => $books,]
                ]
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

        $menu = Menu::find()->where(['table_name' => 'stat_document'])->one();
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
                ':table' => 'stat_document'
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
