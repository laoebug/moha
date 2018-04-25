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
use app\models\StatLocalAdminDetail;
use app\models\User;
use yii\web\BadRequestHttpException;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\web\Response;

class AppController extends Controller
{
    public function beforeAction($action)
    {
        \Yii::$app->response->format = Response::FORMAT_JSON;
        $this->enableCsrfValidation = false;
//        if ($action->id != 'login' && \Yii::$app->user->isGuest)
//            throw new UnauthorizedHttpException("Please Login", 401);

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
            throw new BadRequestHttpException('Incorrect Username');

        if ($user['password'] !== $post['password'])
            throw new BadRequestHttpException('Incorrect Password');

        $user->password = null;
        \Yii::$app->user->login($user, 0);
        return [
            'user' => $user,
            'provinces' => Province::find()->asArray()->all(),
            'years' => PhiscalYear::find()->asArray()->all()
        ];
    }

    public function actionInquiry($report, $year, $province = "")
    {
        print_r(\Yii::$app->request->headers);
        exit;
        $model = [
            "report" => $report,
            "province" => $province,
            "year" => $year
        ];
        switch ($report) {
            case "stat-local-admin":
                $model = StatLocalAdminDetail::find()->alias("d")->where([
                    "province_id" => $province,
                ])->join("left join", "stat_local_admin s", "s.id = d.stat_local_admin_id and s.phiscal_year_id = :phiscal_year_id", [
                    ":phiscal_year_id" => $year
                ])->asArray()->all();
                break;
        }
        return $model;
    }

    public function actionSave($report, $year)
    {
        if (!\Yii::$app->request->isPost)
            throw new \BadMethodCallException("Bad Request");

        $post = \Yii::$app->request->post();
        if (!isset($post))
            throw new BadRequestHttpException('Bad Request');

        switch ($report) {
            case "stat_local_admin":
                $model = StatLocalAdminDetail::find()->alias('d')
                    ->join('join', 'stat_local_admin s', 's.id = d.stat_local_admin_id and s.phiscal_year_id=:year', [
                        ':year' => $year
                    ])
                    ->where(['province_id' => $post['province']])
                    ->one();

                if (!isset($model))
                    throw new NotFoundHttpException();

                $model->province_head_total = $post['province_head']['total'];
                $model->province_head_women = $post['province_head']['women'];
                $model->province_vice_total = $post['province_vice']['total'];
                $model->province_vice_women = $post['province_vice']['women'];

                $model->district_head_total = $post['district_head']['total'];
                $model->district_head_women = $post['district_head']['women'];
                $model->district_vice_total = $post['district_vice']['total'];
                $model->district_vice_women = $post['district_vice']['women'];

                $model->village_head_total = $post['village_head']['total'];
                $model->village_head_women = $post['village_head']['women'];
                $model->village_vice_total = $post['village_vice']['total'];
                $model->village_vice_women = $post['village_vice']['women'];

                $model->population_total = $post['population']['total'];
                $model->population_women = $post['population']['women'];
                $model->village = $post['village'];
                $model->family_total = $post['family']['total'];
                $model->family_poor = $post['family']['poor'];
                if (!$model->save())
                    throw new \Exception(json_encode($model->errors));

                break;
        }
    }
}