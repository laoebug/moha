<?php

namespace app\controllers;

use app\models\Action;
use app\models\Branch;
use app\models\Menu;
use app\models\Province;
use app\models\Role;
use app\models\RoleHasAction;
use app\models\RoleHasMenu;
use app\models\User;
use app\models\UserHasBranch;
use app\models\UserHasProvince;
use app\models\UserSearch;
use app\models\UserSubordinate;
use app\services\AuthenticationService;
use Yii;
use yii\db\Exception;
use yii\filters\VerbFilter;
use yii\web\Controller;
use yii\web\NotFoundHttpException;

/**
 * UserController implements the CRUD actions for User model.
 */
class UserController extends Controller {
	
	/**
	 * @inheritdoc
	 */
	public function behaviors() {
		return [ 
				'verbs' => [ 
						'class' => VerbFilter::className (),
						'actions' => [ 
								'delete' => [ 
										'POST' 
								] 
						] 
				] 
		];
	}
	
	/**
	 * Lists all User models.
	 *
	 * @return mixed
	 */
	public function actionIndex() {
		$user = Yii::$app->user->identity;
		if ($user->role ["name"] != Yii::$app->params ['DEFAULT_ADMIN_ROLE']) {
			$controller_id = Yii::$app->controller->id;
			$acton_id = Yii::$app->controller->action->id;
			if (! AuthenticationService::isAccessibleAction ( $controller_id, $acton_id )) {
				return $this->redirect ( [ 
						'authentication/notallowed' 
				] );
			}
		}
		$searchModel = new UserSearch ();
		$dataProvider = $searchModel->search ( Yii::$app->request->queryParams );
		
		return $this->render ( 'index', [ 
				'searchModel' => $searchModel,
				'dataProvider' => $dataProvider 
		] );
	}
	public function actionManageuser() {
		$user = Yii::$app->user->identity;
		if ($user->role ["name"] != Yii::$app->params ['DEFAULT_ADMIN_ROLE']) {
			$controller_id = Yii::$app->controller->id;
			$acton_id = Yii::$app->controller->action->id;
			if (! AuthenticationService::isAccessibleAction ( $controller_id, $acton_id )) {
				return $this->redirect ( [ 
						'authentication/notallowed' 
				] );
			}
		}
		
		$model = new User ();
		$id = "";
		$pasword = "";
		if (! empty ( $_POST ['User'] ['id'] )) {
			$id = $_POST ['User'] ['id'];
			$model = User::findOne ( $id );
			$pasword = $model->password;
		}
		$model->user_id = $user->id;
		if (! empty ( $_POST ['User'] ['province_id'] )) {
			$model->province_id = $_POST ['User'] ['province_id'];
		} else {
			$model->province_id = "";
		}
		
		// if (Yii::$app->request->post ( 'btnSave' )) {
		
		// echo "KO";
		// exit ();
		// }
		
		if ($model->load ( Yii::$app->request->post () )) {
			
			if (! empty ( $_POST ['User'] ['password'] )) {
				$model->password = $_POST ['User'] ['password'];
			} else {
				$model->password = $pasword;
			}
			$delete = false;
			if (Yii::$app->request->post ( 'btnDelete' )) {
				if (! isset ( $model->id ) || $model->id == '' || $model->id == null) {
					$model->addError ( 'username', Yii::t ( 'app', 'Please select user to delelete' ) );
				} else {
					
					$role = Role::find ()->where ( [ 
							'id' => $model->role_id 
					] )->one ();
					
					if ($role ["name"] == Yii::$app->params ['DEFAULT_ADMIN_ROLE']) {
						// Yii::$app->session->setFlash ( 'danger', 'User with role '. Yii::$app->params ['DEFAULT_ADMIN_ROLE']. ' is not allowed to be deleted' );
					} else {
						$model->deleted = 1;
						$delete = true;
					}
				}
			}
			
			if ($model->validate ()) {
				
				try {
					$db = Yii::$app->db->beginTransaction ();
					if (! $model->save ())
						throw new Exception ( "User cannot be saved" );
					
					$db->commit ();
					$msg = "User has been saved successfully";
					if ($delete) {
						$msg = "User has been deleted successfully";
					}
					Yii::$app->session->setFlash ( 'success', $msg );
				} catch ( Exception $ex ) {
					$db->rollBack ();
					Yii::$app->session->setFlash ( 'error', "User cannot be saved" . $ex );
				}
			}
		}
		$models = User::find ()->where ( [ 
				'deleted' => 0 
		] )->all ();
		return $this->render ( 'manageUser', [ 
				'models' => $models,
				'model' => $model 
		] );
	}
	public function actionListmenu() {
		$user = Yii::$app->user->identity;
		if ($user->role ["name"] != Yii::$app->params ['DEFAULT_ADMIN_ROLE']) {
			$controller_id = Yii::$app->controller->id;
			$acton_id = Yii::$app->controller->action->id;
			if (! AuthenticationService::isAccessibleAction ( $controller_id, $acton_id )) {
				return $this->redirect ( [ 
						'authentication/notallowed' 
				] );
			}
		}
		
		$menuList = array ();
		if (Yii::$app->request->isAjax) {
			$data = Yii::$app->request->post ();
			
			try {
				$sql_menu = "";
				$params = [ ];
				
				$role = Role::findOne ( ( int ) $data ["role_id"] );
				if ($role->is_province == 1) {
					$menuIds = [ ];
					$connection = Yii::$app->db;
					$sql = " select a.id,menu_parent_id from menu a where a.deleted=:deleted AND has_province=:has_province; ";
					$params = [ 
							':deleted' => 0,
							':has_province' => 1 
					];
					$command = $connection->createCommand ( $sql )->bindValues ( $params );
					$results = $command->queryAll ();
					foreach ( $results as $row ) {
						$menuIds [] = $row ["id"];
						$menuId_result = Menu::getMenuIdByParentId ( $row ['menu_parent_id'] );
						$menuIds = array_merge ( $menuId_result, $menuIds );
					}
					
					$sql_menu = " select ";
					$sql_menu .= " ifnull((select menu_id from role_has_menu where role_id=:role_id and menu_id=a.id),0) as menu_id, ";
					$sql_menu .= " ifnull((select role_id from role_has_menu where role_id=:role_id and menu_id=a.id),0) as role_id, ";
					$sql_menu .= " a.* from menu a";
					$sql_menu .= " where a.id  IN(" . implode ( ',', $menuIds ) . ") and a.deleted=:deleted ";
					$sql_menu .= " order by a.position ";
					$params = [ 
							':role_id' => $data ["role_id"],
							':role_id' => $data ["role_id"],
							':deleted' => 0 
					];
				} else {
					$sql_menu = " select ";
					$sql_menu .= " ifnull((select menu_id from role_has_menu where role_id=:role_id and menu_id=a.id),0) as menu_id, ";
					$sql_menu .= " ifnull((select role_id from role_has_menu where role_id=:role_id and menu_id=a.id),0) as role_id, ";
					$sql_menu .= " a.* from menu a";
					$sql_menu .= " where a.deleted=:deleted ";
					$sql_menu .= " order by a.position ";
					$params = [ 
							':role_id' => $data ["role_id"],
							':role_id' => $data ["role_id"],
							':deleted' => 0 
					];
				}
				
				$menus = Menu::findBySql ( $sql_menu, $params )->all ();
				
				if (count ( $menus ) > 0) {
					foreach ( $menus as $menu ) {
						
						$menuList [$menu ['id']] = array (
								"menu_parent_id" => $menu ['menu_parent_id'],
								"id" => $menu ['id'],
								"menu_id" => $menu ['menu_id'],
								"name" => $menu ['name'],
								"role_id" => $menu ['role_id'] 
						);
					}
					
					echo Yii::$app->controller->renderPartial ( "_menuItemList", [ 
							"menuList" => $menuList,
							'role' => Role::findOne ( $data ["role_id"] ) 
					] );
				}
			} catch ( Exception $e ) {
				Yii::$app->session->setFlash ( 'danger', "Menu could not be retrieved" );
			}
		}
	}
	public function actionListaction() {
		$user = Yii::$app->user->identity;
		if ($user->role ["name"] != Yii::$app->params ['DEFAULT_ADMIN_ROLE']) {
			$controller_id = Yii::$app->controller->id;
			$acton_id = Yii::$app->controller->action->id;
			if (! AuthenticationService::isAccessibleAction ( $controller_id, $acton_id )) {
				return $this->redirect ( [ 
						'authentication/notallowed' 
				] );
			}
		}
		
		$actionList = array ();
		if (Yii::$app->request->isAjax) {
			$data = Yii::$app->request->post ();
			try {
				
				$sql_action = " select ";
				$sql_action .= " ifnull((select role_id from role_has_action where role_id=:role_id and action_id=a.id),0) as role_id, ";
				$sql_action .= "  ifnull((select action_id from role_has_action where role_id=:role_id and action_id=a.id),0) as action_id,";
				$sql_action .= "  a.* from action a ";
				$sql_action .= " where a.deleted=:deleted ";
				
				$params = [ 
						':role_id' => $data ["role_id"],
						':role_id' => $data ["role_id"],
						':deleted' => 0 
				];
				
				$actions = Action::findBySql ( $sql_action, $params )->all ();
				
				if (count ( $actions ) > 0) {
					
					foreach ( $actions as $action ) {
						
						$actionList [$action ['id']] = [ 
								
								"parent_id" => $action ['parent_id'],
								"id" => $action ['id'],
								"role_id" => $action ['role_id'],
								"action_id" => $action ['action_id'],
								"name" => $action ['description'],
								"method" => $action ['method'] 
						];
					}
					
					echo Yii::$app->controller->renderPartial ( "_actionItemList", [ 
							"actionList" => $actionList,
							'role' => Role::findOne ( $data ["role_id"] ) 
					] );
				}
			} catch ( Exception $e ) {
				Yii::$app->session->setFlash ( 'danger', "Action(s) could not be retrieved" );
			}
		}
	}
	public function actionManagerole() {
		$user = Yii::$app->user->identity;
		if ($user->role ["name"] != Yii::$app->params ['DEFAULT_ADMIN_ROLE']) {
			$controller_id = Yii::$app->controller->id;
			$acton_id = Yii::$app->controller->action->id;
			
			if (! AuthenticationService::isAccessibleAction ( $controller_id, $acton_id )) {
				return $this->redirect ( [ 
						'authentication/notallowed' 
				] );
			}
		}
		
		$model = new Role ();
		$menuList = [ ];
		// $models = Role::findAll(['deleted'=>0]);
		$models = Role::find ()->where ( 'deleted=:deleted' )->addParams ( [ 
				':deleted' => 0 
		] )->all ();
		
		return $this->render ( 'manageRole', [ 
				'models' => $models,
				'model' => $model,
				'menuList' => $menuList 
		] );
	}
	public function actionAddrole() {
		$user = Yii::$app->user->identity;
		if ($user->role ["name"] != Yii::$app->params ['DEFAULT_ADMIN_ROLE']) {
			$controller_id = Yii::$app->controller->id;
			$acton_id = Yii::$app->controller->action->id;
			if (! AuthenticationService::isAccessibleAction ( $controller_id, $acton_id )) {
				return $this->redirect ( [ 
						'authentication/notallowed' 
				] );
			}
		}
		
		$model = new Role ();
		
		if (Yii::$app->request->isAjax) {
			$data = Yii::$app->request->post ();
			$model->name = $data ["role_name"];
			$model->is_province = $data ["is_province"];
			$model->user_id = $user->id;
			$model->deleted = 0;
			if ($model->validate ()) {
				if ($model->save ()) {
					Yii::$app->session->setFlash ( "success", "Role has been added successfully" );
				} else {
					Yii::$app->session->setFlash ( "danger", "Role cannot be added" );
				}
			} else {
				$errmsg = "";
				foreach ( $model->getErrors () as $attribute => $errors ) {
					foreach ( $errors as $error ) {
						$errmsg .= $error ? $error : "";
					}
				}
				Yii::$app->session->setFlash ( "danger", $errmsg );
			}
		}
	}
	public function actionUpdaterole() {
		$user = Yii::$app->user->identity;
		if ($user->role ["name"] != Yii::$app->params ['DEFAULT_ADMIN_ROLE']) {
			$controller_id = Yii::$app->controller->id;
			$acton_id = Yii::$app->controller->action->id;
			if (! AuthenticationService::isAccessibleAction ( $controller_id, $acton_id )) {
				return $this->redirect ( [ 
						'authentication/notallowed' 
				] );
			}
		}
		
		if (Yii::$app->request->isAjax) {
			$id = $_POST ["id"];
			$model = Role::findOne ( $id );
			$model->name = $_POST ["role_name"];
			$model->user_id = $user->id;
			$model->is_province = $_POST ["is_province"];
			if ($model->save ()) {
				Yii::$app->session->setFlash ( "success", "Role has been update successfully" );
			} else {
				Yii::$app->session->setFlash ( "danger", "Role cannot be updated" );
			}
		}
	}
	public function actionDeleterole() {
		$user = Yii::$app->user->identity;
		if ($user->role ["name"] != Yii::$app->params ['DEFAULT_ADMIN_ROLE']) {
			$controller_id = Yii::$app->controller->id;
			$acton_id = Yii::$app->controller->action->id;
			if (! AuthenticationService::isAccessibleAction ( $controller_id, $acton_id )) {
				return $this->redirect ( [ 
						'authentication/notallowed' 
				] );
			}
		}
		
		if (Yii::$app->request->isAjax) {
			$id = $_POST ["id"];
			$model = Role::findOne ( $id );
			$model->user_id = $user->id;
			$model->deleted = 1;
			if ($model->save ()) {
				Yii::$app->session->setFlash ( "success", "Role has been deleted successfully" );
			} else {
				Yii::$app->session->setFlash ( "danger", "Role cannot be deleted" );
			}
		}
	}
	public function actionSavemenuandaction() {
		$user = Yii::$app->user->identity;
		if ($user->role ["name"] != Yii::$app->params ['DEFAULT_ADMIN_ROLE']) {
			$controller_id = Yii::$app->controller->id;
			$acton_id = Yii::$app->controller->action->id;
			if (! AuthenticationService::isAccessibleAction ( $controller_id, $acton_id )) {
				return $this->redirect ( [ 
						'authentication/notallowed' 
				] );
			}
		}
		if (Yii::$app->request->isAjax) {
			
			// $data = Yii::$app->request->post ();
			$db = Yii::$app->db->beginTransaction ();
			try {
				$role_id = "";
				if (isset ( $_POST ["role_id"] )) {
					$role_id = $_POST ["role_id"];
					RoleHasMenu::deleteAll ( 'role_id = :role_id', [ 
							':role_id' => $role_id 
					] );
					RoleHasAction::deleteAll ( 'role_id = :role_id', [ 
							':role_id' => $role_id 
					] );
				}
				if (isset ( $_POST ["theActionIdList"] ) && count ( $_POST ["theActionIdList"] ) > 0) {
					foreach ( $_POST ["theActionIdList"] as $action_id ) {
						$roleHasAction = new RoleHasAction ();
						$roleHasAction->action_id = $action_id;
						$roleHasAction->role_id = $role_id;
						$roleHasAction->allowed = '1';
						
						if (! $roleHasAction->save ())
							throw new Exception ( "RoleHasAction cannot be saved" );
					}
				}
				if (isset ( $_POST ["theMenuIdList"] ) && count ( $_POST ["theMenuIdList"] ) > 0) {
					foreach ( $_POST ["theMenuIdList"] as $menu_id ) {
						
						$roleHasMenu = new RoleHasMenu ();
						$roleHasMenu->menu_id = $menu_id;
						$roleHasMenu->role_id = $role_id;
						$roleHasMenu->accessible = '1';
						if (! $roleHasMenu->save ())
							throw new Exception ( "RoleHasMenu cannot be saved" );
					}
				}
				
				$db->commit ();
				Yii::$app->session->setFlash ( 'success', "Menu(s) and Action(s) have been saved successfully" );
			} catch ( Exception $ex ) {
				$db->rollBack ();
				Yii::$app->session->setFlash ( 'danger', "Menu(s) and Action(s) cannot saved" . $ex );
			}
		}
	}
	
