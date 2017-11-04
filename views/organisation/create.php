<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model app\models\Organisation */

$this->title = 'ເພີ່ມຂໍ້ມູນ ອົງການຈັດຕັ້ງ';
$this->params['breadcrumbs'][] = ['label' => 'ອົງການຈັດຕັ້ງ', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="card">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
