
<?php
use yii\widgets\Pjax;
/* @var $this yii\web\View */
/* @var $searchModel app\models\MinistrySearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = Yii::t('app', 'User Control');
$this->params['breadcrumbs'][] = $this->title;
?>


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
			<?php 
                echo $this->render('_formRole', [
                        'model' => $model
                    ]) 
			?>            
                     
            </div>
            
            <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
            	
            	<?php 
            echo Yii::$app->controller->renderPartial('_formManageMenuRole', [
            'models'=>$models,
            'menuList'=>$menuList
        ]) 
        ?>
            	
            </div>
    </div>	
    <br/>
    
    <div class="row">
	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
		<?php 
//             echo Yii::$app->controller->renderPartial('_formManageMenuRole', [
//             'models'=>$models,
//             'menuList'=>$menuList
//         ]) 
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

var table = $('#role_table').DataTable(
				
);

$('#role_table tbody').on( 'click', 'tr', function () {
	 if ( $(this).hasClass('selected') ) {
         $(this).removeClass('selected');
     }
     else {
         table.$('tr.selected').removeClass('selected');
         $(this).addClass('selected');
     }
		   
	var urlMenu =  "index.php?r=user/listmenu";
	
	$.post(
		urlMenu,
		{ 
		"role_id":$(this).data('value')
 		}, 
 		function(data,status,xhr){ //jQuery Ajax post	
			$("#menu_list").empty();	
			$("#menu_list").append(data);		
 		}).done(function() {
 		  }).fail(function() {
 			   
 		  })
 		  .always(function() {
 		    //alert( "finished" );		
				 			     	 			
 		  });

	var urlAction =  "index.php?r=user/listaction";
	
	$.post(
			urlAction,
		{ 
		"role_id":$(this).data('value')
 		}, 
 		function(data,status,xhr){ //jQuery Ajax post	
			$("#action_list").empty();	
			$("#action_list").append(data);		
 		}).done(function() {
 		  }).fail(function() {
 			   
 		  })
 		  .always(function() {
 		    //alert( "finished" );		
				 			     	 			
 		  });
} );



$("#btnAddRole").click(function(){
	
	var url =  "index.php?r=user/addrole";
	
	$.post(
		url,
		{ 
		 "role_name":$("#role_name").val()
 		}, 
 		function(data,status,xhr){ //jQuery Ajax post		
 			if(status=='success'){
				 location.reload();

			 } 	 					
 		}).done(function() {
 		  }).fail(function() { 			   
 		  }).always(function() {	 			     	 			
 		});
    
});
$("#btnSaveMenuAndAction").click(function(){
	
	var url =  "index.php?r=user/savemenuandaction";

	var myActionList = new Array();

	$("input[id^=actionList]:checked").each(function() {
		myActionList.push($(this).val());
	});

	var myMenuList = new Array();

	$("input[id^=menuList]:checked").each(function() {
		myMenuList.push($(this).val());
	});
	

	
	$.post(
		url,
		{ 
		"theActionIdList":myActionList,
		"theMenuIdList":myMenuList,
		"role_id":$("#the_role_id").val()
		/*
		data: $('#menu_action_form').serialize()
		data: $('#menu_action_form').serializeArray()
		*/			
 		}, 
 		function(data,status,xhr){ //jQuery Ajax post		
 			//location.reload();
//  			 console.log(data);
			 if(status=='success'){
				 location.reload();
				// notifySuccess();
			 } 	
 			 			
 		}).done(function() {
 		  }).fail(function() { 			   
 		  }).always(function() {	 			     	 			
 		});
    
});


function clearInpuData() {
 	$("#role_name").val("");	
}

$("#btnNew").click(function(){				
	clearInpuData();		
});
</script>








          
          