<?php

/* @var $this yii\web\View */
/* @var $searchModel app\models\GovermentlevelSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = Yii::t('app', 'Goverment Unit');
$this->params['breadcrumbs'][] = $this->title;
?>
<style>
    th {
        text-align: center;
    }
</style>
<div class="row">
    <div class="col-sm-12">
        <form class="form-horizontal" method="post" action="index.php?r=goverment-unit">
            <input type="hidden" name="r" value="goverment-unit">
            <div class="form-group">
                <label class="col-sm-12"><?= Yii::t('app', 'Phiscal Year') ?></label>
                <div class="col-sm-4">
                    <select name="phiscalyear" class="form-control" id="phiscalyear">
                        <option value=""><?= Yii::t('app','Select') ?></option>
                        <?php foreach ($phiscalyears as $y): ?>
                            <option value="<?= $y->id ?>"><?= $y->year ?></option>
                        <?php endforeach; ?>
                    </select>
                </div>
                <div class="col-sm-6">
                    <a id="btninquiry" href="#" class="btn btn-info">
                        <i class="fa fa-search fa-2x" aria-hidden="true"></i>
                    </a>
                    <a id="btninput" href="#" class="btn btn-primary">
                        <i class="fa fa-keyboard-o fa-2x" aria-hidden="true"></i>
                    </a>
                    <a id="btndownload" href="#" class="btn btn-success">
                        <i class="fa fa-download fa-2x" aria-hidden="true"></i>
                    </a>
                </div>
            </div>
        </form>
    </div>
    <div class="col-sm-12" style="margin-top: 2em" id="result">
    </div>
</div>
<?php
$this->registerJs(
"
if($('#phiscalyear').val() != '')
    $('#phiscalyear').change();

$('#btninquiry').click(function() {
    $('#phiscalyear').change();
});        
$('#phiscalyear').change(function() {
        var year = $(this).val();
        if(year) {
            $.get('index.php?r=goverment-unit/report&phiscalyearid='+year, function(r) {
                $('#result').html(r);
            });
            $('#btninput').attr('href', 'index.php?r=goverment-unit/input&id='+year);
            $('#btndownload').attr('href', 'index.php?r=goverment-unit/download&id='+year);
        }
    });
        
    $('#btninput').click(function() {
        if($('#phiscalyear').val() != '')
            window.location.href = 'index.php?r=goverment-unit/input&id='+$('#phiscalyear').val();
    });  
"
);