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
// use yii\base\Controller;
use yii\base\Exception;
use yii\helpers\ArrayHelper;
use Yii;
use app\services\AuthenticationService;
use yii\web\Controller;


class ReportController extends Controller {
	public function actionIndex_Old() {
		$searchModel = new MenuSearch ();
		$dataProvider = $searchModel->search ( \Yii::$app->request->queryParams );
		$dataProvider->query->where ( 'url is not null and menu_parent_id <> 0' );
		
		return $this->render ( 'index', [ 
				'searchModel' => $searchModel,
				'dataProvider' => $dataProvider 
		] );
	}
	public function actionComplete($year = null) {
		$user = Yii::$app->user->identity;
	
// 		$controller_id = Yii::$app->controller->id;
// 		$acton_id = Yii::$app->controller->action->id;
// 		if ($user->role ["name"] != Yii::$app->params ['DEFAULT_ADMIN_ROLE']) {
// 			$controller_id = Yii::$app->controller->id;
// 			$acton_id = Yii::$app->controller->action->id;
// 			if (!AuthenticationService::isAccessibleAction($controller_id, $acton_id)) {
// 				return $this->redirect([
// 						'authentication/notallowed'
// 				]);
// 			}
// 		}
		$years = PhiscalYear::find ()->all ();
		$menus = [ ];
		$reports = [ ];
	
		if (isset ( $year )) {
			$menus = Menu::find ()->select ( 'table_name, name, url' )->distinct ( true )->where ( [
					"table_name is not null and table_name like 'stat_%' and id in (select menu_id from role_has_menu where role_id=".$user->role_id .")"
			] )->all ();
			foreach ( $menus as $menu ) {
				try {
					$sql = "select id from " . $menu ['table_name'] . " where phiscal_year_id=:year";
					$tables = \Yii::$app->db->createCommand ( $sql )->queryAll ();
					foreach ( $tables as $table ) {
						$details = $table [$menu ['table_name'] . '_detail'];
						foreach ( $details as $detail )
							foreach ( $detail as $column )
								if (! isset ( $column ))
									$reports [] = $menu ['table_name'];
					}
				} catch ( Exception $ex ) {
					\Yii::$app->session->setFlash ( 'danger', $ex->getMessage () );
				}
			}
		} else {
			foreach ( $years as $y ) {
				$reports [$y->year] = [ ];
				$menus = Menu::find ()->select ( 'table_name, name, url' )->distinct ( true )->where ( "table_name is not null and table_name like 'stat_%' and id in (select menu_id from role_has_menu where role_id=".$user->role_id .") " )->all ();
				foreach ( $menus as $menu ) {
					try {
						if (in_array ( $menu ['table_name'], $reports [$y->year] ))
							continue;
							$sql = "select d.* from " . $menu ['table_name'] . " t right join " . $menu ['table_name'] . "_detail d on t.id = d." . $menu ['table_name'] . "_id where phiscal_year_id=" . $y->id;
	
							$tables = \Yii::$app->db->createCommand ( $sql )->queryAll ();
							foreach ( $tables as $details ) {
								foreach ( $details as $d => $detail ) {
									if (in_array ( $menu ['table_name'], ArrayHelper::map ( $reports [$y->year], 'table', 'table' ) ))
										continue;
										if (in_array ( $d, [
												'id',
												'name'
										] ))
											continue;
											if ($detail != "") {
												$reports [$y->year] [] = [
														'name' => $menu ['name'],
														'table' => $menu ['table_name'],
														'url' => $menu ['url']
												];
												break;
											}
								}
							}
					} catch ( Exception $ex ) {
						// \Yii::$app->session->setFlash('danger', $ex->getMessage());
					}
				}
			}
		}
		return $this->render ( 'complete', [
				'years' => $years,
				'reports' => $reports
		] );
	}
	
