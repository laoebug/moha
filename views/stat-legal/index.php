<?php

/* @var $this yii\web\View */
/* @var $searchModel app\models\GovermentlevelSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = Yii::t('app', 'Legal');
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="row" ng-app="mohaApp" ng-controller="statLegalController">
    <div class="col-sm-12">
        <label class="col-sm-12"><?= Yii::t('app', 'Phiscal Year') ?></label>
        <div class="col-sm-4">
            <select class="form-control" ng-model="year" ng-change="enquiry()" ng-options="y.year for y in years"></select>
        </div>
    </div>
    <div class="col-sm-12">
        <div class="panel panel-primary" style="margin-top: 2em" ng-show="year != null">
            <div class="panel-heading"><i class="fa fa-pencil"></i> </div>
            <div class="panel-body">
                <div class="col-sm-2 hidden">
                    <label for=""><?= Yii::t('app', 'Legal Type') ?></label>
                    <select class="form-control" ng-model="legal" ng-options="g.name for g in legaltypes"></select>
                </div>
                <div class="col-sm-4">
                    <label for=""><?= Yii::t('app', 'Legal Type') ?></label>
                    <select class="form-control" ng-model="selected.legalType" ng-options="b.name for b in legalTypes">
                    </select>
                </div>
                <div class="col-sm-4">
                    <label for=""><?= Yii::t('app', 'Legal') ?></label>
                    <select class="form-control" ng-model="legal" ng-options="b.name for b in selected.legalType.legals" ng-change="inquiry()">
                    </select>
                </div>
                <div class="col-sm-2">
                    <label for="">&nbsp;</label>
                    <div class="animated-checkbox">
                        <label>
                            <input type="checkbox"><span class="label-text"><?= Yii::t('app','New') ?>/span>
                        </label>
                    </div>
                </div>
                <div class="col-sm-2">
                    <label for="">&nbsp;</label>
                    <div class="animated-checkbox">
                        <label>
                            <input type="checkbox"><span class="label-text"><?=Yii::t('app','Improve') ?></span>
                        </label>
                    </div>
                </div>
                <div class="col-sm-5">
                    <label for=""><?= Yii::t('app', 'Publish') ?></label>
                    <input type="number" min="0" class="form-control" ng-model="publish">
                </div>
                <div class="col-sm-7">
                    <label for=""><?= Yii::t('app', 'Remark') ?></label>
                    <input type="text" class="form-control" ng-model="remark">
                </div>
                <div class="col-sm-2 col-sm-offset-5" style="margin-top: 1em">
                    <button type="button" class="btn btn-primary col-sm-12" ng-click="save()">
                        <i class="fa fa-save"></i> <?= Yii::t('app', 'Save') ?>
                    </button>
                </div>
            </div>
        </div>
        <div ng-show="response" class="alert alert-{{response.status == 200? 'success':'danger'}}">
            {{response.statusText}}
        </div>
    </div>
<!--    <div class="col-sm-12" style="margin-top: 2em" ng-bind-html="result"></div>-->
    <div ng-show="models" class="col-sm-12 card" style="margin-top: 2em">
        <h3><?= Yii::t('app', 'Statistics of Internal Legal') ?></h3>
        <table class="table table-bordered table-hover">
            <thead>
                <tr>
                    <th class="text-center"><?= Yii::t('app', 'No.') ?></th>
                    <th class="text-center"><?= Yii::t('app', 'Name') ?></th>
                    <th class="text-center"><?= Yii::t('app', 'New') ?></th>
                    <th class="text-center"><?= Yii::t('app', 'Improve') ?></th>
                    <th class="text-center"><?= Yii::t('app', 'Publish') ?></th>
                    <th class="text-center"><?= Yii::t('app', 'Remark') ?></th>
                </tr>
            </thead>
            <tbody ng-repeat="t in legalTypes">
                <tr>
                    <th colspan="6" class="text-center">{{t.name}}</th>
                </tr>
                <tr ng-repeat="l in t.legals">
                    <td class="text-center">{{$index + 1}}</td>
                    <td>{{l.name}}</td>
                    <td class="text-center">{{l.new}}</td>
                    <td class="text-center">{{l.improve}}</td>
                    <td class="text-center">{{l.publish}}</td>
                    <td>{{l.remark}}</td>
                </tr>
            </tbody>
        </table>
    </div>
</div>
<script type="text/javascript" src="js/angular.js"></script>
<script type="text/javascript">
    var app = angular.module('mohaApp', []);
    var url = 'index.php?r=stat-legal/';
    app.controller('statLegalController', function($scope, $http, $sce, $timeout) {
        $http.get(url+ 'get')
            .then(function(r) {
                $scope.years = r.data.years;
                $scope.legalTypes = r.data.legalTypes;
            }, function(r) {
                $scope.response = r;
                $timeout(function() {
                    $scope.response = null;
                });

        $scope.enquiry = function() {
            if($scope.year)
                $http.get(url + 'enquiry&year='+$scope.year.id).then(function(r) {
//                    $scope.result = $sce.trustAsHtml(r.data);
                    $scope.models = r.data.models;
                }, function(r) {
                    $scope.response = r;
                    $timeout(function() {
                        $scope.response = null;
                    });
        };

        $scope.inquiry = function() {
            if($scope.ministry)
                $http.get(url+'inquiry&ministry='+$scope.ministry.id+'&year='+ $scope.year.id)
                    .then(function(r) {
                        $scope.office = parseInt(r.status == 200? r.data.office:"");
                        $scope.department = parseInt(r.status == 200? r.data.department:"");
                        $scope.insitute = parseInt(r.status == 200? r.data.insitute:"");
                        $scope.center = parseInt(r.status == 200? r.data.center:"");
                        $scope.remark = parseInt(r.status == 200? r.data.remark:"");
                    }, function(r) {
                        $scope.response = r;
                        $timeout(function() {
                            $scope.response = null;
                        });
            else {
                $scope.office = "";
                $scope.department = "";
                $scope.insitute = "";
                $scope.center = "";
                $scope.remark = "";
            }
        };

        $scope.save = function() {
            if($scope.year && $scope.ministry) {
                $http.post(url+'save', {
                    'year':$scope.year.id,
                    'ministry':$scope.ministry.id,
                    'office':$scope.office,
                    'department':$scope.department,
                    'insitute':$scope.insitute,
                    'center':$scope.center,
                    'remark':$scope.remark,
                    '_csrf': $('meta[name="csrf-token"]').attr("content")
                }).then(function(r) {
                    $scope.response = r;
                    if(r.data) $scope.result = $sce.trustAsHtml(r.data);
                    $timeout(function() {
                        $scope.response = null;
                    }, 5000);
                }, function(r) {
                    $scope.response = r;
                    $timeout(function() {
                        $scope.response = null;
                    });
            }
        }
    });
</script>