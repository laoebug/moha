<?php

namespace app\models;
use Codeception\Util\HttpCode;
use \yii\filters\AccessControl;
use \yii\web\HttpException;
use Yii;
class TheAccessControl extends AccessControl{

    protected function denyAccess($user)
    {
        if ($user !== false && $user->getIsGuest()) {
            $user->loginRequired();
        } else {            
            throw new HttpException(HttpCode::UNAUTHORIZED,Yii::t('app', 'You are not allowed to perform this action.'));            
        }
    }
}
?>