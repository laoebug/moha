<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\StatReligionPlace */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="stat-religion-place-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'last_update')->textInput() ?>

    <?= $form->field($model, 'saved')->textInput() ?>

    <?= $form->field($model, 'user_id')->textInput() ?>

    <?= $form->field($model, 'phiscal_year_id')->textInput() ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? Yii::t('app', 'Create') : Yii::t('app', 'Update'), ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