	/**
	 * Displays a single User model.
	 *
	 * @param integer $id        	
	 * @return mixed
	 */
	public function actionView($id) {
		$user = Yii::$app->user->identity;
		if ($user->role ["name"] != Yii::$app->params ['DEFAULT_ADMIN_ROLE']) {
			$controller_id = Yii::$app->controller->id;
			$acton_id = Yii::$app->controller->action->id;
			if (! AuthenticationService::isAccessibleAction ( $controller_id, $acton_id )) {
				return $this->redirect ( [ 
						'authentication/notallowed' 
				] );
			}
		}
		
		return $this->render ( 'view', [ 
				'model' => $this->findModel ( $id ) 
		] );
	}
	
	/**
	 * Creates a new User model.
	 * If creation is successful, the browser will be redirected to the 'view' page.
	 *
	 * @return mixed
	 */
	public function actionCreate() {
		$user = Yii::$app->user->identity;
		if ($user->role ["name"] != Yii::$app->params ['DEFAULT_ADMIN_ROLE']) {
			$controller_id = Yii::$app->controller->id;
			$acton_id = Yii::$app->controller->action->id;
			if (! AuthenticationService::isAccessibleAction ( $controller_id, $acton_id )) {
				return $this->redirect ( [ 
						'authentication/notallowed' 
				] );
			}
		}
		$model = new User ();
		$model->password = "1010";
		$userRoles = array ();
		
		if ($model->load ( Yii::$app->request->post () ) && $model->validate ()) {
			
			$db = Yii::$app->db->beginTransaction ();
			try {
				
				if (! $model->save ())
					throw new Exception ( "User cannot be saved" );
				if (isset ( $_POST ['User'] ['role_id'] )) {
					$model->role_id = $_POST ['User'] ['role_id'];
				}
				
				$db->commit ();
				Yii::$app->session->setFlash ( 'success', "User has been saved successfully" );
				return $this->redirect ( [ 
						'view',
						'id' => $model->id 
				] );
			} catch ( Exception $ex ) {
				$db->rollBack ();
				Yii::$app->session->setFlash ( 'danger', "User cannot be saved" . $ex );
			}
		} else {
			
			return $this->render ( 'create', [ 
					'model' => $model 
			] );
		}
	}
	
