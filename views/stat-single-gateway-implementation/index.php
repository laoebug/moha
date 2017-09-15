<?php

use yii\helpers\Html;
use yii\grid\GridView;
use yii\widgets\Pjax;
/* @var $this yii\web\View */
/* @var $searchModel app\models\MinistrySearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = Yii::t('app', 'Statistics of Single Gateway Implementations');
$this->params['breadcrumbs'][] = $this->title;
?>
<style rel="stylesheet" href="css/angular-datepicker.css"></style>
<div class="row" ng-app="mohaApp" ng-controller="singleGatewayController">
    <div class="col-sm-12">
        <label class="col-sm-12"><?= Yii::t('app', 'Phiscal Year') ?></label>
        <div class="col-sm-4">
            <select class="form-control" ng-model="year" ng-change="enquiry()" ng-options="y.year for y in years"></select>
        </div>
        <div class="col-sm-8">
            <div ng-show="response" class="alert alert-{{response.status == 200? 'success':'danger'}}">{{response.statusText}}</div>
        </div>
    </div><div class="col-sm-12">
        <div class="panel panel-primary" style="margin-top: 2em" ng-show="year != null">
            <div class="panel-heading"><i class="fa fa-pencil"></i> </div>
            <div class="panel-body">
                <div class="row">
                    <div class="col-sm-3">
                        <label for=""><?= Yii::t('app', 'Ministry') ?></label>
                        <select ng-change="inquiry()" class="form-control" ng-model="selected.ministry" ng-options="m.name for m in ministries">
                        </select>
                    </div>
                    <div class="col-sm-3">
                        <label for=""><?= Yii::t('app', 'Start Date') ?></label>
                        <input class="form-control datepicker" data-ng-model="$parent.selected.start_date" type="text">
                    </div>
                    <div class="col-sm-3">
                        <label for=""><?= Yii::t('app', 'Service Unit Name') ?></label>
                        <input type="text" class="form-control" ng-model="selected.name">
                    </div>
                    <div class="col-sm-3">
                        <label for=""><?= Yii::t('app', 'Remark') ?></label>
                        <input type="text" class="form-control" ng-model="selected.remark">
                    </div>
                </div>
                <div class="col-sm-2" style="margin-top: 2em">
                    <button type="button" class="btn btn-info col-sm-12" ng-click="save()">
                        <i class="fa fa-save"></i> <?= Yii::t('app', 'Save') ?>
                    </button>
                </div>
            </div>
        </div>
    </div>
    <div class="col-sm-12" style="margin-top: 2em">
        <div class="card" ng-show="models">
            <div class="card-title-w-btn ">
                <h3 class="title"><?= Yii::t('app','Statistics of Goverment Structure') ?> ({{year.year}})</h3>
                <p class="hidden-print">
                    <a class="btn btn-default" target="_blank" href="index.php?r=stat-single-gateway-implementation/print&year={{year.id}}"><i class="fa fa-print fa-2x"></i></a>
                    <a class="btn btn-info" target="_blank" href="index.php?r=stat-single-gateway-implementation/download&year={{year.id}}"><i class="fa fa-download fa-2x"></i></a>
                </p>
            </div>
            <div class="card-body">
                <table class="table table-responsive table-bordered table-hover">
                    <thead>
                    <tr>
                        <th style="width: 10px"><?= Yii::t('app', 'No.') ?></th>
                        <th class="text-center"><?= Yii::t('app', 'Ministry') ?></th>
                        <th class="text-center"><?= Yii::t('app', 'Start Date') ?></th>
                        <th class="text-center"><?= Yii::t('app', 'Name') ?></th>
                        <th class="text-center"><?= Yii::t('app', 'Remark') ?></th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr ng-repeat="m in models" style="cursor:pointer;">
                        <td>{{$index + 1}}</td>
                        <td>{{m.name}}</td>
                        <td class="text-center">{{m.start_date}}</td>
                        <td class="text-center">{{m.servicename}}</td>
                        <td class="text-center">{{m.remark}}</td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript" src="js/angular.js"></script>
<script type="text/javascript" src="js/moment.js"></script>
<script type="text/javascript" src="js/datetimepicker.js"></script>
<script type="text/javascript" src="js/datetimepicker.templates.js"></script>
<script type="text/javascript">
    var app = angular.module('mohaApp', ['ui.bootstrap.datetimepicker']);
    var url = 'index.php?r=stat-single-gateway-implementation/';
    app.controller('singleGatewayController', function($scope, $http, $sce, $timeout) {
        $http.get(url+ 'get')
            .then(function(r) {
                $scope.years = r.data.years;
                $scope.ministries = r.data.ministries;
            }, function(r) {
              $scope.response = r;
              $timeout(function () {
                $scope.response = null;
              }, 15000);
            });

        $scope.enquiry = function() {
          $scope.selected = null;
            $http.get(url+'enquiry&year='+$scope.year.id)
                .then(function(r) {
                    $scope.models = r.data.models;
                }, function(r) {
                  $scope.response = r;
                  $timeout(function () {
                    $scope.response = null;
                  }, 15000);
                });
        };

      $scope.inquiry = function() {
        if($scope.selected.ministry)
            $http.get(url + 'inquiry&year=' + $scope.year.id + '&ministry=' + $scope.selected.ministry.id)
                .then(function (r) {
                    if(r.data.model)
                        if(r.data.model.start_date)
                            $(".datepicker").val(r.data.model.start_date);
                        else
                            $(".datepicker").val("");
                    else
                        $(".datepicker").val("");

                    if (r.data.model) {
                        $scope.selected.name = r.data.model.name;
                        $scope.selected.remark = r.data.model.remark;
                    } else {
                        $scope.selected.name = null;
                        $scope.selected.remark = null;
                        $scope.selected.start_date = null;
                    }
                }, function(r) {
                  $scope.response = r;
                  $timeout(function () {
                    $scope.response = null;
                  }, 15000);
                });
      };

        $scope.select = function(m) {
            $scope.selected = m;
        };

        $scope.save = function() {
            $scope.selected.start_date = $(".datepicker").val();
            $http.post(url + 'save&year=' + $scope.year.id, {
                Model: $scope.selected,
                '_csrf': $('meta[name="csrf-token"]').attr("content")
            }).then(function (r) {
                $scope.response = r;
                $scope.selected = null;
                $scope.enquiry();
                $timeout(function () {
                    $scope.response = null;
                }, 15000);
            }, function(r) {
              $scope.response = r;
              $timeout(function () {
                $scope.response = null;
              }, 15000);
            });
        };
    });
</script>