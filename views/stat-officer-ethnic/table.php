<?php

/**
 * Created by PhpStorm.
 * User: adsavin
 * Date: 9/9/17
 * Time: 8:36 PM
 */
$sum = [];
$total = ['total' => 0, 'women' => 0];
$row = [];
foreach ($ethnics as $ethnic)
    if (!isset($sum[$ethnic['id']]))
        $sum[$ethnic['id']] = ['total' => 0, 'women' => 0];

foreach ($models as $model) {
    $sum[$model['ethnic_id']]['total'] += $model['total'];
    $sum[$model['ethnic_id']]['women'] += $model['women'];
    $total['total'] += $model['total'];
    $total['women'] += $model['women'];
    if (!isset($row[$model['officer_level_id']])) $row[$model['officer_level_id']] = ['total' => 0, 'women' => 0];
    $row[$model['officer_level_id']]['total'] += $model['total'];
    $row[$model['officer_level_id']]['women'] += $model['women'];
}
?>
<style type="text/css" media="print">
    @page {
        size: landscape;
    }
</style>
<div class="col-sm-12 card" style="margin-top: 2em;overflow-x: scroll">
    <div class="card-title-w-btn">
        <h3>ຕາຕະລາງຈຳນວນລັດຖະກອນແຍກຕາມຊົນເຜົ່າ</h3>
        <p class="hidden-print">
            <a class="btn btn-default" target="_blank" href="index.php?r=stat-officer-ethnic/print&year=<?= $year->id ?>"><i class="fa fa-print fa-2x"></i></a>
            <a class="btn btn-info" target="_blank" href="index.php?r=stat-officer-ethnic/download&year=<?= $year->id ?>"><i class="fa fa-download fa-2x"></i></a>
        </p>
    </div>
    <table class="table table-hover table-bordered">
        <thead>
            <tr>
                <th rowspan="2">ພາກສ່ວນຕ່າງໆ</th>
                <th rowspan="2">ຈຳນວນ</th>
                <th rowspan="2">ລວມ</th>
                <th class="text-center" colspan="<?= count($ethnics) ?>">ຊົນເຜົ່າ</th>
            </tr>
            <tr>
                <?php
                foreach ($ethnics as $i => $ethnic) :
                ?>
                    <th><?= $ethnic['name'] ?></th>
                <?php endforeach; ?>
            </tr>
            <tr>
                <th rowspan="2">1. ກະຊວງພາຍໃນລວມ</th>
                <th>ລ</th>
                <th><?= $total['total'] ?></th>
                <?php foreach ($sum as $s) : ?>
                    <th><?= $s['total'] ?></th>
                <?php endforeach; ?>
            </tr>
            <tr>
                <th>ຍ</th>
                <th><?= $total['women'] ?></th>
                <?php foreach ($sum as $s) : ?>
                    <th><?= $s['women'] ?></th>
                <?php endforeach; ?>
            </tr>
        </thead>
        <tbody>
            <?php foreach ($levels as $i => $level) : ?>
                <tr>
                    <td rowspan="2"><?= $level['name'] ?></td>
                    <td class="text-center">ລ</td>
                    <td class="text-center"><?= isset($row[$level['id']]['total']) ? $row[$level['id']]['total'] : "" ?></td>
                    <?php foreach ($ethnics as $j => $ethnic) : ?>
                        <td class="text-center">
                            <?php
                            foreach ($models as $model)
                                if ($model['officer_level_id'] == $level['id'] && $model['ethnic_id'] == $ethnic['id']) {
                                    echo $model['total'];
                                    break;
                                }
                            ?>
                        </td>
                    <?php
                    endforeach; ?>
                </tr>
                <tr>
                    <td class="text-center">ຍ</td>
                    <td class="text-center"><?= isset($row[$level['id']]['women']) ? $row[$level['id']]['women'] : "" ?></td>
                    <?php foreach ($ethnics as $e => $ethnic) : ?>
                        <td class="text-center">
                            <?php
                            foreach ($models as $model)
                                if ($model['officer_level_id'] == $level['id'] && $model['ethnic_id'] == $ethnic['id']) {
                                    echo $model['women'];
                                    break;
                                }
                            ?>
                        </td>
                    <?php
                    endforeach; ?>
                </tr>
            <?php endforeach; ?>
        </tbody>
    </table>
</div>