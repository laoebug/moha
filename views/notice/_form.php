<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\Notice */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="notice-form">
    <?php $form = ActiveForm::begin(); ?>
    <div class="col-xs-12">
        <?= $form->field($model, 'title')->textInput(['maxlength' => true]) ?>

        <?php
        echo $form->field($model, 'content')
            ->widget(\app\components\MyKCFinder::className(), [
                'options' => ['rows' => 6],
                'preset' => 'full',
                'clientOptions' => [
                    'filebrowserUploadUrl' => 'index.php?r=site/upload',
//                    'filebrowserImageUploadUrl' => 'index.php?=site/browse'
                ]
            ]);
        ?>
    </div>
    <div class="col-xs-3">
        <label>ເລີ່ມວັນທີ</label>
        <input id="start_date" name="Notice[start_date]" value="<?= $model->start_date ?>"
               class="form-control datepicker" type="text">
    </div>
    <div class="col-xs-3">
        <label>ເຖິງວັນທີ</label>
        <input id="end_date" name="Notice[end_date]" value="<?= $model->end_date ?>" class="form-control datepicker"
               type="text">
    </div>
    <div class="col-xs-3">
        <?= $form->field($model, 'position')->textInput() ?>
    </div>
    <div class="col-xs-3">
        <?= $form->field($model, 'show')->dropDownList(Yii::$app->params['YESNO']) ?>
    </div>
    <div class="form-group">
        <?= Html::submitButton(Yii::t('app', 'Save'), ['class' => 'btn btn-success']) ?>
    </div>
    <?php ActiveForm::end(); ?>
</div>
