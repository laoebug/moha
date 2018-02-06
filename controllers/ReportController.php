<?php
/**
 * Created by PhpStorm.
 * User: adsavin
 * Date: 2/3/18
 * Time: 3:11 PM
 */

namespace app\controllers;


use app\models\Menu;
use app\models\MenuSearch;
use app\models\PhiscalYear;
use yii\base\Controller;
use yii\base\Exception;

class ReportController extends Controller
{
    public function actionIndex()
    {
        $searchModel = new MenuSearch();
        $dataProvider = $searchModel->search(\Yii::$app->request->queryParams);
        $dataProvider->query->where('url is not null and menu_parent_id <> 0');

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    public function actionIncomplete($year = null)
    {
        $years = PhiscalYear::find()->all();
        $menus = [];
        $reports = [];
        if (isset($year)) {
            $menus = Menu::find()->select('distinct table_name')
                ->all();

            foreach ($menus as $menu) {
                try {
                    $sql = "select id from " . $menu['table_name'] . " where phiscal_year_id=:year";
                    $tables = \Yii::$app->db->createCommand($sql)->queryAll();
                    print_r($tables);
                    exit;
                    foreach ($tables as $table) {
                        print_r($table);
                        $details = $table[$menu['table_name'] . '_detail'];
                        foreach ($details as $detail)
                            foreach ($detail as $column)
                                if (!isset($column))
                                    $reports[] = $menu['table_name'];

                    }
                } catch (Exception $ex) {

                }
            }
        }
        return $this->render('incomplete', [
            'years' => $years,
            'menus' => $menus,
            'reports' => $reports
        ]);
    }
}