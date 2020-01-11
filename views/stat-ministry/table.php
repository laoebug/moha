<?php
/**
 * Created by PhpStorm.
 * User: adsavin
 * Date: 09/04/2017
 * Time: 14:56
 */
$this->title = "ສະຖິຕິໂຄງປະກອບກົງຈັກຂອງລັດຖະບານ";
?>
<div class="row">
    <div class="col-sm-12">
        <div class="card">
            <h3 class="text-center"><?= $this->title ?> (<?= isset($year) ? $year->year : '' ?>)</h3>
            <div class="card-body">
                <table class="table table-bordered table-hover">
                    <thead>
                    <tr>
                        <th class="text-center" rowspan="2"><?= Yii::t('app', 'No.') ?></th>
                        <th class="text-center">ຊື່ກະຊວງ ແລະ ອົງການທຽບເທົ່າ</th>
                        <th class="text-center">ໝາຍເຫດ</th>
                    </tr>
                    </thead>
                    <tbody>
                    <?php
                    if (isset($models))
                        foreach ($models as $index => $model): ?>
                            <tr>
                                <td class="text-center"><?= $model['position'] ?></td>
                                <td><?= $model['name'] ?></td>
                                <td><?= $model['remark'] ?></td>
                            </tr>
                        <?php endforeach; ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