	/**
	 * Updates an existing User model.
	 * If update is successful, the browser will be redirected to the 'view' page.
	 *
	 * @param integer $id        	
	 * @return mixed
	 */
	public function actionUpdate($id) {
		$user = Yii::$app->user->identity;
		if ($user->role ["name"] != Yii::$app->params ['DEFAULT_ADMIN_ROLE']) {
			$controller_id = Yii::$app->controller->id;
			$acton_id = Yii::$app->controller->action->id;
			if (! AuthenticationService::isAccessibleAction ( $controller_id, $acton_id )) {
				return $this->redirect ( [ 
						'authentication/notallowed' 
				] );
			}
		}
		
		$model = $this->findModel ( $id );
		
		if ($model->load ( Yii::$app->request->post () ) && $model->save ()) {
			Yii::$app->session->setFlash ( 'success', "User has been saved successfully" );
			return $this->redirect ( [ 
					'view',
					'id' => $model->id 
			] );
		} else {
			return $this->render ( 'update', [ 
					'model' => $model 
			] );
		}
	}
	private function saveUserHasProvince($arrayProvinceIds, $user_id) {
		if (count ( $arrayProvinceIds ) > 0) {
			foreach ( $arrayProvinceIds as $the_province_id ) {
				$userHasProvince = new UserHasProvince ();
				$userHasProvince->user_id = $user_id;
				$userHasProvince->province_id = $the_province_id;
				if (! $userHasProvince->save ())
					throw new Exception ( "UserHasProvince cannot be saved" );
			}
		}
	}
	public function actionSubordinateandbranch($id) {
		$user = Yii::$app->user->identity;
		if ($user->role ["name"] != Yii::$app->params ['DEFAULT_ADMIN_ROLE']) {
			$controller_id = Yii::$app->controller->id;
			$acton_id = Yii::$app->controller->action->id;
			if (! AuthenticationService::isAccessibleAction ( $controller_id, $acton_id )) {
				return $this->redirect ( [ 
						'authentication/notallowed' 
				] );
			}
		}
		
		$model = $this->findModel ( $id );
		
		if (Yii::$app->request->isAjax) {
			// $data = Yii::$app->request->post ();
			$db = Yii::$app->db->beginTransaction ();
			try {
				$user_id = "";
				if (isset ( $_POST ["user_id"] ) && $_POST ["user_id"] != null) {
					
					$user_id = $_POST ["user_id"];
					
					UserSubordinate::deleteAll ( 'user_id = :user_id', [ 
							':user_id' => $user_id 
					] );
					
					UserHasBranch::deleteAll ( 'user_id = :user_id', [ 
							':user_id' => $user_id 
					] );
					
					UserHasProvince::deleteAll ( 'user_id = :user_id', [ 
							':user_id' => $user_id 
					] );
				}
				
				if (isset ( $_POST ["myProvince_idList"] ) && count ( $_POST ["myProvince_idList"] ) > 0) {
					$this->saveUserHasProvince ( $_POST ["myProvince_idList"], $user_id );
				}
				
				if (isset ( $_POST ["myUser_idList"] ) && count ( $_POST ["myUser_idList"] ) > 0) {
					foreach ( $_POST ["myUser_idList"] as $the_user_id ) {
						$userSubordinate = new UserSubordinate ();
						$userSubordinate->user_id = $user_id;
						$userSubordinate->subordinate_user_id = $the_user_id;
						if (! $userSubordinate->save ())
							throw new Exception ( "UserSubordinate cannot be saved" );
					}
				}
				
				if (isset ( $_POST ["myBranch_idList"] ) && count ( $_POST ["myBranch_idList"] ) > 0) {
					foreach ( $_POST ["myBranch_idList"] as $the_branch_id ) {
						$userHasBranch = new UserHasBranch ();
						$userHasBranch->user_id = $user_id;
						$userHasBranch->branch_id = $the_branch_id;
						if (! $userHasBranch->save ())
							throw new Exception ( "UserHasBranch cannot be saved" );
					}
				}
				// }
				$db->commit ();
				// Yii::$app->session->setFlash ( 'success', "Subordinate(s) and Department(s) have been saved successfully" );
				exit ();
			} catch ( Exception $ex ) {
				$db->rollBack ();
				Yii::$app->session->setFlash ( 'danger', "Subordinate(s) and Department(s) cannot saved" . $ex );
				exit ();
			}
		}
		
		// Start loading Branch
		
		$sql_branch = " select ";
		$sql_branch .= " ifnull(b.user_id,0) as branch_user_id,ifnull(b.branch_id,0) as branch_id,a.* from branch a ";
		$sql_branch .= "  left outer join ";
		$sql_branch .= "  user_has_branch b ";
		$sql_branch .= " on a.id=b.branch_id  ";
		$sql_branch .= "  and b.user_id=:user_id ";
		
		$params_branch = [ 
				':user_id' => $id 
		];
		
		$model->theBraches = Branch::findBySql ( $sql_branch, $params_branch )->all ();
		
		// Start loading Branch
		
		$sql_subordinate = " select ";
		$sql_subordinate .= " ifnull(b.user_id,0) as subordinate_usr_id , ";
		$sql_subordinate .= " ifnull(b.subordinate_user_id,0) as subordinate_user_id,  ";
		$sql_subordinate .= " o.* from (select a.* from user a ";
		$sql_subordinate .= " where a.id<>:id  ";
		$sql_subordinate .= " order by a.id) o ";
		$sql_subordinate .= " left outer join   user_subordinate b ";
		$sql_subordinate .= " on o.id=b.subordinate_user_id ";
		$sql_subordinate .= " and b.user_id=:user_id ";
		
		$params_subordinate = [ 
				':id' => $id,
				':user_id' => $id 
		];
		
		$model->theSubcordinateUsers = User::findBySql ( $sql_subordinate, $params_subordinate )->all ();
		
		// Start loading Province
		
		$sql_province = " select ";
		$sql_province .= " ifnull(b.user_id,0) as user_id,ifnull(b.province_id,0) as province_id,a.* from province a ";
		$sql_province .= "  left outer join ";
		$sql_province .= "  user_has_province b ";
		$sql_province .= " on a.id=b.province_id  ";
		$sql_province .= "  and b.user_id=:user_id ";
		
		$params_province = [ 
				':user_id' => $id 
		];
		$model->theProvinces = Province::findBySql ( $sql_province, $params_province )->all ();
		return $this->render ( 'subordinate', [ 
				"model" => $model 
		] );
	}
	
