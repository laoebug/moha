<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model app\models\SalaryLevel */

$this->title = 'ເພີ່ມຂໍ້ມູນ ຂັ້ນເງິນເດືອນ';
$this->params['breadcrumbs'][] = ['label' => 'ຂັ້ນເງິນເດືອນ', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="card">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>