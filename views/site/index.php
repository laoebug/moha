<?php

/* @var $this yii\web\View */

$this->title = Yii::t('app', 'Dashboad');
?>
<div class="site-index">
    <div class="body-content">
        <div class="row user">
            <div class="col-md-4 col-sm-offset-4 text-center" style="">
                <b class="fa fa-user fa-5x"></b>
                <h4><?= Yii::$app->user->identity->username ?></h4>
                <p><?= Yii::$app->user->identity->firstname ?></p>
            </div>
        </div>
    </div>
</div>
