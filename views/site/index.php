<?php

/* @var $this yii\web\View */

$this->title = Yii::t('app', 'Dashboad');
?>
<div class="site-index">
    <div class="body-content">
        <div class="row">
            <div class="row">
                <div class="col-md-6">
                    <div class="card">
                        <h3 class="card-title">Line Chart</h3>
                        <div class="embed-responsive embed-responsive-16by9">
                            <canvas class="embed-responsive-item" id="lineChartDemo"></canvas>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="card">
                        <h3 class="card-title">Bar Chart</h3>
                        <div class="embed-responsive embed-responsive-16by9">
                            <canvas class="embed-responsive-item" id="barChartDemo"></canvas>
                        </div>
                    </div>
                </div>
                <div class="clearfix"></div>
                <div class="col-md-6">
                    <div class="card">
                        <h3 class="card-title">Radar Chart</h3>
                        <div class="embed-responsive embed-responsive-16by9">
                            <canvas class="embed-responsive-item" id="radarChartDemo"></canvas>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="card">
                        <h3 class="card-title">Polar Chart</h3>
                        <div class="embed-responsive embed-responsive-16by9">
                            <canvas class="embed-responsive-item" id="polarChartDemo"></canvas>
                        </div>
                    </div>
                </div>
                <div class="clearfix"></div>
                <div class="col-md-6">
                    <div class="card">
                        <h3 class="card-title">Pie Chart</h3>
                        <div class="embed-responsive embed-responsive-16by9">
                            <canvas class="embed-responsive-item" id="pieChartDemo"></canvas>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="card">
                        <h3 class="card-title">Doughnut Chart</h3>
                        <div class="embed-responsive embed-responsive-16by9">
                            <canvas class="embed-responsive-item" id="doughnutChartDemo"></canvas>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
</div>
