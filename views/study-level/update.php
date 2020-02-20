<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\StudyLevel */

$this->title = 'ແກ້ໄຂຂໍ້ມູນ ຊັ້ນວິຊາສະເພາະ';
$this->params['breadcrumbs'][] = ['label' => 'ຊັ້ນວິຊາສະເພາະ', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="card">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>