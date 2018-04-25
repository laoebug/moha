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
                ])->asArray()->one();
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
            case "stat-local-admin":
                $model = StatLocalAdminDetail::find()->alias('d')
                    ->join('join', 'stat_local_admin s', 's.id = d.stat_local_admin_id and s.phiscal_year_id=:year', [
                        ':year' => $year
                    ])
                    ->where(['province_id' => $post['province']])
                    ->one();
                if (!isset($model))
                    throw new NotFoundHttpException();

                if (isset($post['province_head_total'])) $model->province_head_total = $post['province_head_total'];
                if (isset($post['province_head_women'])) $model->province_head_women = $post['province_head_women'];
                if (isset($post['province_vice_total'])) $model->province_vice_total = $post['province_vice_total'];
                if (isset($post['province_vice_women'])) $model->province_vice_women = $post['province_vice_women'];

                if (isset($post['district_head_total'])) $model->district_head_total = $post['district_head_total'];
                if (isset($post['district_head_women'])) $model->district_head_women = $post['district_head_women'];
                if (isset($post['district_vice_total'])) $model->district_vice_total = $post['district_vice_total'];
                if (isset($post['district_vice_women'])) $model->district_vice_women = $post['district_vice_women'];

                if (isset($post['village_head_total'])) $model->village_head_total = $post['village_head_total'];
                if (isset($post['village_head_women'])) $model->village_head_women = $post['village_head_women'];
                if (isset($post['village_vice_total'])) $model->village_vice_total = $post['village_vice_total'];
                if (isset($post['village_vice_women'])) $model->village_vice_women = $post['village_vice_women'];

                if (isset($post['population_total'])) $model->population_total = $post['population_total'];
                if (isset($post['population_women'])) $model->population_women = $post['population_women'];

                if (isset($post['village'])) $model->village = $post['village'];

                if (isset($post['family_total'])) $model->family_total = $post['family_total'];
                if (isset($post['family_poor'])) $model->family_poor = $post['family_poor'];

                if (!$model->save())
                    throw new \HttpRuntimeException(json_encode($model->getFirstErrors()));

                break;
        }
    }

    public function actionReport($name, $year = "")
    {
        $models = [];
        $year = $year == "" ? date("Y") : $year;
        switch ($name) {
            case 'stat-local-admin':
                $models = Province::find()->alias('p')
                    ->select('d.*, p.*')
                    ->join('left join', 'stat_local_admin_detail d', 'p.id = d.province_id')
                    ->join('left join', 'stat_local_admin s', 's.id = d.stat_local_admin_id and s.phiscal_year_id=:year', [
                        ':year' => $year
                    ])
                    ->orderBy('p.id')
                    ->asArray()->all();
                break;
        }
        return $models;
    }
}