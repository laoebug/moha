
<?php
use yii\widgets\Pjax;
use yii\widgets\DetailView;
use yii\helpers\Html;
/* @var $this yii\web\View */
/* @var $searchModel app\models\MinistrySearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = Yii::t('app', 'Subordinate');
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="card">



	<div class="form-group">
    	<?= DetailView::widget([
            'model' => $model,
            'attributes' => [            
                'username',
                //'password',
                'firstname',
                'lastname',
                'status',
                'tel',
                'email:email',
            	[
            	'name'=>'province_id',
            	'label'=>Yii::t("app","Province"),
            	'value'=>!empty($model->province_id)?$model->province["province_name"]:" ",
            	'type'=>'raw'		
            	],	
              //  'deleted',               
                [
                    'name'=>'role',
                    'label'=> "ສິດໜ້າທີ່",
                    'value'=>$model->role["name"],
                    'type'=>'raw'
                ]
               
            ],
        ]) ?>
            
        
        <?= Html::button('<i class="fa fa-fw fa-save"></i>'. Yii::t('app', 'Save'), [
            'class' => 'btn btn-md btn-primary',            
             'title'=>Yii::t('app', 'Save'),
            'id'=>'btnSave','name'=>'btnSave'
        ]);
        ?>
    </div>


	<ul class="nav nav-tabs">
		<li class="active"><a data-toggle="pill" href="#subordinateList"><strong><?php echo Yii::t('app', 'Subordinate(s)') ?></strong></a></li>
		<li><a data-toggle="pill" href="#branchList"><?php echo Yii::t('app', 'Department(s)') ?></a></li>
		<li><a data-toggle="pill" href="#provinceList"><?php echo Yii::t('app', 'Province(s)') ?></a></li>
	</ul>

	<br/>
	<div class="tab-content">
		
			<div id="subordinateList" class="tab-pane fade in active">

				<?php
				echo Yii::$app->controller->renderPartial('_subordinateList', [
				        'model' => $model
				    ]) 
				?>								               
			</div>
			
			<div id="branchList" class="tab-pane fade">
				<?php
				echo Yii::$app->controller->renderPartial('_branchList', [
				        'model' => $model
				    ]) 
				?>								               
			</div>
			
			<div id="provinceList" class="tab-pane fade">
				<?php
				echo Yii::$app->controller->renderPartial('_provinceList', [
				        'model' => $model
				    ]) 
				?>								               
			</div>
			
		
		</div>

</div>




<script src="js/jquery-2.1.4.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/plugins/pace.min.js"></script>
<script src="js/main.js"></script>
<script type="text/javascript" src="js/plugins/jquery.dataTables.min.js"></script>

<script type="text/javascript" src="js/plugins/dataTables.bootstrap.min.js"></script>
    
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/plugins/bootstrap-notify.min.js"></script>
<script type="text/javascript">

var table_branch = $('#_branch_table').DataTable({'paging': false});

$('#_branch_table tbody').on( 'click', 'tr', function () {

		var data = table_branch.row( this ).data() ;

	 if ( $(this).hasClass('selected') ) {
         $(this).removeClass('selected');
     }
     else {
    	 table_branch.$('tr.selected').removeClass('selected');
         $(this).addClass('selected');
     }

} );


var table_user = $('#_user_table').DataTable({'paging': false});

$('#_user_table tbody').on( 'click', 'tr', function () {

		var data = table_user.row( this ).data() ;

	 if ( $(this).hasClass('selected') ) {
         $(this).removeClass('selected');
     }
     else {
    	 table_user.$('tr.selected').removeClass('selected');
         $(this).addClass('selected');
     }

} );


var table_user_province = $('#_province_table').DataTable({'paging': false});

$('#_province_table tbody').on( 'click', 'tr', function () {

		var data = table_user_province.row( this ).data() ;

	 if ( $(this).hasClass('selected') ) {
         $(this).removeClass('selected');
     }
     else {
    	 table_user_province.$('tr.selected').removeClass('selected');
         $(this).addClass('selected');
     }

} );




$('#check-all-user').click(function () {
	if($(this).is(':checked',true))  
    {	  
        $(".user_id").prop('checked', true);  
    }  
    else  
    { 
        $(".user_id").prop('checked',false);  
    }  
});

$('#check-all-branch').click(function () {
	if($(this).is(':checked',true))  
    {	  
        $(".branch_id").prop('checked', true);  
    }  
    else  
    { 
        $(".branch_id").prop('checked',false);  
    }  
});

$('#check-all-province').click(function () {
	if($(this).is(':checked',true))  
    {	  
        $(".province_id").prop('checked', true);  
    }  
    else  
    { 
        $(".province_id").prop('checked',false);  
    }  
});

checkAll();
function checkAll(){
	var numberOfUserCheckBoxes = $('.user_id').length;
	var userChildCheckBox = $('.user_id:checked').length;
	if (userChildCheckBox == numberOfUserCheckBoxes)
	     $("#check-all-user").prop('checked', true);
	  else
	     $("#check-all-user").prop('checked', false);

	var numberOfBranchCheckBoxes = $('.branch_id').length;
	var branchChildCheckBox = $('.branch_id:checked').length;
	if (branchChildCheckBox == numberOfBranchCheckBoxes)
	     $("#check-all-branch").prop('checked', true);
	  else
	     $("#check-all-branch").prop('checked', false);


	var numberOfProvinceCheckBoxes = $('.province_id').length;
	var provinceChildCheckBox = $('.province_id:checked').length;
	if (provinceChildCheckBox == numberOfProvinceCheckBoxes)
	     $("#check-all-province").prop('checked', true);
	  else
	     $("#check-all-province").prop('checked', false);
    
}


$('.user_id').change(function () {
	checkAll();
});

$('.branch_id').change(function () {
	checkAll();
});

$('.province_id').change(function () {
	checkAll();
});


$("#btnSave").click(function(){
	
	var url =  "index.php?r=user/subordinateandbranch&id=<?php echo isset($_GET["id"])?$_GET["id"]:""; ?>";
	var user_id=<?php echo isset($_GET["id"])?$_GET["id"]:""; ?>;
	var myUser_idList = new Array();

	$("input[id^=user_id]:checked").each(function() {
		myUser_idList.push($(this).val());
	});

	var myBranch_idList = new Array();

	$("input[id^=branch_id]:checked").each(function() {
		myBranch_idList.push($(this).val());
	});

	var myProvince_idList = new Array();

	$("input[id^=province_id]:checked").each(function() {
		myProvince_idList.push($(this).val());
	});

	
	$.post(
		url,
		{ 
		"myBranch_idList":myBranch_idList,
		"myUser_idList":myUser_idList,
		"myProvince_idList":myProvince_idList,
		"user_id":user_id		 
 		}, 
 		function(data,status,xhr){ //jQuery Ajax post					
			 if(status=='success'){
				
				 notifySuccess();
				 //location.reload();
									
			 } 	
 			 			
 		}).done(function() {
 		  }).fail(function() { 			   
 		  }).always(function() {	 			     	 			
 		});
    
});


function notifySuccess() {
  	$.notify({
  		title: "Success : ",
  		message: "<?php echo Yii::t('app','Data has been save success fully!'); ?>",
  		icon: 'fa fa-check' 
  	},{
  		type: "info"
  	});
}


</script>       
          