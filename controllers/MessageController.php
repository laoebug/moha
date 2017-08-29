<?php

namespace app\controllers;

use app\models\SourceMessage;
use Yii;
use app\models\Message;
use app\models\MessageSearch;
use yii\db\Exception;
use yii\helpers\Json;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use yii\web\Response;

/**
 * MessageController implements the CRUD actions for Message model.
 */
class MessageController extends Controller
{
    public function beforeAction($action)
    {
        $this->enableCsrfValidation = false;
        return parent::beforeAction($action); // TODO: Change the autogenerated stub
    }

    /**
     * @inheritdoc
     */
    public function behaviors()
    {
        return [
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'delete' => ['POST'],
                ],
            ],
        ];
    }

    /**
     * Lists all Message models.
     * @return mixed
     */
    public function actionIndex()
    {
        $searchModel = new MessageSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single Message model.
     * @param integer $id
     * @param string $language
     * @return mixed
     */
    public function actionView($id, $language)
    {
        return $this->render('view', [
            'model' => $this->findModel($id, $language),
        ]);
    }

    /**
     * Creates a new Message model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $model = new Message();
        $post = Yii::$app->request->post();
        if (!$model->load($post))
            return json_encode(["error" => "parse error"]);

        $db = Yii::$app->db->beginTransaction();
        try {
            $sourceMessage = new SourceMessage();
            $sourceMessage->message = $post["Message"]["message"];
            $sourceMessage->category = 'app';
            if(!$sourceMessage->save())
                throw new Exception(json_encode($sourceMessage->errors));

            $model->id = $sourceMessage->id;
            $model->language = "la-LA";
            if(!$model->save())
                return json_encode(["error" => $model->errors]);

            $model->id = "$model->id";
            $db->commit();
            return json_encode(["model" => array_merge($model->attributes, [
                "message" => $sourceMessage->message,
                "category" => $sourceMessage->category
            ])]);
        } catch (Exception $exception) {
            $db->rollBack();
            return json_encode(['error' => $exception->getTraceAsString()]);
        }
    }

    /**
     * Updates an existing Message model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @param string $language
     * @return mixed
     */
    public function actionUpdate($id, $language = "la-LA") {
        $model = $this->findModel($id, $language);
        $post = file_get_contents("php://input");
        $post = Json::decode($post);
        if (!$model->load($post))
            return json_encode(['error' => print_r($post, true)]);
        if(!$model->save())
            return json_encode(['error' => $model->errors]);

        return $this->render('update', [
            'model' => $model,
        ]);
    }

    public function actionTranslate() {
       return $this->render("translate");
    }

    public function actionGetall() {
        return json_encode(
            Message::find(["deleleted" => 0])
                ->select("*")
                ->join("join", "source_message s", "s.id = message.id")
            ->asArray()
            ->all());
    }

    /**
     * Deletes an existing Message model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @param string $language
     * @return mixed
     */
    public function actionDelete($id, $language = "la-LA")
    {
        if(!$this->findModel($id, $language)->delete())
            return json_encode(["error" => Yii::t('app','Cannot Delete')]);
        else return json_encode(["message" => "OK"]);
    }

    /**
     * Finds the Message model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @param string $language
     * @return Message the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id, $language)
    {
        if (($model = Message::findOne(['id' => $id, 'language' => $language])) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
}
