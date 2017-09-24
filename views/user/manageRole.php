
<?php
use yii\widgets\Pjax;
/* @var $this yii\web\View */
/* @var $searchModel app\models\MinistrySearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = Yii::t('app', 'User Control');
$this->params['breadcrumbs'][] = $this->title;
?>


</div>
<div class="card">
    <div class="row">
    		<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">		
    		
            <?php Pjax::begin(); ?>   
            <?php 
            echo $this->render('_roleList', [
                    'models' => $models
                ]) 
            ?>
            
            <?php Pjax::end(); ?>        
            </div>
            
            <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
            	
            	<?php 
                echo $this->render('_formRole', [
                        'model' => $model
                    ]) 
                ?>
            	
            </div>
    </div>	
    <br/>
    
    <div class="row">
	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
		<?php 
            echo Yii::$app->controller->renderPartial('_formManageMenuRole', [
        ]) 
        ?>
            	
	</div>
	</div>
		
</div>		



<!-- Javascripts-->
<script src="js/jquery-2.1.4.min.js"></script>
<!-- <script type="text/javascript" src="js/jquery/jquery-3.2.1.js"></script> -->
<script src="js/bootstrap.min.js"></script>
<script src="js/plugins/pace.min.js"></script>
<script type="text/javascript" src="js/plugins/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="js/plugins/dataTables.min.js"></script>
<script type="text/javascript" src="js/plugins/dataTables.bootstrap.min.js"></script>

<script type="text/javascript">

var table = $('#role_table').DataTable(
				
);

// $('#role_table tbody').on( 'click', 'tr', function () {

	
	
// 	var data = table.row( this ).data() ;
// 	//console.log(data[0]);
// 	//console.log(data);

// 	 if ( $(this).hasClass('selected') ) {
//          $(this).removeClass('selected');
//      }
//      else {
//          table.$('tr.selected').removeClass('selected');
//          $(this).addClass('selected');
//      }
		 
	
// 	 $('#the_user_id').val($(this).data('value'));
// 	 $('#username').val(data[1]);
// 	 $('#firstname').val(data[2]);
// 	 $('#lastname').val(data[3]);
// 	 $('#status').val(data[4]);
// 	 $('#tel').val(data[5]);
// 	 $('#email').val(data[6]);
// 	 var currentRow = $(this).closest("tr");
// 	 var role_id=currentRow.find("td:eq(7)").attr('data-role_id');	  		
// 	$('#role').val(role_id).attr("selected", "selected");

// } );



function clearInpuData() {
// 	$("#the_user_id").val("");	
// // 	$("#ptclean" ).prop( "checked", false );
// // 	$("#ptdirty" ).prop( "checked", false );
// 	$("#username").val("");
// 	$("#password").val("");	
// 	$("#firstname").val("");
// 	$("#lastname").val("");
// 	$("#status").val("");
// 	$("#status").removeClass('selected');
// 	$("#tel").val("");
// 	$("#email").val("");
// 	$("#role").val("");
// 	$("#role").removeClass('selected');	
	
}

// $("#btnNew").click(function(){				
// 	clearInpuData();		
// });



</script>





          
          