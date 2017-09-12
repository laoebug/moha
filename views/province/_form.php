<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\Province */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="province-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'province_code')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'province_name')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'record_status')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'input_id')->textInput() ?>

    <?= $form->field($model, 'input_dt_stamp')->textInput() ?>

    <?= $form->field($model, 'deleted')->textInput() ?>

    <?= $form->field($model, 'position')->textInput() ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? Yii::t('app', 'Create') : Yii::t('app', 'Update'), ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
