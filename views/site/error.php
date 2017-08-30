<?php

/* @var $this yii\web\View */
/* @var $name string */
/* @var $message string */
/* @var $exception Exception */

use yii\helpers\Html;

$this->title = $name;
?>

<div class="page-error">
    <h1><i class="fa fa-exclamation-circle"></i> <?= Html::encode($this->title) ?></h1>
    <div class="alert alert-danger">
        <?= nl2br(Html::encode($message)) ?>
    </div>
    <p>
        <a href="javascript:window.history.back();" class="btn btn-default">
            <i class="fa fa-arrow-left"></i> <?= Yii::t('app', 'Go Back') ?>
        </a>
    </p>
</div>