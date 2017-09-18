<?php
namespace app\controllers;

use Yii;
// use app\models\ApproverLevel;
// use app\models\ApproverLevelSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
// use yii\filters\VerbFilter;
class AuthenticationController extends Controller
{

    public function actionIndex()
    {
        // $searchModel = new MenuSearch();
        // $dataProvider = $searchModel->search(Yii::$app->request->queryParams);
        
        // return $this->render('index', [
        // 'searchModel' => $searchModel,
        // 'dataProvider' => $dataProvider,
        // ]);
        return $this->render('index', [
            'time' => date('H:i:s')
        ]);
    }

    public function actionManageMenu()
    {
        return $this->render('manageMenu', [
            'time' => date('H:i:s')
        ]);
    }
    
    public function actionIndex1()
    {
        return $this->render('index1', [
            
        ]);
    }
}
