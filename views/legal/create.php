<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model app\models\Legal */

$this->title = 'ເພີ່ມຂໍ້ມູນ ນິຕິກຳ';
$this->params['breadcrumbs'][] = ['label' => 'ນິຕິກຳ', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="legal-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