	public function actionIncomplete($year = null) {
		$user = Yii::$app->user->identity;
// 		$controller_id = Yii::$app->controller->id;
// 		$acton_id = Yii::$app->controller->action->id;
// 		if ($user->role ["name"] != Yii::$app->params ['DEFAULT_ADMIN_ROLE']) {
// 			$controller_id = Yii::$app->controller->id;
// 			$acton_id = Yii::$app->controller->action->id;
// 			if (!AuthenticationService::isAccessibleAction($controller_id, $acton_id)) {
// 				return $this->redirect([
// 						'authentication/notallowed'
// 				]);
// 			}
// 		}
		$years = PhiscalYear::find ()->all ();
		$menus = [ ];
		$reports = [ ];
		
		if (isset ( $year )) {
			$menus = Menu::find ()->select ( 'table_name, name, url' )->distinct ( true )->where ( [ 
					"table_name is not null and table_name like 'stat_%' and id in (select menu_id from role_has_menu where role_id=".$user->role_id .")" 
			] )->all ();
			foreach ( $menus as $menu ) {
				try {
					$sql = "select id from " . $menu ['table_name'] . " where phiscal_year_id=:year";
					$tables = \Yii::$app->db->createCommand ( $sql )->queryAll ();
					foreach ( $tables as $table ) {
						$details = $table [$menu ['table_name'] . '_detail'];
						foreach ( $details as $detail )
							foreach ( $detail as $column )
								if (! isset ( $column ))
									$reports [] = $menu ['table_name'];
					}
				} catch ( Exception $ex ) {
					\Yii::$app->session->setFlash ( 'danger', $ex->getMessage () );
				}
			}
		} else {
			foreach ( $years as $y ) {
				$reports [$y->year] = [ ];
				$menus = Menu::find ()->select ( 'table_name, name, url' )->distinct ( true )->where ( "table_name is not null and table_name like 'stat_%' and id in (select menu_id from role_has_menu where role_id=".$user->role_id .") " )->all ();
				foreach ( $menus as $menu ) {
					try {
						if (in_array ( $menu ['table_name'], $reports [$y->year] ))
							continue;
						$sql = "select d.* from " . $menu ['table_name'] . " t right join " . $menu ['table_name'] . "_detail d on t.id = d." . $menu ['table_name'] . "_id where phiscal_year_id=" . $y->id;
						
						$tables = \Yii::$app->db->createCommand ( $sql )->queryAll ();
						foreach ( $tables as $details ) {
							foreach ( $details as $d => $detail ) {
								if (in_array ( $menu ['table_name'], ArrayHelper::map ( $reports [$y->year], 'table', 'table' ) ))
									continue;
								if (in_array ( $d, [ 
										'id',
										'name' 
								] ))
									continue;
								if ($detail == "") {
									$reports [$y->year] [] = [ 
											'name' => $menu ['name'],
											'table' => $menu ['table_name'],
											'url' => $menu ['url'] 
									];
									break;
								}
							}
						}
					} catch ( Exception $ex ) {
						// \Yii::$app->session->setFlash('danger', $ex->getMessage());
					}
				}
			}
		}
		return $this->render ( 'incomplete', [ 
				'years' => $years,
				'reports' => $reports 
		] );
	}
	public function actionIndex() {
		$user = Yii::$app->user->identity;
// 	    $controller_id = Yii::$app->controller->id;
//     	$acton_id = Yii::$app->controller->action->id;
// 	    if ($user->role ["name"] != Yii::$app->params ['DEFAULT_ADMIN_ROLE']) {
//             $controller_id = Yii::$app->controller->id;
//             $acton_id = Yii::$app->controller->action->id;
//             if (!AuthenticationService::isAccessibleAction($controller_id, $acton_id)) {
//                 return $this->redirect([
//                     'authentication/notallowed'
//                 ]);
//             }
//         }
		define ( "DEPARTMENT_FLAG", 3 ); // refers to menu_parent_id in which value =3
		define ( "DELETED", 0 );
		define ( "ACCESSIBLE", 1 );
		
		if ($user->role ["name"] != Yii::$app->params ['DEFAULT_ADMIN_ROLE']) {

			$sql = " select o.* from ( select rp.*,dept.dept_id,dept.department_name from (select * from menu where id not in (select id from menu where menu_parent_id=:menu_parent_id) ";
			$sql .= " and menu_parent_id in (select id from menu where menu_parent_id=:menu_parent_id) and deleted=:deleted) rp ";
			$sql .= " left join (select id as dept_id,name as department_name from menu where menu_parent_id=:menu_parent_id) dept ";
			$sql .= " on rp.menu_parent_id=dept.dept_id )  o ";
			$sql .= " where o.id in (select menu_id from role_has_menu rhm where rhm.role_id=:role_id and rhm.accessible=:accessible)";
			$params = [
					':menu_parent_id' => DEPARTMENT_FLAG,
					':deleted' => DELETED,
					':role_id' => $user->role_id,
					':accessible' => ACCESSIBLE
					
			];
			
		} else {
			
			$sql = " select rp.*,dept.dept_id,dept.department_name from (select * from menu where id not in (select id from menu where menu_parent_id=:menu_parent_id) ";
			$sql .= " and menu_parent_id in (select id from menu where menu_parent_id=:menu_parent_id) and deleted=:deleted) rp ";
			$sql .= " left join (select id as dept_id,name as department_name from menu where menu_parent_id=:menu_parent_id) dept ";
			$sql .= " on rp.menu_parent_id=dept.dept_id ";
			
			$params = [ 
					':menu_parent_id' => DEPARTMENT_FLAG,
					':deleted' => DELETED 
			];
		}
		$models = Menu::findBySql ( $sql, $params )->all ();
		
		return $this->render ( 'searchReport', [ 
				'models' => $models 
		] );
	}
}