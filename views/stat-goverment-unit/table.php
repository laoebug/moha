<?php
/**
 * Created by PhpStorm.
 * User: adsavin
 * Date: 9/3/17
 * Time: 12:26 AM
 */
?>

<div class="row">
<?php if($showstatus): ?>
    <div class="col-sm-4 hidden-print">
        <div class="widget-small <?=$model->saved?'primary':'warning'?>"><i class="icon fa fa-star fa-2x"></i>
            <div class="info">
                <h4><?=Yii::t('app', 'Status') ?></h4>
                <p><b><?=Yii::t('app', $model->saved?'Saved':'-')?></b></p>
            </div>
        </div>
    </div>
    <div class="col-sm-4 hidden-print">
        <div class="widget-small info"><i class="icon fa fa-user fa-2x"></i>
            <div class="info">
                <h4><?=Yii::t('app', 'Owner') ?></h4>
                <p><b><?=$model->saved && $model->user? $model->user->username:'-'?></b></p>
            </div>
        </div>
    </div>
    <div class="col-sm-4 hidden-print">
        <div class="widget-small danger"><i class="icon fa fa-clock-o fa-2x"></i>
            <div class="info">
                <h4><?=Yii::t('app', 'Last Update') ?></h4>
                <p><b><?=$model->saved?\app\components\MyHelper::converttimefordisplay($model->last_update):"-"?></b></p>
            </div>
        </div>
    </div>
<?php endif; ?>
    <div class="col-sm-12">
        <div class="card">
            <div class="card-title-w-btn ">
                <h3 class="title"><?= Yii::t('app','Statistics of Goverment Unit ') ?> (<?= $year->year ?>)</h3>
                <p class="hidden-print">
                    <a class="btn btn-default" href="index.php?r=stat-goverment-unit/print&year=<?=$year->id?>"><i class="fa fa-print fa-2x"></i></a>
                    <a class="btn btn-info" href="index.php?r=stat-goverment-unit/download&year=<?=$year->id?>"><i class="fa fa-download fa-2x"></i></a>
                </p>
            </div>
            <div class="card-body">
                <table class="table table-responsive table-bordered table-hover">
                    <thead>
                    <tr>
                        <th style="width: 10px"><?= Yii::t('app', 'No.') ?></th>
                        <th><?= Yii::t('app', 'Ministry') ?></th>
                        <?php foreach (['Office', 'Department', 'Institute', 'Center'] as $item): ?>
                        <th style="width: 10%"><?= Yii::t('app', $item) ?></th>
                        <?php endforeach; ?>
                        <th><?= Yii::t('app', 'Remark') ?></th>
                    </tr>
                    </thead>
                    <tbody>
                    <?php
                    $i = 0;
                    $sum = ['office'=>0,'department'=>0,'insitute'=>0,'center'=>0];
                    foreach ($groups as $g): ?>
                        <tr>
                            <td colspan="2" class="text-center"><strong><?= $g->name ?></strong></td>
                            <td colspan="5"></td>
                        </tr>
                        <?php foreach ($g->branches as $b): ?>
                            <tr>
                                <td><?= ++$i ?></td>
                                <td><?= $b->name ?></td>
                                    <?php
                                    foreach ($model->statGovermentUnitDetails as $detail)
                                        if ($detail->branch_id == $b->id) {
                                            foreach (['office', 'department', 'insitute', 'center'] as $item) {
                                                $sum[$item] += isset($detail[$item])?$detail[$item]:0;
                                                echo '<td class="text-center">' . (isset($detail[$item])?$detail[$item]:"") . '</td>';
                                            }
                                            echo '<td class="text-center">' . (isset($detail['remark'])?$detail['remark']:'') . '</td>';
                                            break;
                                        }
                                    ?>
                                </td>
                            </tr>
                        <?php endforeach; ?>
                    <?php endforeach; ?>
                    </tbody>
                    <tfoot>
                    <tr>
                        <th colspan="2"><?= Yii::t('app', 'Total') ?></th>
                        <?php foreach (['office', 'department', 'insitute', 'center'] as $level): ?>
                            <th class="text-center"><?=isset($sum[$level])?$sum[$level]:0?></th>
                        <?php endforeach;  ?>
                        <th></th>
                    </tr>
                    </tfoot>
                </table>
            </div>
        </div>
    </div>
</div>