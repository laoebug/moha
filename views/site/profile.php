<?php
/**
 * Created by PhpStorm.
 * User: adsavin
 * Date: 2/1/18
 * Time: 10:56 PM
 */

use yii\widgets\DetailView;

/* @var $this yii\web\View */
$this->title = "ຂໍ້ມູນຜູ້ໃຊ້";
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="user-form">
    <div class="col-xs-6 card">
        <h2><?= $this->title ?></h2>
        <hr>
        <?= DetailView::widget([
            'model' => $model,
            'attributes' => [
                'username',
                'firstname',
                'lastname',
                'status',
                'tel',
                'email:email',
                [
                    'attribute' => 'deleted',
                    'value' => function ($data) {
                        return Yii::$app->params['YESNO'][$data->deleted];
                    }
                ],
                [
                    'name' => 'role',
                    'label' => "ສິດໜ້າທີ່",
                    'value' => $model->role["name"],
                    'type' => 'raw'
                ]

            ],
        ])
        ?>
    </div>
</div>
