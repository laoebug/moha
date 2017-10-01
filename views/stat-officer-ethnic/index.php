<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\StatOfficerEthnicSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = Yii::t('app', 'Stat Officer Ethnics');
$this->params['breadcrumbs'][] = $this->title;
?>
<div ng-app="mohaApp" ng-controller="statOfficerEthnic">
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
            <div class="panel-heading"><i class="fa fa-pencil"></i> </div>
            <div class="panel-body">
                <div class="col-sm-3">
                    <label>ກະຊວງພາຍໃນ</label>
                    <select class="form-control" ng-model="model.level" ng-change="inquiry()" ng-options="l.name for l in levels"></select>
                </div>
                <div class="col-sm-3">
                    <label>ຊົນເຜົ່າ</label>
                    <select class="form-control" ng-model="model.ethnic" ng-change="inquiry()" ng-options="e.name for e in ethnics"></select>
                </div>
                <div class="col-sm-3">
                    <label>ລວມ</label>
                    <input type="number" ng-model="model.total" class="form-control" />
                </div>
                <div class="col-sm-3">
                    <label>ຍິງ</label>
                    <input type="number" ng-model="model.women" class="form-control" />
                </div>
                <div class="col-sm-12" style="margin-top: 1em">
                    <button type="button" class="btn btn-primary col-sm-2" ng-click="save()">
                        <i class="fa fa-save"></i> <?= Yii::t('app', 'Save') ?>
                    </button>
                </div>
            </div>
        </div>
    </div>
    <div class="col-sm-12" ng-bind-html="result"></div>
</div>

<script type="text/javascript" src="js/angular.js"></script>
<script type="text/javascript">
  var app = angular.module('mohaApp', []);
  app.controller('statOfficerEthnic', function($scope, $http, $sce, $timeout) {
    $scope.url = 'index.php?r=stat-officer-ethnic/';
    $http.get($scope.url + 'get')
      .then(function (r) {
        $scope.years = r.data.years;
        $scope.levels = r.data.levels;
        $scope.ethnics = r.data.ethnics;
      }, function (r) {
        $scope.response = r;
        $timeout(function () {
          $scope.response = null;
        }, 15000);
      });

    $scope.enquiry = function() {
        if($scope.year)
          $http.get($scope.url + 'enquiry&year='+ $scope.year.id)
            .then(function (r) {
              if(r.data)
              $scope.result = $sce.trustAsHtml(r.data);
            }, function (r) {
              $scope.response = r;
              $timeout(function () {
                $scope.response = null;
              }, 15000);
            });
    };

    $scope.inquiry = function() {
        if($scope.year && $scope.model.ethnic && $scope.model.level)
          $http.get($scope.url + 'inquiry&year='+ $scope.year.id+"&ethnic="+$scope.model.ethnic.id+"&level="+$scope.model.level.id)
            .then(function (r) {
              if(r.data.model) {
                $scope.model.total = r.data.model.total;
                $scope.model.women = r.data.model.women;
              }
            }, function (r) {
              $scope.response = r;
              $timeout(function () {
                $scope.response = null;
              }, 15000);
            });
    };

    $scope.save = function() {
      if($scope.year && $scope.model) {
        $http.post($scope.url+'save&year='+$scope.year.id, {
          'Model': $scope.model,
          '_csrf': $('meta[name="csrf-token"]').attr("content")
        }).then(function(r) {
          $scope.model = null;
          $scope.response = r;
          $scope.enquiry();
          $timeout(function() {
            $scope.response = null;
          }, 15000);
        }, function(r) {
          $scope.response = r;
          $timeout(function () {
            $scope.response = null;
          }, 15000);
        });
      }
    };
  });
</script>