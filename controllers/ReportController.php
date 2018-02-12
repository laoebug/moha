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

class ReportController extends Controller {
	public function actionIndex() {
		$searchModel = new MenuSearch ();
		$dataProvider = $searchModel->search ( \Yii::$app->request->queryParams );
		$dataProvider->query->where ( 'url is not null and menu_parent_id <> 0' );
		
		return $this->render ( 'index', [ 
				'searchModel' => $searchModel,
				'dataProvider' => $dataProvider 
		] );
	}
	public function actionIncomplete($year = null) {
		$years = PhiscalYear::find ()->all ();
		$menus = [ ];
		$reports = [ ];
		if (isset ( $year )) {
			$menus = Menu::find ()->select ( 'distinct table_name' )->all ();
			
			foreach ( $menus as $menu ) {
				try {
					$sql = "select id from " . $menu ['table_name'] . " where phiscal_year_id=:year";
					$tables = \Yii::$app->db->createCommand ( $sql )->queryAll ();
					print_r ( $tables );
					exit ();
					foreach ( $tables as $table ) {
						print_r ( $table );
						$details = $table [$menu ['table_name'] . '_detail'];
						foreach ( $details as $detail )
							foreach ( $detail as $column )
								if (! isset ( $column ))
									$reports [] = $menu ['table_name'];
					}
				} catch ( Exception $ex ) {
				}
			}
		}
		return $this->render ( 'incomplete', [ 
				'years' => $years,
				'menus' => $menus,
				'reports' => $reports 
		] );
	}
	public function actionSearchreport() {
		
		define ( "DEPARTMENT_FLAG", 3 ); // refers to menu_parent_id in which value =3 
		define ( "DELETED", 0 );
		$models = Menu::find ()->all ();
		$sql = " select rp.*,dept.dept_id,dept.department_name from (select * from menu where id not in (select id from menu where menu_parent_id=:menu_parent_id) ";
		$sql .= " and menu_parent_id in (select id from menu where menu_parent_id=:menu_parent_id) and deleted=:deleted) rp ";
		$sql .= " left join (select id as dept_id,name as department_name from menu where menu_parent_id=:menu_parent_id) dept ";
		$sql .= " on rp.menu_parent_id=dept.dept_id ";		
		$params = [ 
				':menu_parent_id' => DEPARTMENT_FLAG,
				':menu_parent_id' => DEPARTMENT_FLAG,
				':deleted' => DELETED,
				':menu_parent_id' => DEPARTMENT_FLAG 
		];		
		$models = Menu::findBySql ( $sql, $params )->all ();
		
		return $this->render ( 'searchReport', [ 
				'models' => $models 
		] );
	}
}