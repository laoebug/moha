<?php
// 	if(Yii::$app->user->isGuest){
// 		return Yii::$app->getResponse()->redirect('index.php?r=site/login');
// 	}

?>
<?php

/* @var $this \yii\web\View */

/* @var $content string */

use app\components\TopMenuWidget;
use app\components\BreacrumbWidget;
?>
<?php $this->beginPage() ?>
<!DOCTYPE html>
<html lang="<?= Yii::$app->language ?>">
<head>
    <meta charset="<?= Yii::$app->charset ?>">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <?= \yii\helpers\Html::csrfMetaTags() ?>
    <link rel="stylesheet" type="text/css" href="css/main.css">
    <link rel="stylesheet" type="text/css" href="css/font-awesome.css">
    <link rel="stylesheet" href="css/datetimepicker.css"/>
    <link rel="stylesheet" type="text/css" href="css/style.css">

    <title>ກະຊວງພາຍໃນ - <?= \yii\helpers\Html::encode($this->title) ?></title>
    <style type="text/css">
        .table-responsive {
            max-height: 800px;
        }

        .selected {
            background-color: #85C1E9;
        }

        .dropdown-submenu {
            position: relative;
        }

        .dropdown-submenu > .dropdown-menu {
            top: 0;
            left: 100%;
            margin-top: -6px;
            margin-left: -1px;
            -webkit-border-radius: 0 6px 6px 6px;
            -moz-border-radius: 0 6px 6px;
            border-radius: 0 6px 6px 6px;
            overflow-y: scroll;
            max-height: 200px;
        }

        .dropdown-submenu:hover > .dropdown-menu {
            display: block;
        }

        .dropdown-submenu > a:after {
            display: block;
            content: " ";
            float: right;
            width: 0;
            height: 0;
            border-color: transparent;
            border-style: solid;
            border-width: 5px 0 5px 5px;
            border-left-color: #ccc;
            margin-top: 5px;
            margin-right: -10px;

        }

        .dropdown-submenu:hover > a:after {
            border-left-color: #fff;
        }

        .dropdown-submenu.pull-left {
            float: none;
        }

        .dropdown-submenu.pull-left > .dropdown-menu {
            left: -100%;
            margin-left: 10px;
            -webkit-border-radius: 6px 0 6px 6px;
            -moz-border-radius: 6px 0 6px 6px;
            border-radius: 6px 0 6px 6px;
        }

        .navbar-custom-menu > .nav.navbar-nav > li > a {
            color: #ffffff;
        }
    </style>
</head>
<body class="sidebar-mini fixed">

