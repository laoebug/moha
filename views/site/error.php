<?php

/* @var $this yii\web\View */
/* @var $name string */
/* @var $message string */
/* @var $exception Exception */

use yii\helpers\Html;

$this->title = $name;
?>

<div class="page-error">
    <h1>
        <i class="fa fa-exclamation-circle"></i>
        <?= nl2br(Html::encode($message)) ?>
    </h1>
    <div class="alert alert-danger">
        <?= Html::encode($this->title) ?>
        <?php print_r($exception->getMessage()) ?>
    </div>
    <p>
        <a href="javascript:window.history.back();" class="btn btn-default">
            <i class="fa fa-arrow-left"></i> ກັບຄືນ
        </a>
    </p>
</div>