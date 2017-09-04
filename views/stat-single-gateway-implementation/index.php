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
                        <input ng-change="changedate()" class="form-control" type="date" placeholder="Select Date" ng-model="selected.start_date">
<!--                        <p class="input-group">-->
<!--                            <input type="text" class="form-control"-->
<!--                                   uib-datepicker-popup ng-model="dt"-->
<!--                                   is-open="popup2.opened"-->
<!--                                   datepicker-options="dateOptions"-->
<!--                                   ng-required="true"-->
<!--                                   close-text="Close" />-->
<!--                            <span class="input-group-btn">-->
<!--                                <button type="button" class="btn btn-default" ng-click="open2()"><i class="glyphicon glyphicon-calendar"></i></button>-->
<!--                              </span>-->
<!--                        </p>-->
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
        <div ng-show="response" class="alert alert-{{response.status == 200? 'success':'danger'}}">{{response.statusText}}</div>
    </div>
    <div class="col-sm-12" style="margin-top: 2em">
        <div class="card" ng-show="model">
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
                    <tr ng-repeat="d in model.statSingleGatewayImplementationDetails | orderBy:d.ministry.position:false" style="cursor:pointer;">
                        <td>{{$index + 1}}</td>
                        <td>{{d.ministry.name}}</td>
                        <td>{{d.start_date}}</td>
                        <td>{{d.name}}</td>
                        <td class="text-center">{{selected.remark}}</td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript" src="js/angular.js"></script>
<!--<script type="text/javascript" src="js/angular-animate.js"></script>-->
<!--<script type="text/javascript" src="js/angular-sanitize.js"></script>-->
<!--<script type="text/javascript" src="js/ui-bootstrap-tpls-2.5.0.js"></script>-->
<script type="text/javascript">
    var app = angular.module('mohaApp', []);
    var url = 'index.php?r=stat-single-gateway-implementation/';
    app.controller('singleGatewayController', function($scope, $http, $sce, $timeout) {
        $http.get(url+ 'get')
            .then(function(r) {
                $scope.years = r.data.years;
                $scope.ministries = r.data.ministries;
            });

        $scope.enquiry = function() {
          $scope.selected = null;
            $http.get(url+'enquiry&year='+$scope.year.id)
                .then(function(r) {
                    $scope.model = r.data.model;
                });
        };

      $scope.inquiry = function() {
        if($scope.selected.ministry)
        $http.get(url+'inquiry&year='+$scope.year.id+'&ministry='+$scope.select.ministry.id)
          .then(function(r) {
//            $scope.selected.start_date = r.data.select.start_date;
            if(r.data.selected) {
              $scope.selected.name = r.data.model.name;
              $scope.selected.remark = r.data.model.remark;
            } else {
              $scope.selected.name = null;
              $scope.selected.remark = null;
              $scope.selected.start_date = null;
            }
          });
      };

        $scope.select = function(m) {
            $scope.selected = m;
        };

        $scope.save = function() {
            if($scope.selected)
                $http.post(url + 'save&year='+$scope.year.id, {
                    Model: $scope.selected,
                    '_csrf': $('meta[name="csrf-token"]').attr("content")
                }).then(function(r) {
                    $scope.response = r;
                    $scope.selected = null;
                    $scope.enquiry();
                    $timeout(function() {
                        $scope.response = null;
                    }, 15000);
                });
        };
    });
</script>