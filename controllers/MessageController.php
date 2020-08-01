<?php

namespace app\controllers;

use app\components\MyHelper;
use app\models\Message;
use app\models\SourceMessage;
use app\services\AuthenticationService;
use Codeception\Util\HttpCode;
use Yii;
use yii\db\Exception;
use yii\filters\VerbFilter;
use yii\web\Controller;
use yii\web\NotFoundHttpException;

/**
 * MessageController implements the CRUD actions for Message model.
 */
class MessageController extends Controller
{

    public function beforeAction($action)
    {
        $user = Yii::$app->user->identity;
        $this->enableCsrfValidation = false;
        $controller_id = Yii::$app->controller->id;
        $acton_id = Yii::$app->controller->action->id;
        if ($user->role["name"] != Yii::$app->params['DEFAULT_ADMIN_ROLE']) {
            if (!AuthenticationService::isAccessibleAction($controller_id, $acton_id)) {

                return $this->redirect([
                    'authentication/notallowed'
                ]);
            }
        }

        return parent::beforeAction($action);
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
        return $this->render("index");
    }

    /**
     * Creates a new Message model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
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

        $model = new Message();
        $post = Yii::$app->request->post();
        if (!$model->load($post))
            return json_encode(["error" => Yii::t('app', 'Parse Error') . " " . json_encode($post)]);

        $db = Yii::$app->db->beginTransaction();
        try {
            $sourceMessage = new SourceMessage();
            $sourceMessage->message = $post["Message"]["message"];
            $sourceMessage->category = 'app';
            if (!$sourceMessage->save())
                throw new Exception(json_encode($sourceMessage->errors));

            $model->id = $sourceMessage->id;
            $model->language = "la-LA";
            if (!$model->save())
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
    public function actionUpdate($id, $language = "la-LA")
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

        $model = $this->findModel($id, $language);
        $post = Yii::$app->request->post();
        if (!$model->load($post))
            return json_encode(['error' => print_r($post, true)]);

        if (!$model->save())
            return json_encode(['error' => $model->errors]);

        return json_encode(["model" => $model->attributes]);
    }

    public function actionGetall()
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

        return json_encode(
            Message::find()
                ->select("s.id, s.message, translation")
                ->join("join", "source_message s", "s.id = message.id")
                ->asArray()
                ->all()
        );
    }

    /**
     * Deletes an existing Message model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @param string $language
     * @return mixed
     */
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
            if (!$this->findModel($post['id'], 'la-LA')->delete())
                return json_encode(["error" => Yii::t('app', 'Cannot Delete')]);
            else
                return json_encode(["message" => "OK"]);
        } else
            return json_encode(["error" => Yii::t('app', 'Incorrect Requested')]);
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