	/**
	 * Deletes an existing User model.
	 * If deletion is successful, the browser will be redirected to the 'index' page.
	 *
	 * @param integer $id        	
	 * @return mixed
	 */
	public function actionDelete($id) {
		$user = Yii::$app->user->identity;
		if ($user->role ["name"] != Yii::$app->params ['DEFAULT_ADMIN_ROLE']) {
			$controller_id = Yii::$app->controller->id;
			$acton_id = Yii::$app->controller->action->id;
			if (! AuthenticationService::isAccessibleAction ( $controller_id, $acton_id )) {
				return $this->redirect ( [ 
						'authentication/notallowed' 
				] );
			}
		}
		$this->findModel ( $id )->delete ();
		
		return $this->redirect ( [ 
				'index' 
		] );
	}
	
	/**
	 * Finds the User model based on its primary key value.
	 * If the model is not found, a 404 HTTP exception will be thrown.
	 *
	 * @param integer $id        	
	 * @return User the loaded model
	 * @throws NotFoundHttpException if the model cannot be found
	 */
	protected function findModel($id) {
		if (($model = User::findOne ( $id )) !== null) {
			return $model;
		} else {
			throw new NotFoundHttpException ( 'The requested page does not exist.' );
		}
	}
	public function beforeAction($action) {
		$user = Yii::$app->user->identity;
		$this->enableCsrfValidation = false;
		$controller_id = Yii::$app->controller->id;
		$acton_id = Yii::$app->controller->action->id;
		if ($user->role ["name"] != Yii::$app->params ['DEFAULT_ADMIN_ROLE']) {
			if (! AuthenticationService::isAccessibleAction ( $controller_id, $acton_id )) {
				if (Yii::$app->request->isAjax) {
					MyHelper::response ( HttpCode::UNAUTHORIZED, Yii::t ( 'app', 'HTTP Error 401- You are not authorized to access this operaton due to invalid authentication' ) . " with ID:  " . $controller_id . "/ " . $acton_id );
					return;
				} else {
					return $this->redirect ( [ 
							'authentication/notallowed' 
					] );
				}
			}
		}
		
		return parent::beforeAction ( $action );
	}
}
