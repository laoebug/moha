<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model app\models\StatReligionPlace */

$this->title = Yii::t('app', 'Create Stat Religion Place');
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Stat Religion Places'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="stat-religion-place-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
