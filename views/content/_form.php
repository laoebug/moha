<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\Content */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="content-form">
    <?php $form = ActiveForm::begin(); ?>
    <?= $form->field($model, 'code')->textInput(['maxlength' => true, 'readonly' => true]) ?>
    <?= $form->field($model, 'value')->textarea(['rows' => 6]) ?>
    <div class="form-group">
        <?= Html::submitButton('ບັນທຶກ', ['class' => 'btn btn-success']) ?>
    </div>
    <?php ActiveForm::end(); ?>
</div>
