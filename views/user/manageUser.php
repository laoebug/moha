<?php $_GET['menu']=1;?>
<?php

use yii\widgets\Pjax;

/* @var $this yii\web\View */
/* @var $searchModel app\models\MinistrySearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = Yii::t('app', 'User Control');
// $this->params['breadcrumbs'][] = $this->title;
?>
<div class="card">
<?php Pjax::begin(); ?>   
<?= Yii::$app->controller->renderPartial('_userList', [
        'models' => $models
    ]) 
?>

<?php Pjax::end(); ?>

<?= Yii::$app->controller->renderPartial('_form', [
        'model' => $model
    ]) 
?>
</div>




	<script src="js/jquery-2.1.4.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/plugins/pace.min.js"></script>
    <script src="js/main.js"></script>
    <script type="text/javascript" src="js/plugins/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="js/plugins/dataTables.bootstrap.min.js"></script>
    
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
    
<script type="text/javascript">

var table = $('#_user_table').DataTable(
		{
			"pagingType": "full_numbers",
			language: {
				 search: "<?php echo Yii::t("app","Search:");?>",
				 searchPlaceholder: "<?php echo Yii::t("app","Search Keyword");?>",
				 "lengthMenu":"<?php echo Yii::t("app","Display"); ?> _MENU_ <?php echo Yii::t("app","records"); ?> <?php echo Yii::t("app","per"); ?> <?php echo Yii::t("app","page"); ?>",
		         "zeroRecords": "<?php echo Yii::t("app","Sorry , Nothing found"); ?>",
		         "info":"<?php echo Yii::t("app","Showing");?> _START_ <?php echo Yii::t("app","to");?> _END_ <?php echo Yii::t("app","of");?> _TOTAL_ <?php echo Yii::t("app","entries");?>",
		         "infoEmpty":"<?php echo Yii::t("app","No records available"); ?>",
		         "infoFiltered":"<?php echo Yii::t("app","filtered from"); ?> _MAX_ <?php echo Yii::t("app","total records"); ?>",
		         "paginate": {
		        	 "first": "<?php echo Yii::t("app","First"); ?> ",
		        	 "last": "<?php echo Yii::t("app","Last"); ?> ",
		        	 "previous": "<?php echo Yii::t("app","Previous"); ?> ",
		             "next": "<?php echo Yii::t("app","Next"); ?> "
		          }	        			  
			},
		}		
);

$('#_user_table tbody').on( 'click', 'tr', function () {

	
	
	var data = table.row( this ).data() ;
	//console.log(data[0]);
	//console.log(data);

	 if ( $(this).hasClass('selected') ) {
         $(this).removeClass('selected');
     }
     else {
         table.$('tr.selected').removeClass('selected');
         $(this).addClass('selected');
     }
		 
	
	 $('#the_user_id').val($(this).data('value'));
	 $('#username').val(data[1]);
	 $('#firstname').val(data[2]);
	 $('#lastname').val(data[3]);
	 $('#status').val(data[4]);
	 $('#tel').val(data[5]);
	 $('#email').val(data[6]);
	 var currentRow = $(this).closest("tr");
	 var role_id=currentRow.find("td:eq(7)").attr('data-role_id');	  		
	$('#role').val(role_id).attr("selected", "selected");

} );



function clearInpuData() {
	$("#the_user_id").val("");	
// 	$("#ptclean" ).prop( "checked", false );
// 	$("#ptdirty" ).prop( "checked", false );
	$("#username").val("");
	$("#password").val("");	
	$("#firstname").val("");
	$("#lastname").val("");
	$("#status").val("");
	$("#status").removeClass('selected');
	$("#tel").val("");
	$("#email").val("");
	$("#role").val("");
	$("#role").removeClass('selected');	
	
}

$("#btnNew").click(function(){				
	clearInpuData();		
});



</script>





          
          