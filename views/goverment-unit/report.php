<div class="row">
    <div class="col-sm-4">
        <div class="widget-small <?=$model->saved?'warning':'primary'?>"><i class="icon fa fa-star fa-2x"></i>
            <div class="info">
                <h4><?=Yii::t('app', 'Status') ?></h4>
                <p><b><?=Yii::t('app', $model->saved?'Saved':'New')?></b></p>
            </div>
        </div>
    </div>
    <div class="col-sm-4">
        <div class="widget-small info"><i class="icon fa fa-user fa-2x"></i>
            <div class="info">
                <h4><?=Yii::t('app', 'Owner') ?></h4>
                <p><b><?=$model->saved && $model->user? $model->user->username:'-'?></b></p>
            </div>
        </div>
    </div>
    <div class="col-sm-4">
        <div class="widget-small danger"><i class="icon fa fa-clock-o fa-2x"></i>
            <div class="info">
                <h4><?=Yii::t('app', 'Last Update') ?></h4>
                <p><b><?=$model->saved?\app\components\MyHelper::convertdatefordisplay($model->last_update):"-"?></b></p>
            </div>
        </div>
    </div>
    <div class="col-sm-12">
        <div class="card">
            <div class="card-title-w-btn">
                <h3 class="title"><?= Yii::t('app','Statistics of Goverment Unit ') ?> (<?= $year->year ?>)</h3>
                <p>
                    <a class="btn btn-success" href="index.php?r=goverment-unit/create&id=<?=$year->id?>"><i class="fa fa-pencil fa-2x"></i></a>
                    <a class="btn btn-default" href="index.php?r=goverment-unit/print&id=<?=$year->id?>"><i class="fa fa-print fa-2x"></i></a>
                    <a class="btn btn-info" href="index.php?r=goverment-unit/download&id=<?=$year->id?>"><i class="fa fa-download fa-2x"></i></a>
                </p>
            </div>
            <div class="card-body">
                <b>Card with action button </b><br>
                <table class="table table-responsive table-bordered table-hover">
                    <thead>
                    <tr>
                        <th style="width: 10px"><?= Yii::t('app', 'No.') ?></th>
                        <th><?= Yii::t('app', 'Ministry') ?></th>
                        <?php foreach ($govermentlevels as $l): ?>
                            <th style="width: 10%"><?= $l->name ?></th>
                        <?php endforeach;  ?>
                        <th><?= Yii::t('app', 'Remark') ?></th>
                    </tr>
                    </thead>
                    <tbody>
                    <?php
                    $i = 0;
                    foreach ($branchgroups as $g): ?>
                        <tr>
                            <td colspan="2" class="text-center"><strong><?= $g->name ?></strong></td>
                            <?php foreach ($govermentlevels as $l): ?>
                                <td></td>
                            <?php endforeach;  ?>
                            <td></td>
                        </tr>

                        <?php foreach ($g->branches as $b): ?>
                            <tr>
                                <td><?= ++$i ?></td>
                                <td><?= $b->name ?></td>
                                <?php foreach ($govermentlevels as $l): ?>
                                    <td>
                                        <?php
                                        if(isset($model))
                                            foreach ($model->statGovermentUnitDetails as $detail)
                                                if($detail->branch_id == $b->id && $detail->goverment_level_id == $l->id) {
                                                    echo $detail->value;
                                                    break;
                                                }
                                        ?>
                                    </td>
                                <?php endforeach;  ?>
                                <td></td>
                            </tr>
                        <?php endforeach; ?>
                    <?php endforeach; ?>
                    </tbody>
                    <tfoot>
                    <tr>
                        <th colspan="2"><?= Yii::t('app', 'Total') ?></th>
                        <?php foreach ($govermentlevels as $l): ?>
                            <td></td>
                        <?php endforeach;  ?>
                        <td></td>
                    </tr>
                    </tfoot>
                </table>
            </div>
        </div>
    </div>
</div>