<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model app\models\Govermentlevel */

$this->title = Yii::t('app', 'Create Govermentlevel');
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Govermentlevels'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="govermentlevel-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
