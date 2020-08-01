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
            <h3 class="text-center">ຕາຕາລາງບັນດາໂຄງການຊ່ວຍເຫຼືອຂອງຕ່າງປະເທດ ປະຈຳປີ <?= @$year->year ?></h3>
            <div class="card-body">
                <table class="table table-bordered table-hover" ng-show="models">
                    <thead>
                        <tr>
                            <th class="text-center" rowspan="2"><?= Yii::t('app', 'No.') ?></th>
                            <th class="text-center" rowspan="2">ຊື່ໂຄງການ</th>
                            <th class="text-center" rowspan="2">ເລກໝາຍສັນຍາ</th>
                            <th class="text-center" colspan="2">ໄລຍະການຈັດຕັ້ງປະຕິບັດ</th>
                            <th class="text-center" rowspan="2">ປະເພດໂຄງການ</th>
                            <th class="text-center" rowspan="2">ມູນຄ່າຂອງໂຄງການ</th>
                            <th class="text-center" rowspan="2">ໝາຍເຫດ</th>
                        </tr>
                        <tr>
                            <th class="text-center">ເລີ່ມປະຕິບັດ</th>
                            <th class="text-center">ສຳເລັດ</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php foreach ($models as $index => $m) : ?>
                            <tr>
                                <td class="text-center"><?= $index + 1 ?></td>
                                <td><?= $m['name'] ?></td>
                                <td class="text-center"><?= $m['contract'] ?></td>
                                <td class="text-center"><?= $m['start'] ?></td>
                                <td class="text-center"><?= $m['finish'] ?></td>
                                <td class="text-center"><?= $m['type'] ?></td>
                                <td class="text-right"><?= number_format($m['amount']) ?></td>
                                <td><?= $m['remark'] ?></td>
                            </tr>
                        <?php endforeach; ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>