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
                        <?php $total_office=0; ?>
                        <?php $total_department=0; ?>
                        <?php $total_center=0; ?>
                        <?php $total_institute=0; ?>
                        <?php $total_division=0; ?>
                        <?php
                        $i = 0;
                        $sum = ['office' => 0, 'department' => 0, 'center' => 0, 'insitute' => 0, 'division' => 0];
                        
                        foreach ($ministries as $model) : ?>
                            <tr>                                                        
                                <td><?= ++$i ?></td>
                                <td><?= $model->name; ?></td>
                                <td class="text-center"><?= $model->office; ?></td>
                                <td class="text-center"><?= $model->department; ?></td>
                                <td class="text-center"><?= $model->center; ?></td>
                                <td class="text-center"><?= $model->insitute; ?></td>
                                <td class="text-center"><?= $model->division; ?></td>
                                <td class="text-center"><?= $model->remark; ?></td>

                                
                                <?php $total_office = $total_office + $model->office; ?>                                                            
                                <?php $total_department = $total_department + $model->department; ?>                                                            
                                <?php $total_center = $total_center + $model->center; ?>                                                            
                                <?php $total_institute = $total_institute + $model->insitute; ?>                                                            
                                <?php $total_division = $total_division + $model->division; ?>
                                
                            </tr>
                        <?php endforeach; ?>
                    </tbody>
                    <tfoot>
                        <tr>
                            <th colspan="2"><?= Yii::t('app', 'Total') ?></th>
                            
                            <th class="text-center"><?php echo $total_office; ?></th>
                            <th class="text-center"><?php echo $total_department; ?></th>
                            <th class="text-center"><?php echo $total_center; ?></th>
                            <th class="text-center"><?php echo $total_institute; ?></th>
                            <th class="text-center"><?php echo $total_division; ?></th>
                            <th class="text-center"></th>
                        </tr>
                    </tfoot>
                </table>
            </div>
        </div>
    </div>
</div>