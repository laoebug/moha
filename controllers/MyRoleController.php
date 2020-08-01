<?php

namespace app\controllers;

use yii\rest\ActiveController;

class MyRoleController extends ActiveController
{
    public $modelClass = 'app\models\Role';
    //public $modelClass = 'app\models\MyUser';
}