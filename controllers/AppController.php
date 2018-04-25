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
use app\models\StatLocalAdmin;
use app\models\User;
use yii\db\Exception;
use yii\web\BadRequestHttpException;
use yii\web\Controller;
use yii\web\Response;

class AppController extends Controller
{
    public function beforeAction($action)
    {
        \Yii::$app->response->format = Response::FORMAT_JSON;
        $this->enableCsrfValidation = false;
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

        $user->password = null;
        \Yii::$app->user->login($user, 0);
        \Yii::$app->response->statusCode = 200;
        return [
            'user' => $user,
            'provinces' => Province::find()->asArray()->all(),
            'years' => PhiscalYear::find()->asArray()->all()
        ];
    }

    public function actionInquiry($report, $province, $year)
    {
        $model = [
            "report" => $report,
            "province" => $province,
            "year" => $year
        ];
        return "OK";
        exit;
        switch ($report) {
            case "stat-local-admin":
                $model = StatLocalAdmin::find()->alias("s")->where([
                    "phiscal_year_id" => $year,
                ])->join("join", "stat_local_admin_detail d", "s.id = d.stat_local_admin_id and d.province_id = :povince", [
                    ":province" => $province
                ])
                    ->asArray()->all();
                break;
        }
        \Yii::$app->response->statusCode = 200;
        return $model;
    }
}