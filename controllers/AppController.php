<?php
/**
 * Created by PhpStorm.
 * User: adsavin
 * Date: 4/24/18
 * Time: 9:49 PM
 */

namespace app\controllers;


use app\models\PhiscalYear;
use app\models\Province;
use app\models\User;
use yii\db\Exception;
use yii\web\BadRequestHttpException;
use yii\web\Controller;
use yii\web\Response;

class AppController extends Controller
{
    public $enableCsrfValidation = false;

    public function beforeAction($action)
    {
        \Yii::$app->response->format = Response::FORMAT_JSON;
        return parent::beforeAction($action);
    }

    public function actionLogin()
    {
        if (!\Yii::$app->request->isPost)
            throw new \BadMethodCallException("Bad Request");

        $post = \Yii::$app->request->post();
        if (!isset($post))
            throw new BadRequestHttpException('Bad Request');

        $user = User::find()->where([
            'username' => $post['username']
        ])->one();

        if (!isset($user))
            throw new Exception('Incorrect Username');

        if ($user['password'] !== $post['password'])
            throw new Exception('Incorrect Password');

        $user['password'] = null;
        \Yii::$app->response->statusCode = 200;
        return [
            'user' => $user,
            'provinces' => Province::find()->asArray()->all(),
            'years' => PhiscalYear::find()->asArray()->all()
        ];
    }
}