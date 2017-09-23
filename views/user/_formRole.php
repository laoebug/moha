<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\Role */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="role-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'name')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'deleted')->textInput(['maxlength' => true]) ?>

    <div class="form-group">
        <?= Html::submitButton('<i class="fa fa-fw fa-save"></i>'. Yii::t('app', 'Save'), ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary'])?>
        <?= Html::button('<i class="fa fa-fw fa-user"></i>'. Yii::t('app', 'New'), [
            'class' => 'btn btn-md btn-info',            
             'title'=>Yii::t('app', 'New Record'),
            'id'=>'btnNew','id'=>'btnNew'
        ]);
        ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
