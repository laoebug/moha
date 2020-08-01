<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model app\models\Menugroup */

$this->title = Yii::t('app', 'Create Menugroup');
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Menugroups'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="menugroup-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
