<?php

/**
 * Created by PhpStorm.
 * User: adsavin
 * Date: 09/04/2017
 * Time: 14:56
 */
?>
<style type="text/css" media="print">
    @page {
        size: landscape;
    }
</style>
<div class="row">
    <div class="col-sm-12">
        <h3 class="title">ສະຖິຕິການທ້ອນໂຮມເອກະສານທີ່ມີຄວາມສຳຄັນແຫ່ງຊາດ ປະຈໍາປີ (<?= $year['year'] ?>)</h3>
        <table class="table table-bordered table-hover">
            <thead>
                <tr>
                    <th class="text-center" rowspan="3">ລ/ດ</th>
                    <th class="text-center" rowspan="3">ເອກະສານບັນດາກະຊວງ, ອົງການ ແລະ ພາກສ່ວນຕ່າງໆ</th>
                    <th class="text-center" colspan="3">ຈຳນວນເອກະສານປະຫວັດສາດ 1975 ຄືນຫຼັງ</th>
                    <th class="text-center" colspan="3">ຈໍານວນສໍາ​ນວນເອກະສານປະຫວັດສາດ​ 1975 ເຖິງ​ປະຈຸ​ບັນ</th>
                    <th class="text-center" rowspan="3">ໝາຍເຫດ</th>
                </tr>
                <tr>
                    <th class="text-center" colspan="3">ປີ <?php echo $year->year ?></th>
                    <th class="text-center" colspan="3">ປີ <?php echo $year->year ?></th>
                </tr>
                <tr>
                    <th class="text-center">ຂໍ້ມູນຜ່ານມາ</th>
                    <th class="text-center">ຂໍ້ມູນທີ່ເພີ່ມຂຶ້ນ ຫຼື ຫຼຸດລົງ</th>
                    <th class="text-center">ລວມທັງໝົດ(ເອກະສານມີຕົວຈິງ)</th>
                    <th class="text-center">ຂໍ້ມູນຜ່ານມາ</th>
                    <th class="text-center">ຂໍ້ມູນທີ່ເພີ່ມຂຶ້ນ ຫຼື ຫຼຸດລົງ</th>
                    <th class="text-center">ລວມທັງໝົດ(ເອກະສານມີຕົວຈິງ)</th>
                </tr>
            </thead>
            <tbody>
                <?php foreach ($models as $model) : ?>
                    <tr>
                        <th colspan="9" class="text-center" style="background-color: #dcd18b"><?= $model['name'] ?></th>
                    </tr>
                    <?php foreach ($model['details'] as $index => $m) : ?>
                        <tr>
                            <td class="text-center"><?= $index + 1 ?></td>
                            <td><?= $m['name'] ?></td>
                            <td class="text-center"><?= number_format($m['after']) ?></td>
                            <td class="text-center"><?= number_format($m['after_new']) ?></td>
                            <td class="text-center"><?= number_format($m['after'] + $m['after_new']) ?></td>

                            <td class="text-center"><?= number_format($m['now_before']) ?></td>
                            <td class="text-center"><?= number_format($m['now_new']) ?></td>
                            <td class="text-center"><?= number_format($m['now_before'] + $m['now_new']) ?></td>
                            
                            <td><?= $m['remark'] ?></td>
                        </tr>
                    <?php endforeach; ?>
                <?php endforeach; ?>
            </tbody>
        </table>
    </div>
</div>