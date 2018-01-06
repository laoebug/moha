<?php
/**
 * Created by PhpStorm.
 * User: adsavin
 * Date: 09/04/2017
 * Time: 14:56
 */
?>

<div class="row">
    <div class="col-sm-12">
        <div class="card">
            <div class="card-title-w-btn ">
                <h3 class="title">
                    ສະຖິຕິໂຄງການລົງທຶນຂອງລັດ
                    (<?= $year->year ?>)</h3>
            </div>
            <div class="card-body">
                <table class="table table-bordered table-hover">
                    <thead>
                    <tr>
                        <th style="width: 5%">ລ/ດ</th>
                        <th class="text-center" style="width: 20%">ສະຖານທີ່ຕັ້ງ</th>
                        <th class="text-center" style="width: 40%">ເນື້ອໃນ</th>
                        <th class="text-center" style="width: 20%">ໄລຍະຈັດຕັ້ງ</th>
                        <th class="text-center" style="width: 20%">ໝາຍເຫດ</th>
                    </tr>
                    </thead>
                    <?php foreach ($models as $i => $model):
                    if (!isset($model['details']) || count($model['details']) <= 0) continue; ?>
                    <tbody>
                    <tr>
                        <th colspan="5" class="text-center"><?= $model['name'] ?></th>
                    </tr>
                    <?php foreach ($model['details'] as $d => $detail): ?>
                        <tr>
                            <td class="text-center"><?= $d + 1 ?></td>
                            <td><?= $detail['place'] ?> </td>
                            <td><?= $detail['description'] ?> </td>
                            <td><?= $detail['implement'] ?> </td>
                            <td><?= $detail['remark'] ?> </td>
                        </tr>
                    <?php endforeach; ?>
                    <?php endforeach; ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
