<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\StatOfficerOrgSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = "ສະຖິຕິລວມອົງການຈັດຕັ້ງຂັ້ນສູນການ";
$this->params['breadcrumbs'][] = $this->title;
?>
<div ng-app="mohaApp" ng-controller="officerOrganisationController">
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
        <div class="panel panel-primary" style="margin-top: 2em" ng-show="year != null">
            <div class="panel-heading" ng-click="changemode()"><i class="fa fa-{{mode=='input'?'minus':'plus'}}"></i> </div>
            <div class="panel-body {{mode=='input'?'':'hidden'}}">
                <div class="col-sm-12">
                    <div class="col-sm-3">
                        <label >ອົງການຈັດຕັ້ງ</label>
                        <select ng-options="m.name for m in organisations" ng-model="model.organisation" ng-change="inquiry()" class="form-control"></select>
                    </div>
                    <div class="col-sm-3">
                        <label ><?= Yii::t('app', 'Total') ?></label>
                        <input class="form-control" ng-model="model.total" min="0" type="number">
                    </div>
                    <div class="col-sm-3">
                        <label ><?= Yii::t('app', 'Women') ?></label>
                        <input class="form-control" ng-model="model.women" min="0" max="model.total" type="number">
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
            </canvas
        </div>
    </div>
</div>
<script type="text/javascript" src="js/Chart.js"></script>
<script type="text/javascript" src="js/angular.js"></script>
<script type="text/javascript" src="js/angular-chart.js"></script>
<script type="text/javascript">
  var app = angular.module('mohaApp', ['chart.js']);
  app.controller('officerOrganisationController', function($scope, $http, $sce, $timeout) {
    $scope.url = 'index.php?r=stat-officer-org/';
    $scope.mode = 'read';
    $scope.changemode = function() {
      $scope.mode = $scope.mode == 'read'?'input':'read';
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
              $scope.model.total = parseInt(r.data.model.total);
              $scope.model.women = parseInt(r.data.model.women);
            } else {
              $scope.model.total = null;
              $scope.model.women = null;
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