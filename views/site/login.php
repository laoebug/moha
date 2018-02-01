<?php

/* @var $this yii\web\View */
/* @var $form yii\bootstrap\ActiveForm */

/* @var $model app\models\LoginForm */

use yii\bootstrap\ActiveForm;

$this->title = 'Login';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="row text-center">
    <img src="images/Emblem_of_Laos.svg" style="width: 20%"/>
</div>
<h3 class="login-head text-center">
    ລະບົບບັນທຶກຂໍ້ມູນ ກະຊວງພາຍໃນ
</h3>

<section class="material-half-bg" style="padding-top: 90vh;">
    <div class="cover" style="vertical-align: middle">
        <h6 style="color: #ffffff;padding-top: 10px;text-align: center">
            ສະຫງວນລິຂະສິດ &copy; <?= date('Y') ?>
        </h6>
    </div>
</section>

<section class="login-content" style="margin-top: -20vh">
    <div class="row">
        <div class="col-xs-12">
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
<!--                <h4 class="login-head">-->
<!--                    <i class="fa fa-lg fa-fw fa-user"></i>ເຂົ້າສູ່ລະບົບ-->
<!--                </h4>-->
                <div class="">
                    <label class="control-label">ຊື່ຜູ້ໃຊ້</label>
                    <?= $form->field($model, 'username')->textInput([
                        'autofocus' => true,
                        'placeholder' => 'ຊື່ຜູ້ໃຊ້'
                    ])->label(false) ?>
                </div>
                <div class="">
                    <label class="control-label">ລະຫັດຜ່ານ</label>
                    <?= $form->field($model, 'password')->label(false)->passwordInput([
                        'placeholder' => 'ລະຫັດຜ່ານ'
                    ]) ?>
                </div>
                <div class="form-group">
                    <div class="utility">
                        <div class="animated-checkbox">
                            <label class="semibold-text">
                                <input type="checkbox"><span class="label-text">ຈື່ຊື່ໄວ້</span>
                            </label>
                        </div>
                        <p class="semibold-text mb-0"><a data-toggle="flip">ລືມລະຫັດຜ່ານ ?</a></p>
                    </div>
                </div>
                <div class="form-group btn-container">
                    <button class="btn btn-primary btn-block"><i class="fa fa-sign-in fa-lg fa-fw"></i>ເຂົ້າສູ່ລະບົບ
                    </button>
                </div>
                <?php ActiveForm::end(); ?>
                <form class="forget-form" action="index.html">
                    <h3 class="login-head"><i class="fa fa-lg fa-fw fa-lock"></i>ລືມລະຫັດຜ່ານ ?</h3>
                    <div class="form-group">
                        <label class="control-label">ອີເມວ</label>
                        <input class="form-control" type="text" placeholder="ອີເມວ">
                    </div>
                    <div class="form-group btn-container">
                        <button class="btn btn-primary btn-block"><i class="fa fa-unlock fa-lg fa-fw"></i>ຣີເຊັດ
                        </button>
                    </div>
                    <div class="form-group mt-20">
                        <p class="semibold-text mb-0"><a data-toggle="flip"><i class="fa fa-angle-left fa-fw"></i>
                                ກັບຄືນ</a>
                        </p>
                    </div>
                </form>
            </div>
        </div>
    </div>
</section>
