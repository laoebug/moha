<?php

namespace app\controllers;

use app\components\MyHelper;
use app\models\PhiscalYear;
use Codeception\Util\HttpCode;
use Yii;
use app\models\Ministry;
use app\models\MinistrySearch;
use yii\web\Controller;
use yii\web\MethodNotAllowedHttpException;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use app\services\AuthenticationService;

/**
 * MinistryController implements the CRUD actions for Ministry model.
 */
class MinistryController extends Controller {
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
	 * Lists all Ministry models.
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
		
		return $this->render ( 'index' );
	}
	public function actionEnquiry() {
		return json_encode ( [ 
				'ministries' => Ministry::find ()->where ( 'deleted=0 and ministry_group_id in(1,2)' )->orderBy ( 'position' )->asArray ()->all () 
		] );
	}
	public function actionSave() {
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
		
		$post = Yii::$app->request->post ();
		if (isset ( $post )) {
			if ($post ['create'] == 1) {
				$model = new Ministry ();
				$model->deleted = 0;
			} else {
				$model = Ministry::findOne ( $post ['Ministry'] ['id'] );
				if (! isset ( $model )) {
					MyHelper::response ( HttpCode::NOT_FOUND, Yii::t ( 'app', 'The Ministry is Not Found' ) );
					return;
				}
			}
			$model->load ( $post );
			$model->user_id = Yii::$app->user->id;
			$model->last_update = date ( 'Y-m-d H:i:s' );
			if (! $model->save ()) {
				MyHelper::response ( HttpCode::INTERNAL_SERVER_ERROR, json_encode ( $model->errors ) );
				return;
			}
		}
	}
	public function actionDelete() {
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
		
		$post = Yii::$app->request->post ();
		if (isset ( $post )) {
			if (isset ( $post ['Ministry'] )) {
				$model = $this->findModel ( $post ['Ministry'] ['id'] );
				$model->deleted = 1;
				$model->last_update = date ( 'Y-m-d H:i:s' );
				$model->user_id = Yii::$app->user->id;
				if (! $model->save ()) {
					MyHelper::response ( HttpCode::INTERNAL_SERVER_ERROR, json_encode ( $model->errors ) );
					return;
				}
			}
		}
	}
	public function actionPrint() {
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
		
		$ministries = Ministry::find ()->where ( [ 
				'deleted' => 0 
		] )->orderBy ( 'position' )->asArray ()->all ();
		return $this->renderPartial ( 'print', [ 
				'content' => $this->renderPartial ( 'table', [ 
						'ministries' => $ministries 
				] ) 
		] );
	}
	public function actionDownload() {
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
		
		$ministries = Ministry::find ()->where ( [ 
				'deleted' => 0 
		] )->orderBy ( 'position' )->asArray ()->all ();
		return $this->renderPartial ( 'excel', [ 
				'file' => 'ministries.xls',
				'content' => $this->renderPartial ( 'table', [ 
						'ministries' => $ministries 
				] ) 
		] );
	}
	/**
	 * Finds the Ministry model based on its primary key value.
	 * If the model is not found, a 404 HTTP exception will be thrown.
	 *
	 * @param integer $id        	
	 * @return Ministry the loaded model
	 * @throws NotFoundHttpException if the model cannot be found
	 */
	protected function findModel($id) {
		if (($model = Ministry::findOne ( $id )) !== null) {
			return $model;
		} else {
			MyHelper::response ( HttpCode::NOT_FOUND, Yii::t ( 'app', 'The requested page does not exist.' ) );
			return;
		}
	}
}
