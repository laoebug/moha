<?php
/**
 * Created by PhpStorm.
 * User: adsavin
 * Date: 09/04/2017
 * Time: 14:56
 */
$this->title = "ຕາຕາລາງ ບໍລິການແຜນທີ່";
$cols = [
    'title',
    'place',
    'ratio',
    'mark',
    'point',
    'hm',
    'km',
    'remark',
];
?>
<style type="text/css" media="print">
    @page {
        size: landscape;
    }
</style>
<div class="row">
    <div class="col-sm-12">
        <div class="card">
            <h3 class="text-center"><?= $this->title ?> (<?= isset($year) ? $year->year : '' ?>)</h3>
            <div class="card-body">
                <table class="table table-bordered table-hover">
                    <thead>
                    <tr>
                        <th class="text-center" rowspan="2"><?= Yii::t('app', 'No.') ?></th>
                        <th rowspan="2" class="text-center" style="width: 13%">ເນື້ອໃນບໍລິການ</th>
                        <th rowspan="2" class="text-center" style="width: 13%">ຂົງເຂດ (ສະຖານທີ່)</th>
                        <th rowspan="2" class="text-center" style="width: 13%">ມາດຕາສ່ວນ</th>
                        <th class="text-center" colspan="4">ຫົວໜ່ວຍ</th>
                        <th rowspan="2" class="text-center" style="width: 13%">ໝາຍເຫດ</th>
                    </tr>
                    <tr>
                        <th class="text-center" style="width: 13%">ຫຼັກໝາຍ</th>
                        <th class="text-center" style="width: 13%">ຈຸດ</th>
                        <th class="text-center" style="width: 13%">ເນື້ອທີ່ເຮັກຕາ</th>
                        <th class="text-center" style="width: 13%">ເນື້ອທີ່ ກິໂລແມັດ</th>
                    </tr>
                    </thead>
                    <tbody>
                    <?php
                    if (isset($models))
                        foreach ($models as $index => $model): ?>
                            <tr>
                                <td class="text-center"><?= $index + 1 ?></td>
                                <?php foreach ($cols as $col): ?>
                                    <td class="text-center"><?= $model[$col] ?></td>
                                <?php endforeach; ?>
                            </tr>
                        <?php endforeach; ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
