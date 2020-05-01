<?php

/**
 * Created by PhpStorm.
 * User: adsavin
 * Date: 9/3/17
 * Time: 12:26 AM
 */
?>

<div class="row">
    <?php if ($showstatus) : ?>
        <div class="col-sm-4 hidden-print">
            <div class="widget-small <?= $model->saved ? 'primary' : 'warning' ?>"><i class="icon fa fa-star fa-2x"></i>
                <div class="info">
                    <h4>ສະຖານະ</h4>
                    <p><b><?= Yii::t('app', $model->saved ? 'Saved' : '-') ?></b></p>
                </div>
            </div>
        </div>
        <div class="col-sm-4 hidden-print">
            <div class="widget-small info"><i class="icon fa fa-user fa-2x"></i>
                <div class="info">
                    <h4>ເຈົ້າຂອງ</h4>
                    <p><b><?= $model->saved && $model->user ? $model->user->username : '-' ?></b></p>
                </div>
            </div>
        </div>
        <div class="col-sm-4 hidden-print">
            <div class="widget-small danger"><i class="icon fa fa-clock-o fa-2x"></i>
                <div class="info">
                    <h4>ອັບເດດລ່າສຸດ</h4>
                    <p><b><?= $model->saved ? \app\components\MyHelper::converttimefordisplay($model->last_update) : "-" ?></b></p>
                </div>
            </div>
        </div>
    <?php endif; ?>
    <div class="col-sm-12">
        <div class="card">
            <div class="card-title-w-btn ">
                <h3 class="title">ສະຖິຕິບັນດາຫົວໜ່ວຍການຈັດຕັ້ງ (ກົມ ແລະ ອົງການລັດທຽບເທົ່າກົມ) (<?= $year->year ?>)</h3>
                <p class="hidden-print">
                    <a class="btn btn-default" target="_blank" href="index.php?r=stat-goverment-unit/print&year=<?= $year->id ?>"><i class="fa fa-print fa-2x"></i></a>
                    <a class="btn btn-info" target="_blank" href="index.php?r=stat-goverment-unit/download&year=<?= $year->id ?>"><i class="fa fa-download fa-2x"></i></a>
                </p>
            </div>
            <div class="card-body">
                <table class="table table-responsive table-bordered table-hover">
                    <thead>
                        <tr>
                            <th class="text-center" style="width: 20px"><?= Yii::t('app', 'No.') ?></th>
                            <th class="text-center"><?= Yii::t('app', 'Ministry') ?></th>
                            <?php foreach (['ຫ້ອງການ', 'ກົມ', 'ສູນ', 'ສະຖາບັນ', 'ພະແນກ'] as $item) : ?>
                                <th class="text-center" style="width: 10%"><?= $item ?></th>
                            <?php endforeach; ?>
                            <th class="text-center"><?= Yii::t('app', 'Remark') ?></th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php
                        $i = 0;
                        $sum = ['office' => 0, 'department' => 0, 'center' => 0, 'insitute' => 0, 'division' => 0];
                        foreach ($ministries as $b) : ?>
                            <tr>
                                <td><?= ++$i ?></td>
                                <td><?= $b->name ?></td>
                                <?php
                                $isnull = true;
                                foreach ($model->statGovermentUnitDetails as $detail) {
                                    if ($detail->ministry_id == $b->id) {
                                        $isnull = false;
                                        foreach (['office', 'department', 'center', 'insitute', 'division'] as $item) {
                                            $sum[$item] += isset($detail[$item]) ? $detail[$item] : 0;
                                            echo '<td class="text-center">';
                                            echo (isset($detail[$item]) ? $detail[$item] : "");
                                            echo '</td>';
                                        }
                                        echo '<td>' . (isset($detail['remark']) ? $detail['remark'] : '') . '</td>';
                                        break;
                                    }
                                }
                                if ($isnull) echo "<td></td><td></td><td></td><td></td><td></td>"
                                ?>
                                </td>
                            </tr>
                        <?php endforeach; ?>
                    </tbody>
                    <tfoot>
                        <tr>
                            <th colspan="2"><?= Yii::t('app', 'Total') ?></th>
                            <?php foreach (['office', 'department', 'center', 'insitute', 'division'] as $level) : ?>
                                <th class="text-center"><?= isset($sum[$level]) ? $sum[$level] : 0 ?></th>
                            <?php endforeach;  ?>
                            <th></th>
                        </tr>
                    </tfoot>
                </table>
            </div>
        </div>
    </div>
</div>