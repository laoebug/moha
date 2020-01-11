<?php
/**
 * Created by PhpStorm.
 * User: adsavin
 * Date: 09/04/2017
 * Time: 14:56
 */
$this->title = "ຕາຕາລາງ ສ້າງແຜນທີ່";
$cols = [
    'title',
    'place',
    'ratio',
    'year',
    'paper',
    'remark',
    'last_update'
];
$titles = ['ເນື້ອໃນພິມ', 'ຂົງເຂດ (ສະຖານທີ່)', 'ມາດຕາສ່ວນ', 'ປີພິມ', 'ຈຳນວນໃບ', 'ໝາຍເຫດ', 'ວັນທີ'];
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
                        <?php foreach ($titles as $n => $title): ?>
                            <th class="text-center"><?= $title ?></th>
                        <?php endforeach; ?>
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
