<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model app\models\Ethnic */

$this->title = 'ເພີ່ມຂໍ້ມູນ ຊົນເຜົ່າ';
$this->params['breadcrumbs'][] = ['label' => 'ຊົນເຜົ່າ', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="card">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
