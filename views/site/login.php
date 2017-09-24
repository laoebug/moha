<?php

/* @var $this yii\web\View */
/* @var $form yii\bootstrap\ActiveForm */
/* @var $model app\models\LoginForm */

use yii\helpers\Html;
use yii\bootstrap\ActiveForm;

$this->title = 'Login';
$this->params['breadcrumbs'][] = $this->title;

?>
<section class="material-half-bg">
    <div class="cover"></div>
</section>
<section class="login-content">
    <div class="logo">
        <h1>MOHA</h1>
    </div>
    <div class="login-box">
            <?php
            $form = ActiveForm::begin([
                'id' => 'login-form',
                'layout' => 'horizontal',
                'options' => [
                        'class' => 'login-form'
                ],
                'fieldConfig' => [
                    'template' => "{label}\n<div class=\"col-sm-12\">{input}</div>\n<div class=\"col-sm-12\">{error}</div>",
                ],
            ]);
            ?>
            <h3 class="login-head"><i class="fa fa-lg fa-fw fa-user"></i>ເຂົ້າສູ່ລະບົບ</h3>
            <div class="form-group">
                <label class="control-label">ຊື່ຜູ້ໃຊ້</label>
                <?= $form->field($model, 'username')->textInput([
                        'autofocus' => true,
                    'placeholder' => 'ຊື່ຜູ້ໃຊ້'
                ])->label(false) ?>
            </div>
            <div class="form-group">
                <label class="control-label">ລະຫັດຜ່ານ</label>
                <?= $form->field($model, 'password')->label(false)->passwordInput([
                    'placeholder' => 'ລະຫັດຜ່ານ'
                ]) ?>
            </div>
            <div class="form-group">
                <div class="utility">
                    <div class="animated-checkbox">
                        <label class="semibold-text">
                            <input type="checkbox"><span class="label-text">ຈື່ຂ້ອຍໄວ້</span>
                        </label>
                    </div>
                    <p class="semibold-text mb-0"><a data-toggle="flip">ລືມລະຫັດຜ່ານ ?</a></p>
                </div>
            </div>
            <div class="form-group btn-container">
                <button class="btn btn-primary btn-block"><i class="fa fa-sign-in fa-lg fa-fw"></i>ເຂົ້າສູ່ລະບົບ</button>
            </div>
        <?php ActiveForm::end(); ?>
        <form class="forget-form" action="index.html">
            <h3 class="login-head"><i class="fa fa-lg fa-fw fa-lock"></i>ລືມລະຫັດຜ່ານ ?</h3>
            <div class="form-group">
                <label class="control-label">ອີເມວ</label>
                <input class="form-control" type="text" placeholder="ອີເມວ">
            </div>
            <div class="form-group btn-container">
                <button class="btn btn-primary btn-block"><i class="fa fa-unlock fa-lg fa-fw"></i>ຣີເຊັດ</button>
            </div>
            <div class="form-group mt-20">
                <p class="semibold-text mb-0"><a data-toggle="flip"><i class="fa fa-angle-left fa-fw"></i> ກັບຄືນ</a></p>
            </div>
        </form>
    </div>
</section>

<!---->
<!--<div class="site-login">-->
<!--    <h1>--><?//= Html::encode($this->title) ?><!--</h1>-->
<!--    <p>Please fill out the following fields to login:</p>-->
<!---->
<!---->
<!--        --><?//= $form->field($model, 'username')->textInput(['autofocus' => true]) ?>
<!---->
<!--        --><?//= $form->field($model, 'password')->passwordInput() ?>
<!---->
<!--        --><?//= $form->field($model, 'rememberMe')->checkbox([
//            'template' => "<div class=\"col-lg-offset-1 col-lg-3\">{input} {label}</div>\n<div class=\"col-lg-8\">{error}</div>",
//        ]) ?>
<!---->
<!--        <div class="form-group">-->
<!--            <div class="col-lg-offset-1 col-lg-11">-->
<!--                --><?//= Html::submitButton('Login', ['class' => 'btn btn-primary', 'name' => 'login-button']) ?>
<!--            </div>-->
<!--        </div>-->
<!---->
<!---->
<!--    <div class="col-lg-offset-1" style="color:#999;">-->
<!--        You may login with <strong>admin/admin</strong> or <strong>demo/demo</strong>.<br>-->
<!--        To modify the username/password, please check out the code <code>app\models\User::$users</code>.-->
<!--    </div>-->
<!--</div>-->
