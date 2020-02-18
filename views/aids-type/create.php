<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model app\models\AidsType */

$this->title = 'ເພີ່ມຂໍ້ມູນ ປະເພດໂຄງການ';
$this->params['breadcrumbs'][] = ['label' => 'ປະເພດໂຄງການ', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="card">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>