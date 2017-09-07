<script type="text/javascript" src="js/jquery/jquery-3.2.1.js"></script>
<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model app\models\User */

$this->title = $model->username;
$this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'Users'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>

<div class="card">
    <div class="user-view">
    
    
        <p>
            <?= Html::a(Yii::t('app', 'Update'), ['update', 'id' => $model->id], ['class' => 'btn btn-primary']) ?>
            <?= Html::a(Yii::t('app', 'Delete'), ['delete', 'id' => $model->id], [
                'class' => 'btn btn-danger',
                'data' => [
                    'confirm' => Yii::t('app', 'Are you sure you want to delete this item?'),
                    'method' => 'post',
                ],
            ]) ?>
        </p>
    
        <?= DetailView::widget([
            'model' => $model,
            'attributes' => [            
                'username',
                'password',
                'firstname',
                'lastname',
                'status',
                'tel',
                'email:email',
                'deleted',
               
            ],
        ]) ?>
    
    </div>
    
    
    
    
	
	<div class="row">
		<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">	
	<a class="btn btn-info" id="demoNotify">Sample Notification</a>
    	</div>
	</div>
	<br/>
	<div class="row">
	<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
	<a class="btn btn-info" id="demoSwal">Sample Alert</a>
	</div>
	</div>
	
</div>


<script type="text/javascript">

$(document).ready(function(){

	
	$("#btn_assign").click(function(){  //"select all" change
	   
	});
	
	$("#btn_remove").click(function(){  //"select all" change
		   
	});

	
	//select all Available Role
	$("#select_all_available_role").change(function(){  //"select all" change
	    var status = this.checked; // "select all" checked status
	    $('.checkbox_available_role').each(function(){ //iterate all listed checkbox items
	        this.checked = status; //change ".checkbox" checked status
	    });
	});

	$('.checkbox_available_role').change(function(){ //".checkbox" change
	    //uncheck "select all", if one of the listed checkbox item is unchecked
	    if(this.checked == false){ //if this item is unchecked
	        $("#select_all_available_role")[0].checked = false; //change "select all" checked status to false
	    }
	   
	    //check "select all" if all checkbox items are checked
	    if ($('.checkbox_available_role:checked').length == $('.checkbox').length ){
	        $("#select_all_available_role")[0].checked = true; //change "select all" checked status to true
	    }
	});


	//select all select_all_assigned_role
	$("#select_all_assigned_role").change(function(){  //"select all" change
	    var status = this.checked; // "select all" checked status
	    $('.checkbox_assigned_role').each(function(){ //iterate all listed checkbox items
	        this.checked = status; //change ".checkbox" checked status
	    });
	});

	$('.checkbox_assigned_role').change(function(){ //".checkbox" change
	    //uncheck "select all", if one of the listed checkbox item is unchecked
	    if(this.checked == false){ //if this item is unchecked
	        $("#select_all_assigned_role")[0].checked = false; //change "select all" checked status to false
	    }
	   
	    //check "select all" if all checkbox items are checked
	    if ($('.checkbox_assigned_role:checked').length == $('.checkbox').length ){
	        $("#select_all_assigned_role")[0].checked = true; //change "select all" checked status to true
	    }
	});
	

	   
});

</script>


<script type="text/javascript">

	function notifySuccess(){
  	$.notify({
  		title: "Update Complete : ",
  		message: "Something cool is just updated!",
  		icon: 'fa fa-check' 
  	},{
  		type: "info"
  	});
	}
      $('#demoNotify').click(function(){
    	  notifySuccess();
      });
      $('#demoSwal').click(function(){
      	swal({
      		title: "Are you sure?",
      		text: "You will not be able to recover this imaginary file!",
      		type: "warning",
      		showCancelButton: true,
      		confirmButtonText: "Yes, delete it!",
      		cancelButtonText: "No, cancel plx!",
      		closeOnConfirm: false,
      		closeOnCancel: false
      	}, function(isConfirm) {
      		if (isConfirm) {
      			swal("Deleted!", "Your imaginary file has been deleted.", "success");
      		} else {
      			swal("Cancelled", "Your imaginary file is safe :)", "error");
      		}
      	});
      });
    </script>
    