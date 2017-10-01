<?php

namespace app\controllers;

use Yii;
use app\models\User;
use app\models\UserSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use yii\db\Exception;
use app\models\Role;
use app\models\Menu;
use app\models\Action;
use app\models\UserHasRole;
use app\services\AuthenticationService;
use app\models\RoleHasMenu;
use app\models\RoleHasAction;

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
		$searchModel = new UserSearch ();
		$dataProvider = $searchModel->search ( Yii::$app->request->queryParams );
		
		return $this->render ( 'index', [ 
				'searchModel' => $searchModel,
				'dataProvider' => $dataProvider 
		] );
	}
	public function actionManageuser() {
		$model = new User ();
		$model->password = "1010";
		$id = "";
		if (isset ( $_POST ['User'] ['id'] ) && ! empty ( $_POST ['User'] ['id'] )) {
			$id = $_POST ['User'] ['id'];
			$model = User::findOne ( $id );
		}
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
			} catch ( Exception $ex ) {
				$db->rollBack ();
				Yii::$app->session->setFlash ( 'error', "User cannot be saved" . $ex );
			}
		}
		
		$models = User::find ()->all ();
		return $this->render ( 'manageUser', [ 
				'models' => $models,
				'model' => $model 
		] );
	}
	public function actionListmenu() {
		$menuList = array ();
		if (Yii::$app->request->isAjax) {
			$data = Yii::$app->request->post ();
			try {
				
				$sql_menu = " select ";
				$sql_menu .= " ifnull((select menu_id from role_has_menu where role_id=:role_id and menu_id=a.id),0) as menu_id, ";
				$sql_menu .= " ifnull((select role_id from role_has_menu where role_id=:role_id and menu_id=a.id),0) as role_id, ";
				$sql_menu .= " a.* from menu a";
				$sql_menu .= " order by a.position ";
				$params = [ 
						':role_id' => $data ["role_id"],
						':role_id' => $data ["role_id"] 
				];
				
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
		$actionList = array ();
		if (Yii::$app->request->isAjax) {
			$data = Yii::$app->request->post ();
			try {
				
				$sql_action = " select ";
				$sql_action .= " ifnull((select role_id from role_has_action where role_id=:role_id and action_id=a.id),0) as role_id, ";
				$sql_action .= "  ifnull((select action_id from role_has_action where role_id=:role_id and action_id=a.id),0) as action_id,";
				$sql_action .= "  a.* from action a ";
				$params = [ 
						':role_id' => $data ["role_id"],
						':role_id' => $data ["role_id"] 
				];
				
				$actions = Action::findBySql ( $sql_action, $params )->all ();
				
				if (count ( $actions ) > 0) {
					
					foreach ( $actions as $action ) {
						
						$actionList [$action ['id']] = [ 
								
								"parent_id" => $action ['parent_id'],
								"id" => $action ['id'],
								"role_id" => $action ['role_id'],
								"action_id" => $action ['action_id'],
								"name" => $action ['description'] 
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
		$model = new Role ();
		$menuList = [ ];
		
		$models = Role::find ()->all ();
		
		return $this->render ( 'manageRole', [ 
				'models' => $models,
				'model' => $model,
				'menuList' => $menuList 
		] );
	}
	public function actionAddrole() {
		$user = Yii::$app->user;
		$model = new Role ();
		
		if (Yii::$app->request->isAjax) {
			$data = Yii::$app->request->post ();
			$model->name = $data ["role_name"];
			$model->user_id = $user->id;
			$model->deleted = 0;
			if ($model->save ()) {
				Yii::$app->session->setFlash ( "success", "Role has been added successfully" );
			} else {
				Yii::$app->session->setFlash ( "danger", "Role cannot be added" );
			}
		}
	}
	public function actionSavemenuandaction() {
		$user = Yii::$app->user;
		
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
	
	public function actionNot(){
		return $this->render('not',[]);
	}
	/**
	 * Deletes an existing User model.
	 * If deletion is successful, the browser will be redirected to the 'index' page.
	 *
	 * @param integer $id        	
	 * @return mixed
	 */
	public function actionDelete($id) {
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
}
