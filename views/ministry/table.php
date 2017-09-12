<?php
/**
 * Created by PhpStorm.
 * User: adsavin
 * Date: 9/3/17
 * Time: 12:26 AM
 */
?>

<div class="row">
    <div class="col-sm-12">
        <div class="card">
            <div class="card-title-w-btn ">
                <h3 class="title"><?= Yii::t('app','Statistics of Goverment Structure ') ?></h3>
            </div>
            <div class="card-body">
                <table class="table table-responsive table-bordered table-hover">
                    <thead>
                    <tr>
                        <th class="text-center" style="width: 10%"><?= Yii::t('app', 'No.') ?></th>
                        <th class="text-center"><?= Yii::t('app', 'Name') ?></th>
                        <th class="text-center" style="width: 40%"><?= Yii::t('app', 'Remark') ?></th>
                    </tr>
                    </thead>
                    <tbody>
                    <?php foreach ($ministries as $i => $b): ?>
                        <tr>
                            <td><?= $i+1?></td>
                            <td><?= $b['name'] ?></td>
                            <td><?= $b['remark'] ?></td>
                        </tr>
                    <?php endforeach; ?>
                    </tbody>
                    <tfoot>
                    <tr>
                        <th class="text-center" colspan="2"><?= Yii::t('app', 'Total') ?></th>
                        <th class="text-center"></th>
                    </tr>
                    </tfoot>
                </table>
            </div>
        </div>
    </div>
</div>