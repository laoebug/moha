
<?php
use yii\helpers\Html;
//use yii\grid\GridView;
use yii\widgets\Pjax;
/* @var $this yii\web\View */
/* @var $searchModel app\models\UserSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = Yii::t('app', 'Authenticaton & Authorization');
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="card">

	<div class="row">
		<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
		<?php Pjax::begin(); ?>
			<?= Html::a("Refresh", ['authentication/index'], ['class' => 'btn btn-lg btn-primary']);?>
			<h1>Current time: <?= $time ?></h1>
			
                
		<?php Pjax::end(); ?>
		</div>
	</div>

</div>



			  <?= 
			  $this->render('tree', [
                   // 'model' => $model
                ]) ?>
                
                
<!-- ----END ND START -->                




<html>
<head>
    <meta charset="utf-8" />
    <title>Bootstrap TreeView with Checkboxes</title>
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script src="http://code.gijgo.com/1.5.1/js/gijgo.js" type="text/javascript"></script>
    <link href="http://code.gijgo.com/1.5.1/css/gijgo.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <style>
        .row {
            margin: 10px;
        }
    </style>
</head>
<body>
    <div class="container-fluid">
        <div class="row">
            <button id="btnSave" class="btn btn-default">Save Checked Nodes</button>
        </div>
        <div class="row">
            <div id="tree"></div>
        </div>
    </div>
    <script type="text/javascript">
            $(document).ready(function () {
                var tree = $('#tree').tree({
                    primaryKey: 'id',
                    uiLibrary: 'bootstrap',
                    dataSource:
                        [
                         
                         ] 
                        ,
                    checkboxes: true
                });
                $('#btnSave').on('click', function () {
                    var checkedIds = tree.getCheckedNodes();
                    $.ajax({ url: '/Locations/SaveCheckedNodes', data: { checkedIds: checkedIds }, method: 'POST' })
                        .fail(function () {
                            alert('Failed to save.');
                        });
                });
            });
    </script>
</body>
</html>


