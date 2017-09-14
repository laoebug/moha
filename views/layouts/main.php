<?php

/* @var $this \yii\web\View */
/* @var $content string */
use app\components\MenuWidget;
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
                <?php
//                if(!Yii::$app->user->isGuest) {
//                    MenuWidget::begin();
//                    MenuWidget::end();
//                }
                ?>
                <li class="treeview"><a href="#"><i class="fa fa-bar-chart"></i><span><?= Yii::t('app','Administration') ?></span><i class="fa fa-angle-right"></i></a>
                    <ul class="treeview-menu">
                        <li><a href="index.php?r=ministry"><i class="fa fa-circle-o"></i> <?= Yii::t('app', 'Ministry') ?></a></li>
                        <li><a href="index.php?r=stat-goverment-unit"><i class="fa fa-circle-o"></i> <?= Yii::t('app', 'Goverment Units') ?></a></li>
                        <li><a href="index.php?r=stat-single-gateway-implementation"><i class="fa fa-circle-o"></i> <?= Yii::t('app', 'Single Gateway Implementations') ?></a></li>
                        <li><a href="index.php?r=stat-legal"><i class="fa fa-circle-o"></i> <?= Yii::t('app', 'Legals') ?></a></li>
                        <li><a href="index.php?r=stat-association-foundation"><i class="fa fa-circle-o"></i> <?= Yii::t('app', 'Association Foundation') ?></a></li>
                        <li><a href="index.php?r=stat-local-admin"><i class="fa fa-circle-o"></i> <?= Yii::t('app', 'Local Administration') ?></a></li>
                        <li><a href="index.php?r=stat-population-movement"><i class="fa fa-circle-o"></i> <?= Yii::t('app', 'Population Movement') ?></a></li>
                        <li><a href="index.php?r=stat-population-movement-chart"><i class="fa fa-circle-o"></i> <?= Yii::t('app', 'Population Movement') ?> <i class="fa fa-bar-chart"></i> </a></li>
                        <li><a href="index.php?r=stat-ethnic"><i class="fa fa-circle-o"></i> <?= Yii::t('app', 'Ethnic Statistic') ?> </a></li>
                        <li><a href="index.php?r=stat-religion"><i class="fa fa-circle-o"></i> <?= Yii::t('app', 'Religion & Other Believes') ?></a></li>
                        <li><a href="index.php?r=stat-religion-teacher"><i class="fa fa-circle-o"></i> <?= Yii::t('app', 'Religion Teacher') ?></a></li>
                        <li><a href="index.php?r=stat-religion-place"><i class="fa fa-circle-o"></i> <?= Yii::t('app', 'Religion Place') ?></a></li>
                    </ul>
                </li>
                <li class="treeview"><a href="#"><i class="fa fa-group"></i><span><?= Yii::t('app','Officer') ?></span><i class="fa fa-angle-right"></i></a>
                    <ul class="treeview-menu">
                        <li class="treeview"><a href="#"><i class="fa fa-plus"></i><span><?= Yii::t('app', 'Overall Officer') ?></span><i class="fa fa-angle-right"></i></a>
                            <ul class="treeview-menu">
                                <li><a href="index.php?r=stat-officer"><i class="fa fa-circle-o"></i> <?= Yii::t('app', 'Overall Officer') ?></a></li>
                                <li><a href="index.php?r=stat-officer-age"><i class="fa fa-circle-o"></i> <?= Yii::t('app', 'Officers By Ages') ?></a></li>
                                <li><a href="index.php?r=stat-officer-degree"><i class="fa fa-circle-o"></i> <?= Yii::t('app', 'Officers By Degrees') ?></a></li>
                                <li><a href="index.php?r=stat-officer-resign"><i class="fa fa-circle-o"></i> <?= Yii::t('app', 'Officers Resignation') ?></a></li>
                                <li><a href="index.php?r=stat-officer-add"><i class="fa fa-circle-o"></i> <?= Yii::t('app', 'Officers Add') ?></a></li>
                                <li><a href="index.php?r=stat-officer-contract"><i class="fa fa-circle-o"></i> <?= Yii::t('app', 'Officers Contract') ?></a></li>
                                <li><a href="index.php?r=stat-officer-position"><i class="fa fa-circle-o"></i> <?= Yii::t('app', 'Officers Positions') ?></a></li>
                                <li><a href="index.php?r=stat-officer-need"><i class="fa fa-circle-o"></i> <?= Yii::t('app', 'Officers Needed') ?></a></li>
                                <li><a href="index.php?r=stat-officer-ministry"><i class="fa fa-circle-o"></i> <?= Yii::t('app', 'Officers Ministry') ?></a></li>
                                <li><a href="index.php?r=stat-officer-org"><i class="fa fa-circle-o"></i> <?= Yii::t('app', 'Officers Organisation') ?></a></li>
                                <li><a href="index.php?r=stat-officer-province"><i class="fa fa-circle-o"></i> <?= Yii::t('app', 'Officers Province') ?></a></li>
                            </ul>
                        </li>

                        <li class="treeview"><a href="#"><i class="fa fa-plus"></i><span><?= Yii::t('app', 'Add/Resign') ?></span><i class="fa fa-angle-right"></i></a>
                            <ul class="treeview-menu">
                                <li><a href="index.php?r=stat-officer-ministry-add"><i class="fa fa-circle-o"></i> <?= Yii::t('app', 'Officers Ministry Add') ?></a></li>
                                <li><a href="index.php?r=stat-officer-organisation-add"><i class="fa fa-circle-o"></i> <?= Yii::t('app', 'Officers Organisation Add') ?></a></li>
                                <li><a href="index.php?r=stat-officer-province-add"><i class="fa fa-circle-o"></i> <?= Yii::t('app', 'Officers Province Add') ?></a></li>
                            </ul>
                        </li>

                        <li class="treeview"><a href="#"><i class="fa fa-circle-o"></i><span><?= Yii::t('app', 'Training') ?></span><i class="fa fa-angle-right"></i></a>
                            <ul class="treeview-menu">
                                <li><a href="index.php?r=stat-officer-ministry-train"><i class="fa fa-circle-o"></i> <?= Yii::t('app', 'Officers Ministry Train') ?></a></li>
                                <li><a href="index.php?r=stat-officer-organisation-train"><i class="fa fa-circle-o"></i> <?= Yii::t('app', 'Officers Organisation Train') ?></a></li>
                                <li><a href="index.php?r=stat-officer-province-train"><i class="fa fa-circle-o"></i> <?= Yii::t('app', 'Officers Province Train') ?></a></li>
                            </ul>
                        </li>

                        <li class="treeview"><a href="#"><i class="fa fa-upload"></i><span><?= Yii::t('app', 'Upgrade') ?></span><i class="fa fa-angle-right"></i></a>
                            <ul class="treeview-menu">
                                <li><a href="index.php?r=stat-officer-ministry-upgrade"><i class="fa fa-circle-o"></i> <?= Yii::t('app', 'Officers Ministry Upgrade') ?></a></li>
                                <li><a href="index.php?r=stat-officer-organisation-upgrade"><i class="fa fa-circle-o"></i> <?= Yii::t('app', 'Officers Organisation Upgrade') ?></a></li>
                                <li><a href="index.php?r=stat-officer-province-upgrade"><i class="fa fa-circle-o"></i> <?= Yii::t('app', 'Officers Province Upgrade') ?></a></li>
                            </ul>
                        </li>
                    </ul>
                </li>
                <li class="treeview"><a href="#"><i class="fa fa-gear"></i><span><?= Yii::t('app','Settings') ?></span><i class="fa fa-angle-right"></i></a>
                    <ul class="treeview-menu">
                        <li><a href="index.php?r=phiscal-year"><i class="fa fa-circle-o"></i> <?= Yii::t('app', 'Phiscal Year') ?></a></li>
                        <li><a href="index.php?r=ministry-group"><i class="fa fa-circle-o"></i> <?= Yii::t('app', 'Ministry Group') ?></a></li>
                        <li><a href="index.php?r=legal-type"><i class="fa fa-circle-o"></i> <?= Yii::t('app', 'Legal Type') ?></a></li>
                        <li><a href="index.php?r=legal"><i class="fa fa-circle-o"></i> <?= Yii::t('app', 'Legal') ?></a></li>

                        <li><a href="index.php?r=approver-level"><i class="fa fa-circle-o"></i> <?= Yii::t('app', 'Approver Level') ?></a></li>
                        <li><a href="index.php?r=approver"><i class="fa fa-circle-o"></i> <?= Yii::t('app', 'Approver') ?></a></li>

                        <li><a href="index.php?r=ethnic"><i class="fa fa-circle-o"></i> <?= Yii::t('app', 'Ethic') ?></a></li>

                        <li><a href="index.php?r=organisation"><i class="fa fa-circle-o"></i> <?= Yii::t('app', 'Organisation') ?></a></li>
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
