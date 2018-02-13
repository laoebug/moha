<?php

/* @var $this yii\web\View */
/* @var $form yii\bootstrap\ActiveForm */

/* @var $model app\models\ContactForm */

use yii\bootstrap\ActiveForm;
use yii\captcha\Captcha;
use yii\helpers\Html;

$this->title = 'ຕິດຕໍ່ພວກເຮົາ';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="card">
    <div class="row">
        <div class="col-xs-12">
            <h1 class="text-center"><?= Html::encode($this->title) ?></h1>
            <table class="table">
                <tbody>
                <tr>
                    <td class="text-right"><i class="fa fa-phone"></i> ເບີໂທ</td>
                    <th style="width: 50%"><?= $contents['TELEPHONE'] ?></th>
                </tr>
                <tr>
                    <td class="text-right"><i class="fa fa-envelope"></i> ອີເມວ</td>
                    <th><?= $contents['EMAIL'] ?></th>
                </tr>
                <tr>
                    <td class="text-right"><i class="fa fa-globe"></i> ເວັບໄຊ</td>
                    <th><?= $contents['WEBSITE'] ?></th>
                </tr>
                <tr>
                    <td class="text-right"><i class="fa fa-home"></i> ທີ່ຢູ່</td>
                    <th><?= $contents['ADDRESS'] ?></th>
                </tr>
                </tbody>
            </table>
            <div id="map" style="width: 100%;height: 70vh"></div>
        </div>
        <div class="col-xs-6 hidden">
            <h1>ຝາກຄຳຄິດເຫັນ</h1>
            <?php $form = ActiveForm::begin(['id' => 'contact-form']); ?>
            <?= $form->field($model, 'name') ?>
            <?= $form->field($model, 'email') ?>
            <?= $form->field($model, 'subject') ?>
            <?= $form->field($model, 'body')->textarea(['rows' => 6]) ?>
            <?= $form->field($model, 'verifyCode')->widget(Captcha::className(), [
                'template' => '<div class="row"><div class="col-lg-3">{image}</div><div class="col-lg-6">{input}</div></div>',
            ]) ?>

            <div class="form-group">
                <?= Html::submitButton('ສົ່ງຄຳເຫັນ', ['class' => 'btn btn-primary', 'name' => 'contact-button']) ?>
            </div>
            <?php ActiveForm::end(); ?>
        </div>
    </div>
</div>
<script>
  function initMap() {
    var uluru = {lat: <?= $contents['LAT'] ?>, lng: <?= $contents['LON'] ?>};
    var map = new google.maps.Map(document.getElementById('map'), {
      zoom: <?= $contents['MAPZOOM'] ?>,
      center: uluru
    });
    var marker = new google.maps.Marker({
      position: uluru,
      map: map,
      animation: google.maps.Animation.BOUNCE,
    });
  }
</script>
<script async defer
        src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDBuSAiSvY718_Aascagsk2ydjqVb3WsgM&callback=initMap">
</script>