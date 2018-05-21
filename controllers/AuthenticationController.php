<?php
namespace app\controllers;


// use app\models\ApproverLevel;
// use app\models\ApproverLevelSearch;
use yii\web\Controller;

// use yii\filters\VerbFilter;
class AuthenticationController extends Controller
{
 
    public function actionNotallowed()
    {
    	return $this->render('notallowed', [
    			
    	]);
    }
}
