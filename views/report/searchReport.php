<div class="card">
	<div class="row">
		<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">


			<div class="card-body">
				<table class="table table-hover table-bordered" id="role_table">
					<thead>
						<tr>
							<th><?php echo Yii::t("app","No.")?></th>
							<th><?php echo Yii::t("app","Role Name")?></th>
							<th><?php echo Yii::t("app","Created Date Time")?></th>
							<th style="text-align: center"><?php echo Yii::t("app","Is Province")?></th>

						</tr>
					</thead>
					<tbody>
				
				<?php if(count($models)>0): ?>
				<?php $sq=1; ?>
				<?php foreach ($models as $model): ?>
				
				<tr id="role_id"
							data-value="<?php echo isset($model['id'])? $model['id']: ''; ?> ">

							<td>
					<?php echo $sq++; ?>					
					</td>
							<td><?php echo isset($model["name"])? $model["name"]: ""; ?></td>
							<td><?php echo isset($model["input_dt_stamp"])? $model["input_dt_stamp"]: ""; ?></td>
							<td style="text-align: center" id="is_the_province"
								data-is_the_province="<?php echo isset($model["is_province"])? $model["is_province"]: ""; ?>">
				<?php echo (isset($model["is_province"]) && $model["is_province"] ==1)? "Yes": "No"; ?>
				</td>
						</tr>
				<?php endforeach;?>
				<?php else:?>
				
				<?php endif;?>
			</tbody>
				</table>
			</div>
			
			
			<div class="card-body">
				<?php 
            echo Yii::$app->controller->renderPartial('rg', [
            
        ]) 
        ?>
			</div>


		</div>
	</div>
</div>

  
        


<script src="js/jquery-2.1.4.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/plugins/pace.min.js"></script>
<script src="js/main.js"></script>
<script type="text/javascript" src="js/plugins/jquery.dataTables.min.js"></script>
<script type="text/javascript"
	src="js/plugins/dataTables.bootstrap.min.js"></script>

<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/plugins/bootstrap-notify.min.js"></script>


<script type="text/javascript">

var table = $('#role_table').DataTable(
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

$('#role_table tbody').on( 'click', 'tr', function () {
	 if ( $(this).hasClass('selected') ) {
         $(this).removeClass('selected');
     }
     else {
         table.$('tr.selected').removeClass('selected');
         $(this).addClass('selected');
     }
     	 
	 var data = table.row( this ).data() ;
	 $('#the_role_id').val($(this).data('value'));	
	 $('#role_name').val(data[1]);
	 var currentRow = $(this).closest("tr");
	 $('#is_province').val(currentRow.find("td:eq(3)").attr('data-is_the_province'));
	 if($('#is_province').val()==1){
	 	$('#is_province').prop('checked', true);
	 }else{
		 $('#is_province').prop('checked', false); 
	 }
	var urlMenu =  "index.php?r=user/listmenu";
	
	$.post(
		urlMenu,
		{ 
		"role_id":$(this).data('value'),
		"is_province":$('#is_province').val()
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


$("#is_province").change(function(){
	isCheckorNot();	
});
isCheckorNot();
function isCheckorNot() {
	if($('#is_province').is(":checked")) {
		$('#is_province').val(1);
	}else{
		$('#is_province').val(0);
	}
	
}

$("#btnAddRole").click(function(){	
	var url =  "index.php?r=user/addrole";
	
	$.post(
		url,
		{ 
		 "role_name":$("#role_name").val(),
		"is_province":$("#is_province").val()
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
$("#btnUpdateRole").click(function(){	
	var url =  "index.php?r=user/updaterole";
	$.post(
		url,
		{ 
		 "role_name":$("#role_name").val(),
		 "id":$("#the_role_id").val(),
		 "is_province":$("#is_province").val()
		 
 		}, 
 		function(data,status,xhr){ //jQuery Ajax post
 	 		console.log(data);		
 			if(status=='success'){
				 location.reload();

			 } 	 					
 		}).done(function() {
 		  }).fail(function() { 			   
 		  }).always(function() {	 			     	 			
 		});
    
});

$("#btnDeleteRole").click(function(){	
	var url =  "index.php?r=user/deleterole";
	$.post(
		url,
		{ 		 
		 "id":$("#the_role_id").val()		 
 		}, 
 		function(data,status,xhr){ //jQuery Ajax post
 	 		console.log(data);		
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
	$("#the_role_id").val("");
 	$("#role_name").val("");
	$("#is_province").val("");	
}

$("#btnNew").click(function(){				
	clearInpuData();		
});
</script>









<script type="text/javascript">
    $(document).ready(function() {
    var table = $('#example').DataTable({
        "columnDefs": [
            { "visible": false, "targets": 2 }
        ],
        "order": [[ 2, 'asc' ]],
        "displayLength": 25,
        "drawCallback": function ( settings ) {
            var api = this.api();
            var rows = api.rows( {page:'current'} ).nodes();
            var last=null;
 
            api.column(2, {page:'current'} ).data().each( function ( group, i ) {
                if ( last !== group ) {
                    $(rows).eq( i ).before(
                        '<tr class="group"><td colspan="5">'+group+'</td></tr>'
                    );
 
                    last = group;
                }
            } );
        }
    } );
 
    // Order by the grouping
    $('#example tbody').on( 'click', 'tr.group', function () {
        var currentOrder = table.order()[0];
        if ( currentOrder[0] === 2 && currentOrder[1] === 'asc' ) {
            table.order( [ 2, 'desc' ] ).draw();
        }
        else {
            table.order( [ 2, 'asc' ] ).draw();
        }
    } );
} );

    </script>
    