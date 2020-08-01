<?php
/**
 * Created by PhpStorm.
 * User: adsavin
 * Date: 4/24/18
 * Time: 9:49 PM
 */

namespace app\controllers;


use app\models\Ethnic;
use app\models\PhiscalYear;
use app\models\Province;
use app\models\StatEthnic;
use app\models\StatEthnicDetail;
use app\models\StatLocalAdmin;
use app\models\StatLocalAdminDetail;
use app\models\User;
use yii\web\BadRequestHttpException;
use yii\web\Controller;
use yii\web\Response;

class AppController extends Controller
{
    public function beforeAction($action)
    {
        \Yii::$app->response->format = Response::FORMAT_JSON;
        $this->enableCsrfValidation = false;
//        if ($action->id != 'login' && \Yii::$app->user->isGuest)
//            throw new UnauthorizedHttpException('Please Login', 401);

        return parent::beforeAction($action);
    }

    public function actionLogin()
    {
        if (!\Yii::$app->request->isPost)
            throw new \BadMethodCallException('Bad Request');

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

    public function actionInquiry($report, $year, $province = '')
    {
        $output = [
            'report' => $report,
            'province' => $province,
            'year' => $year
        ];
        $model = [];
        switch ($report) {
            case 'stat-local-admin':
                $model = StatLocalAdminDetail::find()->alias('d')->where([
                    'province_id' => $province,
                ])->join('left join', 'stat_local_admin s', 's.id = d.stat_local_admin_id and s.phiscal_year_id = :phiscal_year_id', [
                    ':phiscal_year_id' => $year
                ])->asArray()->one();
                if (!isset($model)) $model = $output;
                break;
            case 'stat-ethnic':
                $model = StatEthnicDetail::find()->alias('d')->where([
                    'province_id' => $province,
                ])->join('left join', 'stat_ethnic s', 's.id = d.stat_ethnic_id and s.phiscal_year_id = :phiscal_year_id', [
                    ':phiscal_year_id' => $year
                ])->asArray()->one();
                if (!isset($model)) $model = $output;
                break;
        }
        return $model;
    }

    public function actionGet($name)
    {
        switch ($name) {
            case 'ethnics':
                return Ethnic::find()->orderBy('position')->asArray()->all();
                break;
        }
    }

    public function actionSave($report, $year)
    {
        if (!\Yii::$app->request->isPost)
            throw new \BadMethodCallException('Bad Request');

        $post = \Yii::$app->request->post();
        if (!isset($post))
            throw new BadRequestHttpException('Bad Request');

        switch ($report) {
            case 'stat-local-admin':
                $master = StatLocalAdmin::find()->where(['phiscal_year_id' => $year])->one();
                if (!isset($master)) {
                    $master = new StatLocalAdmin();
                    $master->phiscal_year_id = $year;
                    $master->user_id = $post['user'];
                    $master->saved = 1;
                    $master->last_update = date('Y-m-d H:i:s');
                    if (!$master->save())
                        throw new BadRequestHttpException(json_encode($master->errors));
                }

                $model = StatLocalAdminDetail::find()->alias('d')
                    ->join('join', 'stat_local_admin s', 's.id = d.stat_local_admin_id and s.phiscal_year_id=:year', [
                        ':year' => $year
                    ])
                    ->where(['province_id' => $post['province']])
                    ->one();
                if (!isset($model)) {
                    $model = new StatLocalAdminDetail();
                    $model->stat_local_admin_id = $master->id;
                    $model->province_id = $post['province'];
                }

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
                    throw new BadRequestHttpException(json_encode($model->errors));

                break;
            case 'stat-ethnic':
                $master = StatEthnic::find()->where([
                    'phiscal_year_id' => $post['year']
                ])->one();
                if (!isset($master)) {
                    $master = new StatEthnic();
                    $master->phiscal_year_id = $post['year'];
                    $master->last_update = date('Y-m-d');
                    $master->saved = 1;
                    $master->user_id = $post['user'];
                    if (!$master->save())
                        throw new BadRequestHttpException(json_encode($master->errors));
                }

                $model = StatEthnicDetail::find()->alias('d')
                    ->join('left join', 'stat_ethnic_detail s', 'd.stat_ethnic_id = s.id and s.phiscal_year_id=:year', [
                        ':year' => $post['year']
                    ])
                    ->where([
                        'province_id' => $post['province']
                    ])->one();
                if (!isset($model)) {
                    $model = new StatEthnicDetail();
                    $model->stat_ethnic_id = $master->id;
                }
                if (isset($post['ethnic'])) $model->ethnic_id = $post['ethnic'];
                if (isset($post['province_id'])) $model->province_id = $post['province_id'];
                if (isset($post['total'])) $model->total = $post['total'];
                if (isset($post['women'])) $model->women = $post['women'];
                if (!$model->save())
                    throw new BadRequestHttpException(json_encode($model->errors));

                break;
        }
    }

    public function actionReport($name, $year)
    {
        $models = [];
        switch ($name) {
            case 'stat-local-admin':
                $models = Province::find()->alias('province')
                    ->select('d.*, province.*')
                    ->join('left join', 'stat_local_admin_detail d', 'province.id = d.province_id')
                    ->join('left join', 'stat_local_admin s', 's.id = d.stat_local_admin_id and s.phiscal_year_id=:year', [
                        ':year' => $year
                    ])
                    ->asArray()->all();
                break;
            case 'stat-officer-province':
                $models = Province::find()->alias('province')
                    ->select('d.*, province.*')
                    ->join('left join', 'stat_officer_province_detail d', 'province.id = d.province_id')
                    ->join('left join', 'stat_officer_province s', 's.id = d.stat_officer_province_id and s.phiscal_year_id=:year', [
                        ':year' => $year
                    ])
                    ->asArray()->all();
                break;
        }
        return $models;
    }
}