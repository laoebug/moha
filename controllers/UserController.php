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
use app\models\UserHasRole;
use app\services\AuthenticationService;

/**
 * UserController implements the CRUD actions for User model.
 */
class UserController extends Controller
{

    /**
     * @inheritdoc
     */
    public function behaviors()
    {
        return [
            'verbs' => [
                'class' => VerbFilter::className(),
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
    public function actionIndex()
    {
        $searchModel = new UserSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);
        
        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider
        ]);
    }

    public function actionManageuser()
    {
        $model = new User();
        $model->password = "1010";
        $id = "";
        if (isset($_POST['User']['id']) && ! empty($_POST['User']['id'])) {
            $id = $_POST['User']['id'];
            $model = User::findOne($id);
        }
        if ($model->load(Yii::$app->request->post()) && $model->validate()) {
            
            $db = Yii::$app->db->beginTransaction();
            try {
                
                if (! $model->save())
                    throw new Exception("User cannot be saved");
                if (isset($_POST['User']['role_id'])) {
                    $model->role_id = $_POST['User']['role_id'];
                }
                
                $db->commit();
                Yii::$app->session->setFlash('success', "User has been saved successfully");
            } catch (Exception $ex) {
                $db->rollBack();
                Yii::$app->session->setFlash('error', "User cannot be saved" . $ex);
            }
        }
        
        $models = User::find()->all();
        return $this->render('manageUser', [
            'models' => $models,
            'model' => $model
        ]);
    }

    public function actionManagerole()
    {
        $model = new Role();
        
        if (isset($_POST['menu_list'])) {
            // print_r($_POST['menu_list']);exit;
        }
        // $model->password = "1010";
        // $id="";
        // if(isset($_POST['User']['id']) && !empty($_POST['User']['id'])){
        // $id = $_POST['User']['id'];
        // $model=User::findOne($id);
        
        // }
        // if ($model->load(Yii::$app->request->post()) && $model->validate()) {
        
        // $db = Yii::$app->db->beginTransaction();
        // try {
        
        // if (! $model->save())
        // throw new Exception("User cannot be saved");
        // if (isset($_POST['User']['role_id'])) {
        // $model->role_id = $_POST['User']['role_id'];
        // }
        
        // $db->commit();
        // Yii::$app->session->setFlash('success', "User has been saved successfully");
        // } catch (Exception $ex) {
        // $db->rollBack();
        // Yii::$app->session->setFlash('error', "User cannot be saved" . $ex);
        // }
        // }
        // $sql = "select * from role";
        // $models = Role::findBySql($sql)->all();
        
        
		
			
        
        $models = Role::find()->all();
        
        foreach ($models as $role){
        	$sql = "select getRoleId(:role_id,a.id) as role_id,getMenuId(:role_id,a.id) as menu_id, a.* from menu a";
        	$params = [
        			':role_id' => $role["id"],
        			':role_id' => $role["id"]
        	];        	
        	$role->theMenus=Menu::findBySql($sql, $params)->all();
        }        
        return $this->render('manageRole', [
            'models' => $models,
            'model' => $model
        ]);
    }

    /**
     * Displays a single User model.
     *
     * @param integer $id            
     * @return mixed
     */
    public function actionView($id)
    {
        return $this->render('view', [
            'model' => $this->findModel($id)
        ]);
    }

    /**
     * Creates a new User model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     *
     * @return mixed
     */
    public function actionCreate()
    {
        $model = new User();
        
        // $roles = Role::find()->all();
        // $menus = Menu::find()->all();
        
        // $authorizeMenus = AuthenticationService::getAuthorizedMenuAndRole();
        
        $model->password = "1010";
        $userRoles = array();
        
        if ($model->load(Yii::$app->request->post()) && $model->validate()) {
            
            $db = Yii::$app->db->beginTransaction();
            try {
                
                if (! $model->save())
                    throw new Exception("User cannot be saved");
                if (isset($_POST['User']['role_id'])) {
                    $model->role_id = $_POST['User']['role_id'];
                }
                
                // if (isset($_POST['role'])) {
                // $userRoles = $_POST['role'];
                // echo $_POST['role'];exit;
                // foreach ($userRoles as $key=>$role_id){
                // $userHasRole = new UserHasRole();
                // $userHasRole->user_id=$model->id;
                // $userHasRole->role_id=$role_id;
                // $userHasRole->set_date=date('Y-m-d H:i:s');
                // if (! $userHasRole->save())
                // throw new Exception("User role cannot be saved");
                // }
                
                // }
                $db->commit();
                Yii::$app->session->setFlash('success', "User has been saved successfully");
                return $this->redirect([
                    'view',
                    'id' => $model->id
                ]);
            } catch (Exception $ex) {
                $db->rollBack();
                Yii::$app->session->setFlash('error', "User cannot be saved" . $ex);
            }
        } else {
            
            return $this->render('create', [
                'model' => $model
            ]);
        }
    }

    /**
     * Updates an existing User model.
     * If update is successful, the browser will be redirected to the 'view' page.
     *
     * @param integer $id            
     * @return mixed
     */
    public function actionUpdate($id)
    {
        $model = $this->findModel($id);
        
        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            Yii::$app->session->setFlash('success', "User has been saved successfully");
            return $this->redirect([
                'view',
                'id' => $model->id
            ]);
        } else {
            return $this->render('update', [
                'model' => $model
            ]);
        }
    }

    /**
     * Deletes an existing User model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     *
     * @param integer $id            
     * @return mixed
     */
    public function actionDelete($id)
    {
        $this->findModel($id)->delete();
        
        return $this->redirect([
            'index'
        ]);
    }

    /**
     * Finds the User model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     *
     * @param integer $id            
     * @return User the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = User::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
    
    
}
