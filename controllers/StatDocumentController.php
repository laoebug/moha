<?php

namespace app\controllers;

use app\components\MyHelper;
use app\models\Book;
use app\models\Ministry;
use app\models\Organisation;
use app\models\PhiscalYear;
use app\models\Province;
use app\models\StatDocumentDetail;
use Codeception\Util\HttpCode;
use Yii;
use app\models\StatDocument;
use app\models\StatDocumentSearch;
use yii\db\Exception;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;

/**
 * StatDocumentController implements the CRUD actions for StatDocument model.
 */
class StatDocumentController extends Controller
{
    /**
     * Lists all StatDocument models.
     * @return mixed
     */
    public function actionIndex()
    {
        return $this->render('index');
    }

    public function actionGet() {
        $years = PhiscalYear::find()->where(['deleted' => 0])->asArray()->all();
        $ministries = Ministry::find()->where(['deleted' => 0])->orderBy('position')->asArray()->all();
        $provinces = Province::find()->where(['deleted' => 0])->orderBy('province_code')->asArray()->all();
        $organisations = Organisation::find()->where(['deleted' => 0])->orderBy('position')->asArray()->all();
        $books = Book::find()->where(['deleted' => 0])->orderBy('position')->asArray()->all();
        return json_encode([
            'years' => $years,
            'books' => $books,
            'ministries' => $ministries,
            'provinces' => $provinces,
            'organisations' => $organisations,
        ]);
    }

    public function actionEnquiry($year) {
        $year = PhiscalYear::findOne($year);
        if(!isset($year)) {
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app','Incorrect Phiscal Year'));
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

        return json_encode(['models' => [
                    ['name' => 'ກະຊວງ ແລະ ອົງການທຽບເທົ່າ','details' => $ministries,],
                    ['name' => 'ອົງການ ແລະ ພາກສ່ວນຕ່າງໆ','details' => $organisations,],
                    ['name' => 'ແຂວງ','details' => $provinces,],
                    ['name' => 'ເອກະສານປະເພດປຶ້ມ','details' => $books,],
                ]
            ]
        );
    }

    public function actionInquiry($year, $province=null, $ministry=null,$organisation=null,$book=null) {
        if(!isset($province) && !isset($ministry) && !isset($organisation) && !isset($book)) {
            MyHelper::response(HttpCode::BAD_REQUEST, Yii::t('app','Bad Request'));
            return;
        }
        $year = PhiscalYear::findOne($year);
        if(!isset($year)) {
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app','Incorrect Phiscal Year'));
            return;
        }

        $query = StatDocumentDetail::find()->alias('d')
            ->join('join', 'stat_document s', 's.id = d.stat_document_id and s.phiscal_year_id=:year', [':year' => $year->id]);
        if(isset($ministry)) $query->where(['ministry_id' => $ministry]);
        if(isset($province)) $query->where(['province_id' => $province]);
        if(isset($organisation)) $query->where(['organisation_id' => $organisation]);
        if(isset($book)) $query->where(['book_id' => $book]);

        return json_encode(['model' => $query->asArray()->one()]);
    }

    public function actionSave($year) {
        $year = PhiscalYear::findOne($year);
        if(!isset($year)) {
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app','Incorrect Phiscal Year'));
            return;
        }

        $post = Yii::$app->request->post();
        if(isset($post)) {
            $transaction = Yii::$app->db->beginTransaction();
            try {
                $model = StatDocument::find()->where(['phiscal_year_id' => $year->id])->one();
                if(!isset($model)) {
                    $model = new StatDocument();
                    $model->phiscal_year_id = $year->id;
                    $model->user_id = Yii::$app->user->id;
                }
                $model->saved = 1;
                $model->last_update = date('Y-m-d H:i:s');
                if(!$model->save()) throw new Exception(json_encode($model->errors));

                $query = StatDocumentDetail::find()
                    ->where(['stat_document_id' => $model->id]);

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
                if(!isset($detail)) {
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
                if(!$detail->save()) throw new Exception(json_encode($detail->errors));
                $transaction->commit();
            } catch (Exception $exception) {
                $transaction->rollBack();
                MyHelper::response(HttpCode::INTERNAL_SERVER_ERROR, $exception->getMessage());
                return;
            }

        }
    }

    public function actionPrint($year) {
        $year = PhiscalYear::findOne($year);
        if(!isset($year)) {
            MyHelper::response(HttpCode::NOT_FOUND, Yii::t('app','Incorrect Phiscal Year'));
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
                    ['name' => 'ກະຊວງ ແລະ ອົງການທຽບເທົ່າ','details' => $ministries,],
                    ['name' => 'ອົງການ ແລະ ພາກສ່ວນຕ່າງໆ','details' => $organisations,],
                    ['name' => 'ແຂວງ','details' => $provinces,],
                    ['name' => 'ເອກະສານປະເພດປຶ້ມ','details' => $books,]
                ]
            ])
        ]);
    }

    /**
     * Finds the StatDocument model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return StatDocument the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = StatDocument::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
}
