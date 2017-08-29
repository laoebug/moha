<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use dosamigos\datepicker\DatePicker;

/* @var $this yii\web\View */
/* @var $model app\models\PhiscalYear */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="phiscal-year-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'year')->textInput(['maxlength' => true]) ?>
    <?= $form->field($model, 'start_date')->widget(
        DatePicker::className(), [
        'clientOptions' => [
            'autoclose' => true,
            'format' => 'dd-mm-yyyy',
            'todayHighlight' => true
        ]
    ]);?>
    <?= $form->field($model, 'end_date')->widget(
        DatePicker::className(), [
        'clientOptions' => [
            'autoclose' => true,
            'format' => 'dd-mm-yyyy',
            'todayHighlight' => true
        ]
    ]);?>
    <?= $model->isNewRecord?"": $form->field($model, 'deleted')->dropDownList(["NO", "YES"]) ?>
    <?= $form->field($model, 'status')->dropDownList(["C" => Yii::t('app', 'Closed'), "O" => Yii::t('app','Opening')]) ?>
    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? Yii::t('app', 'Create') : Yii::t('app', 'Update'), ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>
    <?php ActiveForm::end(); ?>
</div>
