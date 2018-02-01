<?php
/**
 * Created by PhpStorm.
 * User: adsavin
 * Date: 2/1/18
 * Time: 10:56 PM
 */

use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
$this->title = "ປ່ຽນລະຫັດຜ່ານ";
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="user-form">
    <div class="col-xs-6 card">
        <h2><?= $this->title ?></h2>
        <hr>
        <?php $form = ActiveForm::begin([
            'enableAjaxValidation' => false,
            'enableClientValidation' => false,
        ]); ?>

        <div class="row">
            <div class="col-xs-12">
                <?= $form->field($model, 'password')
                    ->label('ລະຫັດຜ່ານ ປະຈຸບັນ')
                    ->passwordInput(['maxlength' => true, 'placeholder' => 'ລະຫັດຜ່ານ ປະຈຸບັນ']) ?>
            </div>
            <div class="col-xs-12">
                <?= $form->field($model, 'newpassword')
                    ->label('ລະຫັດຜ່ານ ໃໝ່')
                    ->passwordInput(['maxlength' => true, 'placeholder' => 'ລະຫັດຜ່ານ ໃໝ່']) ?>
            </div>
            <div class="col-xs-12">
                <?= $form->field($model, 'confirmpassword')
                    ->label('ຢືນຢັນ ລະຫັດຜ່ານ')
                    ->passwordInput(['maxlength' => true, 'placeholder' => 'ຢືນຢັນ ລະຫັດຜ່ານ']) ?>
            </div>
        </div>
        <button type="submit" class="btn btn-primary">
            <i class="fa fa-floppy-o"></i> ບັນທຶກ
        </button>
        <?php ActiveForm::end(); ?>
    </div>
</div>
