<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\StatAssociationFoundationSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = Yii::t('app', 'Stat Association Foundations');
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="stat-association-foundation-index">

</div>

<?php

/* @var $this yii\web\View */
/* @var $searchModel app\models\GovermentlevelSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = Yii::t('app', 'Statistics of Associations/Foundations');
?>
<div class="row" ng-app="mohaApp" ng-controller="statAssoController">
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
                <div class="col-sm-4">
                    <label for=""><?= Yii::t('app', 'Approver Level') ?></label>
                    <select class="form-control" ng-model="model.approverLevel" ng-options="b.name for b in approverLevels"></select>
                </div>

                <div class="col-sm-4">
                    <div class="col-sm-12">
                        <label for=""><?= Yii::t('app', 'Approver') ?></label>
                        <select class="form-control" ng-model="model.approver"
                                ng-show="model.approverLevel.code == 'M'"
                                ng-options="a.ministry.name for a in model.approverLevel.approvers"
                                ng-change="inquiry()">
                        </select>
                        <select class="form-control" ng-model="model.approver"
                                ng-show="model.approverLevel.code == 'P'"
                                ng-options="a.province.province_name for a in model.approverLevel.approvers"
                                ng-change="inquiry()">
                        </select>
                    </div>
                </div>

                <div class="col-sm-2">
                    <label for=""><?= Yii::t('app', 'Association') ?></label>
                    <input type="number" min="0" class="form-control" ng-model="model.association">
                </div>
                <div class="col-sm-2">
                    <label for=""><?= Yii::t('app', 'Foundation') ?></label>
                    <input type="number" min="0" class="form-control" ng-model="model.foundation">
                </div>
                <div class="col-sm-12">
                    <label for=""><?= Yii::t('app', 'Remark') ?></label>
                    <input type="text" class="form-control" ng-model="model.remark">
                </div>
                <div class="col-sm-2 col-sm-offset-5" style="margin-top: 1em">
                    <button type="button" class="btn btn-primary col-sm-12" ng-click="save()">
                        <i class="fa fa-save"></i> <?= Yii::t('app', 'Save') ?>
                    </button>
                </div>
            </div>
        </div>
    </div>
    <div ng-show="models" class="col-sm-12 card" style="margin-top: 2em">
        <div class="card-title-w-btn ">
            <h3><?= Yii::t('app', 'Statistics of Internal Legal') ?></h3>
            <p>
                <a class="btn btn-default" target="_blank" href="index.php?r=stat-association-foundation/print&year={{year.id}}"><i class="fa fa-print fa-2x"></i></a>
                <a class="btn btn-info" target="_blank" href="index.php?r=stat-association-foundation/download&year={{year.id}}"><i class="fa fa-download fa-2x"></i></a>
            </p>
        </div>
        <table class="table table-bordered table-hover">
            <thead>
            <tr>
                <th class="text-center"><?= Yii::t('app', 'No.') ?></th>
                <th class="text-center"><?= Yii::t('app', 'Ministry')."/".Yii::t('app', 'Province') ?></th>
                <th class="text-center" style="width: 10%"><?= Yii::t('app', 'New') ?></th>
                <th class="text-center" style="width: 10%"><?= Yii::t('app', 'Improve') ?></th>
                <th class="text-center"><?= Yii::t('app', 'Remark') ?></th>
            </tr>
            </thead>
            <tbody ng-repeat="l in models" ng-show="l.approvers.length > 0">
                <tr>
                    <th colspan="6" class="text-center">{{l.name}}</th>
                </tr>
                <tr ng-repeat="a in l.approvers">
                    <td class="text-center">{{$index + 1}}</td>
                    <td>{{l.code == 'M' ? a.ministry.name:a.province.province_name}}</td>
                    <td class="text-center">{{a.association}}</td>
                    <td class="text-center">{{a.foundation}}</td>
                    <td class="text-center">{{a.remark}}</td>
                </tr>
            </tbody>
            <tfoot>
                <tr>
                    <th class="text-center" colspan="2"><?= Yii::t('app', 'Total') ?></th>
                    <th class="text-center">{{sum('association')}}</th>
                    <th class="text-center">{{sum('foundation')}}</th>
                    <th></th>
                </tr>
            </tfoot>
        </table>
    </div>
</div>
<script type="text/javascript" src="js/angular.js"></script>
<script type="text/javascript">
    var app = angular.module('mohaApp', []);
    var url = 'index.php?r=stat-association-foundation/';
    app.controller('statAssoController', function($scope, $http, $sce, $timeout) {
        $scope.sum = [];
        $http.get(url+ 'get')
            .then(function(r) {
                $scope.years = r.data.years;
                $scope.approverLevels = r.data.approverLevels;
            }, function(r) {
                $scope.response = r;
                $timeout(function () {
                    $scope.response = null;
                }, 15000);
            });

        $scope.enquiry = function() {
            $scope.model = null;
            if($scope.year)
                $http.get(url + 'enquiry&year='+$scope.year.id)
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
            if($scope.year && $scope.model.approver)
                $http.get(url+'inquiry&year='+ $scope.year.id+'&approver='+$scope.model.approver.id)
                    .then(function(r) {
                        if(r.data.model) {
                            $scope.model.association = parseInt(r.data.model.association);
                            $scope.model.foundation = parseInt(r.data.model.foundation);
                            $scope.model.remark = r.data.model.remark;
                        } else {
                            $scope.model.association = null;
                            $scope.model.foundation = null;
                            $scope.model.remark = null;
                        }
                    }, function(r) {
                        $scope.response = r;
                        $timeout(function () {
                            $scope.response = null;
                        }, 15000);
                    });
        };

        $scope.save = function() {
            if($scope.year && $scope.model) {
                $scope.model.new = $scope.model.new?1:0;
                $scope.model.improve = $scope.model.improve?1:0;
                $http.post(url+'save&year='+$scope.year.id, {
                    'StatAssociationFoundationDetail': $scope.model,
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
                    console.log($scope.response);
                    $timeout(function () {
                        $scope.response = null;
                    }, 15000);
                });
            }
        };

        $scope.sum = function(key) {
            var total = 0;
            if($scope.models)
                for(var l = 0; l < $scope.models.length; l++) {
                    var level = $scope.models[l];
                    for(var a = 0; a < level.approvers.length; a++)
                        if(level.approvers[a][key])
                          total += parseInt(level.approvers[a][key]);
                }
            return total;
        };
    });
</script>