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
                <h3 class="title">ຕາຕະລາງສະຖິຕິການພັດທະນາຫຼັກສູດຝຶກອົບຮົມລັດຖະກອນ (<?= $year['year'] ?>)</h3>
            </div>
            <div class="card-body">
                <table class="table table-responsive table-bordered table-hover">
                    <thead>
                    <tr>
                        <th class="text-center" style="width: 20px"><?= Yii::t('app', 'No.') ?></th>
                        <th class="text-center">ຈຳນວນຫຼັກສູດຕ່າງໆ</th>
                    </tr>
                    </thead>
                    <tbody>
                    <?php foreach ($models as $i => $model): ?>
                        <tr>
                            <th style="text-align: center"><?= $romans[$i] ?></th>
                            <th><?= $model['name'] ?></th>
                        </tr>
                        <?php foreach ($model['childs'] as $j => $m): ?>
                            <tr>
                                <td style="text-align: right"><?= $j+1 ?></td>
                                <td><?= $m['name'] ?></td>
                            </tr>
                        <?php endforeach; ?>
                    <?php endforeach; ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>