<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = "ສະຖິຕິລັດຖະກອນທີ່ເພີ່ມເຂົ້າ ແລະ ອອກທຸກຮູບການ ຂອງກະຊວງ ແລະ ອົງການທຽບເທົ່າ";
$this->params['breadcrumbs'][] = $this->title;
?>
<div ng-app="mohaApp" ng-controller="officerOrganisationAddController">
    <div class="col-sm-12">
        <label class="col-sm-12"><?= Yii::t('app', 'Phiscal Year') ?></label>
        <div class="col-sm-4">
            <select class="form-control" ng-model="year" ng-change="enquiry()" ng-options="y.year for y in years"></select>
        </div>
        <div class="col-sm-8">
            <div ng-show="response" class="alert alert-{{response.status == 200? 'success':'danger'}}">
                {{response.statusText}}
            </div>
        </div>
    </div>
    <div class="col-sm-12">
        <div class="panel panel-primary" style="margin-top: 2em" ng-show="year">
            <div class="panel-heading" ng-click="changemode()"><i class="fa fa-{{mode=='input'?'minus':'plus'}}"></i> </div>
            <div class="panel-body {{mode=='input'?'':'hidden'}}">
                <div class="col-sm-12">
                    <div class="col-sm-3">
                        <label >ອົງການຈັດຕັ້ງ</label>
                        <select ng-options="m.name for m in organisations" ng-model="model.organisation" ng-change="inquiry()" class="form-control"></select>
                    </div>
                    <div class="col-sm-3">
                        <label >ເພີ່ມເຂົ້າ</label>
                        <input class="form-control" ng-model="model.add" min="0" type="number">
                    </div>
                    <div class="col-sm-3">
                        <label >ອອກທຸກຮຸບການ</label>
                        <input class="form-control" ng-model="model.resign" min="0" max="model.add" type="number">
                    </div>
                    <div class="col-sm-3">
                        <label >&nbsp;</label>
                        <button type="button" class="btn btn-primary col-sm-12" ng-click="save()">
                            <i class="fa fa-save"></i> <?= Yii::t('app', 'Save') ?>
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="col-sm-12" ng-if="models">
        <div class="card">
            <h3><?= $this->title ?> {{year.year}}</h3>
            <canvas id="stat" class="chart chart-bar"
                    chart-data="stat.data"
                    chart-labels="stat.labels"
                    chart-series="stat.series"
                    chart-colors="stat.colors"
                    chart-options="options"
            </canvas>
        </div>
    </div>
</div>
<script type="text/javascript" src="js/Chart.js"></script>
<script type="text/javascript" src="js/angular.js"></script>
<script type="text/javascript" src="js/angular-chart.js"></script>
<script type="text/javascript">
  Chart.defaults.global.defaultFontFamily = 'Saysettha OT';

  var app = angular.module('mohaApp', ['chart.js']);
  app.controller('officerOrganisationAddController', function($scope, $http, $sce, $timeout) {
    $scope.url = 'index.php?r=stat-officer-organisation-add/';
    $scope.mode = 'read';
    $scope.changemode = function() {
      $scope.mode = $scope.mode == 'read'?'input':'read';
    };
    $scope.options = {
      legend: {
        display: true,
        labels: {
          fontColor: '',
        }
      },
      scales: {
        xAxes: [{
          stacked: false,
          beginAtZero: true,
          scaleLabel: {
//            labelString: ''
          },
          ticks: {
            stepSize: 1,
            min: 0,
            autoSkip: false
          }
        }]
      },
      tooltipEvents: [],
      showTooltips: true,
      tooltipCaretSize: 0,
      onAnimationComplete: function() {
        this.showTooltip(this.segments, true);
      }
    };
    $http.get($scope.url + 'get')
      .then(function(r) {
        $scope.years = r.data.years;
        $scope.organisations = r.data.organisations;
      }, function(r) {
        $scope.response = r;
        $timeout(function () {
          $scope.response = null;
        }, 15000);
      });

    $scope.enquiry = function() {
      $scope.models=null;
      if($scope.year)
        $http.get($scope.url + 'enquiry&year='+$scope.year.id)
          .then(function(r) {
            $scope.models = r.data.models;
            $scope.stat = r.data.stat;
            $scope.stat.colors = ['#0000FF', '#FF0000'];
          }, function(r) {
            $scope.response = r;
            $timeout(function () {
              $scope.response = null;
            }, 15000);
          });
    };

    $scope.inquiry = function() {
      if($scope.year && $scope.model.organisation)
        $http.get($scope.url + 'inquiry&year='+$scope.year.id+'&organisation='+$scope.model.organisation.id)
          .then(function(r) {
            if(r.data.model) {
              $scope.model.add = parseInt(r.data.model.add);
              $scope.model.resign = parseInt(r.data.model.resign);
            } else {
              $scope.model.add = null;
              $scope.model.resign = null;
            }
          }, function(r) {
            $scope.response = r;
            $timeout(function () {
              $scope.response = null;
            }, 15000);
          });
    };

    $scope.save = function() {
      if($scope.model)
        $http.post($scope.url + 'save&year='+$scope.year.id, {
          'Model': $scope.model,
          '_csrf': $('meta[name="csrf-token"]').attr("content")
        }).then(function(r) {
          $scope.model = null;
          $scope.enquiry();
          $scope.response = r;
          $timeout(function () {
            $scope.response = null;
          }, 15000);
        }, function(r) {
          $scope.response = r;
          $timeout(function () {
            $scope.response = null;
          }, 15000);
        })
    };

    $scope.enquiry();
  });
</script>