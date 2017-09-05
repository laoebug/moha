<?php

/* @var $this \yii\web\View */
/* @var $content string */

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

    <title><?= \yii\helpers\Html::encode($this->title) ?></title>
</head>
<body class="sidebar-mini fixed">

<?php $this->beginBody() ?>
<div class="wrapper">
    <!-- Navbar-->
    <header class="main-header hidden-print"><a class="logo" href="index.php"><?= Yii::$app->name ?></a>
        <nav class="navbar navbar-static-top">
            <!-- Sidebar toggle button--><a class="sidebar-toggle" href="#" data-toggle="offcanvas"></a>
            <!-- Navbar Right Menu-->
            <div class="navbar-custom-menu">
                <ul class="top-nav">
                    <!--Notification Menu-->
                    <li class="dropdown notification-menu">
                        <a class="dropdown-toggle" href="#" data-toggle="dropdown" aria-expanded="false"><i class="fa fa-bell-o fa-lg"></i></a>
                        <ul class="dropdown-menu">
                            <li class="not-head">You have 4 new notifications.</li>
                            <li><a class="media" href="javascript:;"><span class="media-left media-icon"><span class="fa-stack fa-lg"><i class="fa fa-circle fa-stack-2x text-primary"></i><i class="fa fa-envelope fa-stack-1x fa-inverse"></i></span></span>
                                    <div class="media-body"><span class="block">Lisa sent you a mail</span><span class="text-muted block">2min ago</span></div></a></li>
                            <li><a class="media" href="javascript:;"><span class="media-left media-icon"><span class="fa-stack fa-lg"><i class="fa fa-circle fa-stack-2x text-danger"></i><i class="fa fa-hdd-o fa-stack-1x fa-inverse"></i></span></span>
                                    <div class="media-body"><span class="block">Server Not Working</span><span class="text-muted block">2min ago</span></div></a></li>
                            <li><a class="media" href="javascript:;"><span class="media-left media-icon"><span class="fa-stack fa-lg"><i class="fa fa-circle fa-stack-2x text-success"></i><i class="fa fa-money fa-stack-1x fa-inverse"></i></span></span>
                                    <div class="media-body"><span class="block">Transaction xyz complete</span><span class="text-muted block">2min ago</span></div></a></li>
                            <li class="not-footer"><a href="#">See all notifications.</a></li>
                        </ul>
                    </li>
                    <!-- User Menu-->
                    <li class="dropdown"><a class="dropdown-toggle" href="#" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><i class="fa fa-user fa-lg"></i></a>
                        <ul class="dropdown-menu settings-menu">
                            <li><a href="page-user.html"><i class="fa fa-cog fa-lg"></i> Settings</a></li>
                            <li><a href="page-user.html"><i class="fa fa-user fa-lg"></i> Profile</a></li>
                            <li><a href="index.php?r=site/logout"><i class="fa fa-sign-out fa-lg"></i> Logout</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </nav>
    </header>
    <!-- Side-Nav-->
    <aside class="main-sidebar hidden-print">
        <section class="sidebar">
            <div class="user-panel">
                <div class="pull-left image">
                    <img class="img-circle" src="images/user.png" alt="User Image">
                </div>
                <div class="pull-left info">
                    <p><?= Yii::$app->user->identity->username ?></p>
                    <p class="designation"><?= Yii::$app->user->identity->firstname ?></p>
                </div>
            </div>
            <!-- Sidebar Menu-->
            <ul class="sidebar-menu">
                <li class=""><a href="index.php"><i class="fa fa-dashboard"></i><span><?= Yii::t('app','Dashboard') ?></span></a></li>
                <li class="treeview"><a href="#"><i class="fa fa-laptop"></i><span><?= Yii::t('app','Statistics') ?></span><i class="fa fa-angle-right"></i></a>
                    <ul class="treeview-menu">
                        <li><a href="index.php?r=ministry"><i class="fa fa-circle-o"></i> <?= Yii::t('app', 'Ministry') ?></a></li>
                        <li><a href="index.php?r=stat-goverment-unit"><i class="fa fa-circle-o"></i> <?= Yii::t('app', 'Goverment Units') ?></a></li>
                        <li><a href="index.php?r=stat-single-gateway-implementation"><i class="fa fa-circle-o"></i> <?= Yii::t('app', 'Single Gateway Implementations') ?></a></li>
                        <li><a href="index.php?r=stat-legal"><i class="fa fa-circle-o"></i> <?= Yii::t('app', 'Legals') ?></a></li>
                    </ul>
                </li>
                <li class="treeview"><a href="#"><i class="fa fa-laptop"></i><span><?= Yii::t('app','Administration') ?></span><i class="fa fa-angle-right"></i></a>
                    <ul class="treeview-menu">
                        <li><a href="index.php?r=phiscal-year"><i class="fa fa-circle-o"></i> <?= Yii::t('app', 'Phiscal Year') ?></a></li>
                        <li><a href="index.php?r=branch-group"><i class="fa fa-circle-o"></i> <?= Yii::t('app', 'Ministry Group') ?></a></li>
                        <li><a href="index.php?r=legal-type"><i class="fa fa-circle-o"></i> <?= Yii::t('app', 'Legal Type') ?></a></li>
                        <li><a href="index.php?r=legal"><i class="fa fa-circle-o"></i> <?= Yii::t('app', 'Legal') ?></a></li>

                        <li><a href="index.php?r=approver-level"><i class="fa fa-circle-o"></i> <?= Yii::t('app', 'Approver Level') ?></a></li>
                        <li><a href="index.php?r=approver"><i class="fa fa-circle-o"></i> <?= Yii::t('app', 'Approver') ?></a></li>

                        <li><a href="index.php?r=message"><i class="fa fa-circle-o"></i> <?= Yii::t('app', 'Translation') ?></a></li>
                    </ul>
                </li>
                <li class="treeview"><a href="#"><i class="fa fa-share"></i><span>Multilevel Menu</span><i class="fa fa-angle-right"></i></a>
                    <ul class="treeview-menu">
                        <li><a href="blank-page.html"><i class="fa fa-circle-o"></i> Level One</a></li>
                        <li class="treeview"><a href="#"><i class="fa fa-circle-o"></i><span> Level One</span><i class="fa fa-angle-right"></i></a>
                            <ul class="treeview-menu">
                                <li><a href="blank-page.html"><i class="fa fa-circle-o"></i> Level Two</a></li>
                                <li><a href="#"><i class="fa fa-circle-o"></i><span> Level Two</span></a></li>
                            </ul>
                        </li>
                    </ul>
                </li>
            </ul>
        </section>
    </aside>

    <div class="content-wrapper">
        <div class="page-title">
            <div>
                <h1><i class="fa fa-dashboard"></i> <?= $this->title ?></h1>
                <p><?= isset($this->subtitle)?$this->subtitle:"" ?></p>
            </div>
            <div>
                <?=
                \yii\widgets\Breadcrumbs::widget([
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
<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/plugins/pace.min.js"></script>
<script type="text/javascript" src="js/main.js"></script>
<script type="text/javascript" src="js/plugins/bootstrap-notify.min.js"></script>
<script type="text/javascript" src="js/plugins/sweetalert.min.js"></script>
<script type="text/javascript" src="js/plugins/bootstrap-datepicker.min.js"></script>
<script type="text/javascript" src="js/plugins/chart.js"></script>
<script type="text/javascript">
  var data = {
    labels: ["January", "February", "March", "April", "May"],
    datasets: [
      {
        label: "My First dataset",
        fillColor: "rgba(220,220,220,0.2)",
        strokeColor: "rgba(220,220,220,1)",
        pointColor: "rgba(220,220,220,1)",
        pointStrokeColor: "#fff",
        pointHighlightFill: "#fff",
        pointHighlightStroke: "rgba(220,220,220,1)",
        data: [65, 59, 80, 81, 56]
      },
      {
        label: "My Second dataset",
        fillColor: "rgba(151,187,205,0.2)",
        strokeColor: "rgba(151,187,205,1)",
        pointColor: "rgba(151,187,205,1)",
        pointStrokeColor: "#fff",
        pointHighlightFill: "#fff",
        pointHighlightStroke: "rgba(151,187,205,1)",
        data: [28, 48, 40, 19, 86]
      }
    ]
  };
  var pdata = [
    {
      value: 300,
      color:"#F7464A",
      highlight: "#FF5A5E",
      label: "Red"
    },
    {
      value: 50,
      color: "#46BFBD",
      highlight: "#5AD3D1",
      label: "Green"
    },
    {
      value: 100,
      color: "#FDB45C",
      highlight: "#FFC870",
      label: "Yellow"
    }
  ]

  var ctxl = $("#lineChartDemo").get(0).getContext("2d");
  var lineChart = new Chart(ctxl).Line(data);

  var ctxb = $("#barChartDemo").get(0).getContext("2d");
  var barChart = new Chart(ctxb).Bar(data);

  var ctxr = $("#radarChartDemo").get(0).getContext("2d");
  var barChart = new Chart(ctxr).Radar(data);

  var ctxpo = $("#polarChartDemo").get(0).getContext("2d");
  var barChart = new Chart(ctxpo).PolarArea(pdata);

  var ctxp = $("#pieChartDemo").get(0).getContext("2d");
  var barChart = new Chart(ctxp).Pie(pdata);

  var ctxd = $("#doughnutChartDemo").get(0).getContext("2d");
  var barChart = new Chart(ctxd).Doughnut(pdata);

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
