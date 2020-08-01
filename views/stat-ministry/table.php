<?php

/**
 * Created by PhpStorm.
 * User: adsavin
 * Date: 09/04/2017
 * Time: 14:56
 */
$this->title = "ສະຖິຕິໂຄງປະກອບກົງຈັກຂອງລັດຖະບານ ສະໄໝທີ "
    . $model['batch'] . ' (ປີ ' . $model['from_year'] . ' - ' . $model['to_year'] . ')';
?>
<div class="row">
    <div class="col-sm-12">
        <div class="card">
            <h3 class="text-center"><?= $this->title ?></h3>
            <div class="card-body">
                <table class="table table-bordered table-hover">
                    <thead>
                        <tr>
                            <th class="text-center" rowspan="2"><?= Yii::t('app', 'No.') ?></th>
                            <th class="text-center">ຊື່ກະຊວງ ແລະ ອົງການທຽບເທົ່າ</th>
                            <th class="text-center">ສະໄໝ</th>
                            <th class="text-center">ໝາຍເຫດ</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php
                        if (isset($models))
                            foreach ($models as $index => $model) : ?>
                            <tr>
                                <td class="text-center"><?= $model['position'] ?></td>
                                <td><?= $model['name'] ?></td>
                                <td class="text-center"><?= $model['batch'] ?></td>
                                <td class="text-center"><?= $model['remark'] ?></td>
                            </tr>
                        <?php endforeach; ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>