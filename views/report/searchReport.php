<div class="card">
	<div class="row">
		<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">

			<div class="card-body">
				<table class="table table-hover table-bordered" id="report_table">

					<thead>
						<tr>
							<th style="text-align:center"><?php echo Yii::t("app","No.")?></th>
							<th><?php echo Yii::t("app","Table Name")?></th>
							<th><?php echo Yii::t("app","Department")?></th>


						</tr>
					</thead>
					<tbody>
				
				<?php if(count($models)>0): ?>
				<?php $sq=1; ?>
				<?php foreach ($models as $model): ?>
				
					<tr id="menu_id"
							data-value="<?php echo isset($model['id'])? $model['id']: ''; ?> ">

					<td style="text-align:center">
					<?php echo $sq++; ?>					
					</td>
							<td>
							<a href="index.php?r=<?php echo $model->url;?>">
							<i class="fa fa-calendar" style="color:green"></i>
						
							<?php echo isset($model["name"])? $model["name"]: ""; ?>
							</a>
							</td>
							<td>						
							<?php echo isset($model->department_name)? $model->department_name: ""; ?>
							</td>
							
					</tr>
				<?php endforeach;?>
				<?php else:?>
				
				<?php endif;?>
			</tbody>
			</table>
			</div>

		</div>
		<?php
// 		$this->render('tt', [
        
//     	]) 
		?>
    
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
var table = $('#report_table').DataTable(
	{
		"pagingType": "full_numbers",
		language: {
			 search: "<?php echo Yii::t("app","Search:");?>",
			 searchPlaceholder: "<?php echo Yii::t("app","Search keyword by static table name or department name");?>",
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
		//to hide colom in which garet is 2 in which department
	    "columnDefs": [
	         { "visible": false, "targets": 2 }
	    ],
	    //"order": [[ 2, 'asc' ]],
		"displayLength": 20,	    	               
		//Customize for group
		"drawCallback": function ( settings ) {
	        var api = this.api();
	        var rows = api.rows( {page:'current'} ).nodes();
	        var last=null;

	        api.column(2, {page:'current'} ).data().each( function ( group, i ) {
	            if ( last !== group ) {
	                $(rows).eq( i ).before(
	                    '<tr class="group"><td colspan="2">'+group+'</td></tr>'
	                );
	                last = group;
	            }
	        } );
	    }
		
	}	
			
);


$('.dataTables_filter input[type="search"]').
attr('placeholder','<?php echo Yii::t("app","Search keyword by static table name or department name");?>').
css({'height':'40px','width':'500px','display':'inline-block'});


// Order by the grouping
$('#report_table tbody').on( 'click', 'tr.group', function () {
    var currentOrder = table.order()[0];
    if ( currentOrder[0] === 2 && currentOrder[1] === 'asc' ) {
        table.order( [ 2, 'desc' ] ).draw();
    }
    else {
        table.order( [ 2, 'asc' ] ).draw();
    }
} );

</script>
<style>
tr.group,
tr.group:hover {
    background-color: #ddd !important;
}
</style>






