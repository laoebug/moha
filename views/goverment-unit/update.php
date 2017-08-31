<?php

/* @var $this yii\web\View */
/* @var $searchModel app\models\GovermentlevelSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */
/* @var $model app\models\StatGovermentUnit */

$this->title = Yii::t('app', 'Goverment Unit'). " (".$year->year.")";
$this->params['breadcrumbs'][] = $this->title;
?>
<style>
    th, input[type=number] {
        text-align: center;
    }
</style>
<div class="row" ng-app="mohaApp" ng-controller="govermentUnitUpdateController">
    <div class="col-sm-4">
        <div class="widget-small <?=$model->saved?'warning':'primary'?>"><i class="icon fa fa-star fa-2x"></i>
            <div class="info">
                <h4><?=Yii::t('app', 'Status') ?></h4>
                <p><b class="status"><?=Yii::t('app', $model->saved?'Saved':'New')?></b></p>
            </div>
        </div>
    </div>
    <div class="col-sm-4">
        <div class="widget-small info"><i class="icon fa fa-user fa-2x"></i>
            <div class="info">
                <h4><?=Yii::t('app', 'Owner') ?></h4>
                <p><b class="username"><?=$model->saved && $model->user? $model->user->username:'-'?></b></p>
            </div>
        </div>
    </div>
    <div class="col-sm-4">
        <div class="widget-small danger"><i class="icon fa fa-clock-o fa-2x"></i>
            <div class="info">
                <h4><?=Yii::t('app', 'Last Update') ?></h4>
                <p><b class="last_update"><?=$model->saved?\app\components\MyHelper::convertdatefordisplay($model->last_update):"-"?></b></p>
            </div>
        </div>
    </div>
    <div class="col-sm-12">
        <div class="card">
            <div class="card-title-w-btn">
                <h3 class="title text-center">
                    <?=Yii::t('app','Statistics of Goverment Unit ')?>
                </h3>
                <div class="btn-group">
                    <button type="submit" class="btn btn-primary"><?=Yii::t('app','Save')?></button>
                </div>
            </div>
            <div class="card-body">
                <form method="post">
                    <table class="table table-responsive table-bordered table-hover">
                        <thead>
                        <tr>
                            <th style="width: 10px"><?=Yii::t('app', 'No.')?></th>
                            <th><?=Yii::t('app', 'Ministry')?></th>
                            <?php foreach ($govermentlevels as $l):?>
                                <th style="width: 10%"><?=$l->name?></th>
                            <?php endforeach; ?>
                            <th style="width: 20%"><?=Yii::t('app', 'Remark')?></th>
                        </tr>
                        </thead>
                        <tbody>
                        <?php
                        $i = 0;
                        foreach ($branchgroups as $g):?>
                            <tr>
                                <td colspan="2" class="text-center">
                                    <strong><?=$g->name?></strong>
                                </td>
                                <td colspan="<?=count($govermentlevels)+1?>"></td>
                            </tr>
                            <?php foreach ($g->branches as $b):?>
                                <tr>
                                    <td><?=++$i?></td>
                                    <td><?=$b->name?></td>
                                    <?php foreach ($govermentlevels as $l):?>
                                        <td><input data-branch="<?=$b->id?>" data-level="<?=$l->id?>" type="number" class="form-control value" name="GovermentUnit[<?=$b->id?>][<?=$g->id?>][value]"> </td>
                                    <?php endforeach;?>
                                    <td><input class="form-control remark" type="text" name="GovermentUnit[<?=$b->id?>][remark]"> </td>
                                </tr>
                            <?php endforeach;?>
                        <?php endforeach;?>
                        </tbody>
                        <tfoot>
                        <tr>
                            <th colspan="2"><?=Yii::t('app', 'Total')?></th>
                            <?php foreach ($govermentlevels as $l):?>
                                <th class="total" data-level="<?=$l->id?>"></th>
                            <?php endforeach; ?>
                            <th></th>
                        </tr>
                        </tfoot>
                    </table>
                </form>
            </div>
        </div>
    </div>
</div>
    <i class="fa fa-exclamation"></i>
<?php
$this->registerJs("
$('input[type=number]').change(function() {
    var branch_id = $(this).data('branch');
    var level_id = $(this).data('level');
    var value = $(this).val();
    $.post('index.php?r=goverment-unit/save', {id:".$model->id.",branch_id:branch_id,goverment_level_id:level_id,value:value}, function(r) {        
        if(r.error) {
            $.notify({
                title: '".Yii::t('app', 'ERROR')."',
                message: r.error,
                icon: 'fa fa-exclamation' 
            },{
                type: 'danger'
            });
            if(r.value)
                $(this).val(r.value);
            return;
        }
        
        $('.username').html(r.username);
        $('.last_update').html(r.last_update);
        $('.status').html(r.status);
        
        $.notify({
                title: '".Yii::t('app', 'SUCCESS')."',
                message: '".Yii::t('app','Operation Successfule')."',
                icon: 'fa fa-exclamation' 
            },{
                type: 'danger'
            });
    });
    sum($(this).data('level'));
});

$('input[type=number]').keyup(function() {
    sum($(this).data('level'));
});

function sum(level) {
 var total = 0;
 $('.value[data-level='+level+']').each(function(index) {
    if(isNumeric($(this).val()))
        total += parseFloat($(this).val());
 });
 $('.total[data-level='+level+']').html(total);
} 

function isNumeric(n) {
  return !isNaN(parseFloat(n)) && isFinite(n);
}
");