<?php $this->beginBody() ?>
<div class="wrapper">
    <!-- Navbar-->
    <header class="main-header hidden-print">
        <!--        <a class="logo" href="index.php"><span style="font-size: 50%">ໜ້າຫຼັກ</span>-->
        <!--        </a>-->
        <nav class="navbar navbar-static-top" style="margin-left: 0px">
            <div class="navbar-custom-menu">
                <ul class="nav navbar-nav">
                    <?php
                    if (!Yii::$app->user->isGuest) {
                        TopMenuWidget::begin();
                        TopMenuWidget::end();
                    }
                    ?>
                </ul>

                <ul class="top-nav">
                    <!--Notification Menu-->
                    <li class="dropdown notification-menu">
                        <a class="dropdown-toggle" href="#" data-toggle="dropdown" aria-expanded="false">
                            <i class="fa fa-bell-o fa-lg"></i> ແຈ້ງການ
                        </a>
                        <ul class="dropdown-menu">
                            <?php
                            foreach (Yii::$app->session->get('notices', []) as $i => $notice):
                                if ($i > 5) break;
                                ?>
                                <li>
                                    <a class="media" href="index.php?r=site/notice&id=<?= $notice['id'] ?>">
                                        <span class="media-left media-icon">
                                            <span class="fa-stack fa-lg">
                                                <i class="fa fa-circle fa-stack-2x text-primary"></i>
                                                <i class="fa fa-newspaper-o fa-stack-1x fa-inverse"></i>
                                            </span>
                                        </span>
                                        <div class="media-body">
                                            <span class="block"><?= $notice['title'] ?></span>
                                            <span class="text-muted block"><?= $notice['created_date'] ?></span>
                                        </div>
                                    </a>
                                </li>
                                <?php
                            endforeach;
                            ?>
                            <li class="not-head">
                                <a href="index.php?r=site/notices">
                                    ແຈ້ງການທັງໝົດ
                                </a>
                            </li>
                        </ul>
                    </li>
                    <li class="dropdown notification-menu">
                        <a class="dropdown-toggle" href="manual.pdf" data-toggle="dropdown" aria-expanded="false">
                            <i class="fa fa-download fa-lg"></i> ຄູ່ມືນໍາໃຊ້
                        </a>
                    </li>
                    <li class="dropdown">
                        <a class="dropdown-toggle" href="#" data-toggle="dropdown" role="button"
                           aria-haspopup="true" aria-expanded="false">
                            <i class="fa fa-user fa-lg"></i>
                            <?= Yii::$app->user->identity->username ?>
                        </a>
                        <ul class="dropdown-menu settings-menu">
                            <li><a href="index.php?r=site/changepassword"><i class="fa fa-cog fa-lg"></i> ປ່ຽນລະຫັດຜ່ານ</a>
                            </li>
                            <li><a href="index.php?r=site/profile"><i class="fa fa-user fa-lg"></i> ຂໍ້ມູນຜູ້ໃຊ້</a>
                            </li>
                            <li><a href="index.php?r=site/logout"><i class="fa fa-sign-out fa-lg"></i> ອອກຈາກລະບົບ</a>
                            </li>
                        </ul>
                    </li>
                </ul>
            </div>
        </nav>
    </header>
    <div class="content-wrapper">
        <div class="page-title">
            <div class="hidden">
                <h1><i class="fa fa-dashboard"></i> <?= $this->title ?></h1>
                <p><?= isset($this->subtitle) ? $this->subtitle : "" ?></p>
            </div>
            <?php if(isset($_GET['menu']) && $_GET['menu']!=0): ;?>
            <?php 
            	//to initial Wideget menu data
	            BreacrumbWidget::begin();
				BreacrumbWidget::end();
			?>
			<?php endif;?>
            <div>
                <?=
                \yii\widgets\Breadcrumbs::widget([
                    'homeLink' => [
                        'label' => 'ໜ້າຫຼັກ',
                        'url' => ['site/index'],
                    ],
                    'links' => isset($this->params['breadcrumbs']) ? $this->params['breadcrumbs'] : [],
                ])
                ?>
            </div>
          
        </div>
        <div class="row">
            <?php
            foreach (Yii::$app->session->getAllFlashes() as $key => $flash) : ?>
                <div class="alert alert-<?= $key ?>"><?= $flash ?></div>
                <?php
            endforeach;
            ?>
            <?= $content ?>
        </div>
    </div>
</div>

<div style="position: fixed;bottom: 0;background-color: #009688;width: 100%">
    <p style="padding-top: 5px;color: #ffffff;margin-bottom: 2px;" class="text-center">
        ກົມແຜນການ ແລະ ການຮ່ວມມື, ສະຫງວນລິຂະສິດ &copy; <?= date('Y') ?>
    </p>
</div>

<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/plugins/pace.min.js"></script>
<script type="text/javascript" src="js/main.js"></script>
<script type="text/javascript" src="js/plugins/bootstrap-notify.min.js"></script>
<script type="text/javascript" src="js/plugins/sweetalert.min.js"></script>
<script type="text/javascript" src="js/plugins/bootstrap-datepicker.min.js"></script>
<script type="text/javascript" src="js/plugins/chart.js"></script>
<script type="text/javascript" src="js/plugins/select2.min.js"></script>
<script type="text/javascript">
  $('.datepicker').datepicker({
    format: "dd-mm-yyyy",
    autoclose: true,
    todayHighlight: true
  });
</script>
<?php
$this->endBody() ?>
</body>
</html>
<?php $this->endPage() ?>
