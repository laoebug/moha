<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- CSS-->
    <link rel="stylesheet" type="text/css" href="css/main.css">
    <!-- Font-icon css-->
    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <title>ກະຊວງພາຍໃນ - ເຂົ້າສູ່ລະບົບ</title>
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries-->
    <!--if lt IE 9
    script(src='https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js')
    script(src='https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js')
    -->
</head>
<body>
<?= $content ?>
 
<div style="position: fixed;bottom: 0;background-color: #009688;width: 100%">
    
	    <div class="col-xs-12 col-sm-12 col-md-3 col-lg-3">
	    &nbsp;
	    </div>
    	<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
    	<p style="padding-top: 5px;color: #ffffff;margin-bottom: 2px;" class="text-center">
        ກົມແຜນການ ແລະ ການຮ່ວມມື, ສະຫງວນລິຂະສິດ &copy; <?= date('Y') ?>
        </p>
   		</div>
    <div class="col-xs-12 col-sm-12 col-md-3 col-lg-3">
    	<p style="padding-top: 5px;color: #ffffff;margin-bottom: 2px;" class="text-center">
        <?= Yii::t('app', 'Designed & Developed by ') ?>
      <a href="http://akatsolution.com" target="_blank" style="color: #49FF33;;">
          <?= Yii::t('app', 'AKAT Solution') ?>
      </a>
     </p>    
   </div>       
</div>

 

</body>
<script src="js/jquery-2.1.4.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/plugins/pace.min.js"></script>
<script src="js/main.js"></script>
</html>