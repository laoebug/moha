<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\StatOfficerResignSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = Yii::t('app', 'Stat Officer Resigns');
//$this->params['breadcrumbs'][] = $this->title;
?>
<div ng-app="mohaApp" ng-controller="officerResignController">
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
            <div class="panel-heading"><i class="fa fa-pencil"></i> </div>
            <div class="panel-body">
                <div class="col-sm-12">
                    <table class="table table-bordered table-hover">
                        <thead>
                        <tr>
                            <th class="text-center"><?= Yii::t('app', 'Description')?></th>
                            <th class="text-center"><?= Yii::t('app', 'Total')?></th>
                            <th class="text-center"><?= Yii::t('app', 'Women')?></th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td><?= Yii::t('app', 'Retire') ?></td><td><input type="number" min="0" ng-model="model.retire_total" class="form-control"></td><td><input type="number" min="0" ng-model="model.retire_women" max="{{model.retire_total}}" class="form-control"></td>
                        </tr>
                        <tr>
                            <td><?= Yii::t('app', 'Bumnet') ?></td><td><input type="number" min="0" ng-model="model.bumnet_total" class="form-control"></td><td><input type="number" min="0" ng-model="model.bumnet_women" max="{{model.bumnet_total}}" class="form-control"></td>
                        </tr>
                        <tr>
                            <td><?= Yii::t('app', 'Die') ?></td><td><input type="number" min="0" ng-model="model.die_total" class="form-control"></td><td><input type="number" min="0" ng-model="model.die_women" max="{{model.die_total}}" class="form-control"></td>
                        </tr>
                        <tr>
                            <td><?= Yii::t('app', 'Leave') ?></td><td><input type="number" min="0" ng-model="model.leave_total" class="form-control"></td><td><input type="number" min="0" ng-model="model.leave_women" max="{{model.leave_total}}" class="form-control"></td>
                        </tr>
                        <tr>
                            <td><?= Yii::t('app', 'Fire') ?></td><td><input type="number" min="0" ng-model="model.fire_total" class="form-control"></td><td><input type="number" min="0" ng-model="model.fire_women" max="{{model.fire_total}}" class="form-control"></td>
                        </tr>
                        <tr>
                            <td><?= Yii::t('app', 'Resign') ?></td><td><input type="number" min="0" ng-model="model.resign_total" class="form-control"></td><td><input type="number" min="0" ng-model="model.resign_women" max="{{model.resign_total}}" class="form-control"></td>
                        </tr>
                        <tr>
                            <td><?= Yii::t('app', 'Lose') ?></td><td><input type="number" min="0" ng-model="model.lose_total" class="form-control"></td><td><input type="number" min="0" ng-model="model.lose_women" max="{{model.lose_total}}" class="form-control"></td>
                        </tr>
                        <tr>
                            <td><?= Yii::t('app', 'Move to SOE') ?></td><td><input type="number" min="0" ng-model="model.move_soe_total" class="form-control"></td><td><input type="number" min="0" ng-model="model.move_soe_women" max="{{model.move_ministry_total}}" class="form-control"></td>
                        </tr>
                        <tr>
                            <td><?= Yii::t('app', 'Moveto Ministry') ?></td><td><input type="number" min="0" ng-model="model.moveto_ministry_total" class="form-control"></td><td><input type="number" min="0" ng-model="model.moveto_ministry_women" max="{{model.moveto_ministry_total}}" class="form-control"></td>
                        </tr>
                        <tr>
                            <td><?= Yii::t('app', 'Move-In Ministry') ?></td><td><input type="number" min="0" ng-model="model.movein_ministry_total" class="form-control"></td><td><input type="number" min="0" ng-model="model.movein_ministry_women" max="{{model.movein_ministry_total}}" class="form-control"></td>
                        </tr>
                        </tbody>
                    </table>
                </div>
                <div class="col-sm-12">

                </div>
                <div class="col-sm-2" style="margin-top: 1em">
                    <button type="button" class="btn btn-primary col-sm-12" ng-click="save()">
                        <i class="fa fa-save"></i> <?= Yii::t('app', 'Save') ?>
                    </button>
                </div>
            </div>
        </div>
    </div>
    <div ng-show="model" class="col-sm-12" style="margin-top: 2em;overflow-x: scroll">
        <div class="card">
            <div class="card-title-w-btn ">
                <h3><?= $this->title ?> {{year.year}}</h3>
                <p>
                    <a class="btn btn-default" target="_blank" href="{{url}}print&year={{year.id}}"><i class="fa fa-print fa-2x"></i></a>
                    <a class="btn btn-info" target="_blank" href="{{url}}download&year={{year.id}}"><i class="fa fa-download fa-2x"></i></a>
                </p>
            </div>
            <table class="table table-bordered table-hover">
                <thead>
                    <tr>
                        <th class="text-center" rowspan="2"><?= Yii::t('app', 'No.')?></th>
                        <th class="text-center" rowspan="2"><?= Yii::t('app', 'Description')?></th>
                        <th class="text-center" colspan="3"><?= Yii::t('app', 'Officer')?></th>
                    </tr>
                    <tr>
                        <th class="text-center"><?= Yii::t('app', 'Total')?></th>
                        <th class="text-center"><?= Yii::t('app', 'Women')?></th>
                        <th class="text-center"><?= Yii::t('app', 'Men')?></th>
                    </tr>
                </thead>
                <tbody>
                <tr>
                    <th class="text-center" rowspan="12">V</th>
                    <th><?= Yii::t('app', 'Officers Resignation') ?></th>
                    <th class="text-center">{{formatNumber(model.retire_total + model.bumnet_total + model.die_total + model.leave_total + model.fire_total + model.resign_total + model.lose_total)}}</th>
                    <th class="text-center">{{formatNumber(model.retire_women + model.bumnet_women + model.die_women + model.leave_women + model.fire_women + model.resign_women + model.lose_women)}}</th>
                    <th class="text-center">{{formatNumber(model.retire_total + model.bumnet_total + model.die_total + model.leave_total + model.fire_total + model.resign_total + model.lose_total - (model.retire_women + model.bumnet_women + model.die_women + model.leave_women + model.fire_women + model.resign_women + model.lose_women))}}</th>
                </tr>
                <tr>
                    <td>1. <?= Yii::t('app', 'Retire') ?></td><td class='text-center'>{{formatNumber(model.retire_total)}}</td><td class='text-center'>{{formatNumber(model.retire_women)}}</td><td class='text-center'>{{formatNumber(model.retire_total - model.retire_women)}}</td>
                </tr>
                <tr>
                    <td>2. <?= Yii::t('app', 'Bumnet') ?></td><td class='text-center'>{{formatNumber(model.bumnet_total)}}</td><td class='text-center'>{{formatNumber(model.bumnet_women)}}</td><td class='text-center'>{{formatNumber(model.bumnet_total - model.bumnet_women)}}</td>
                </tr>
                <tr>
                    <td>3. <?= Yii::t('app', 'Die') ?></td><td class='text-center'>{{formatNumber(model.die_total)}}</td><td class='text-center'>{{formatNumber(model.die_women)}}</td><td class='text-center'>{{formatNumber(model.die_total - model.die_women)}}</td>
                </tr>
                <tr>
                    <td>4. <?= Yii::t('app', 'Leave') ?></td><td class='text-center'>{{formatNumber(model.leave_total)}}</td><td class='text-center'>{{formatNumber(model.leave_women)}}</td><td class='text-center'>{{formatNumber(model.leave_total - model.leave_women)}}</td>
                </tr>
                <tr>
                    <td>5. <?= Yii::t('app', 'Fire') ?></td><td class='text-center'>{{formatNumber(model.fire_total)}}</td><td class='text-center'>{{formatNumber(model.fire_women)}}</td><td class='text-center'>{{formatNumber(model.fire_total - model.fire_women)}}</td>
                </tr>
                <tr>
                    <td>6. <?= Yii::t('app', 'Resign') ?></td><td class='text-center'>{{formatNumber(model.resign_total)}}</td><td class='text-center'>{{formatNumber(model.resign_women)}}</td><td class='text-center'>{{formatNumber(model.resign_total - model.resign_women)}}</td>
                </tr>
                <tr>
                    <td>7. <?= Yii::t('app', 'Lose') ?></td><td class='text-center'>{{formatNumber(model.lose_total)}}</td><td class='text-center'>{{formatNumber(model.lose_women)}}</td><td class='text-center'>{{formatNumber(model.lose_total - model.lose_women)}}</td>
                </tr>
                <tr>
                    <td>8. <?= Yii::t('app', 'Move to SOE') ?></td><td class='text-center'>{{formatNumber(model.move_soe_total)}}</td><td class='text-center'>{{formatNumber(model.move_soe_women)}}</td><td class='text-center'>{{formatNumber(model.move_soe_total - model.move_soe_women)}}</td>
                </tr>
                <tr>
                    <th><?= Yii::t('app', 'Moveto Ministry') ?></th>
                    <th class="text-center">{{formatNumber(model.moveto_ministry_total + model.movein_ministry_total)}}</th>
                    <th class="text-center">{{formatNumber(model.moveto_ministry_women + model.movein_ministry_women)}}</th>
                    <th class="text-center">{{formatNumber(model.moveto_ministry_total + model.movein_ministry_total - (model.moveto_ministry_women + model.movein_ministry_women))}}</th>
                </tr>
                <tr>
                    <td>1. <?= Yii::t('app', 'Moveto Ministry') ?></td><td class='text-center'>{{formatNumber(model.moveto_ministry_total)}}</td><td class='text-center'>{{formatNumber(model.moveto_ministry_women)}}</td><td class='text-center'>{{formatNumber(model.moveto_ministry_total - model.moveto_ministry_women)}}</td>
                </tr>
                <tr>
                    <td>2. <?= Yii::t('app', 'Move-In Ministry') ?></td><td class='text-center'>{{formatNumber(model.movein_ministry_total)}}</td><td class='text-center'>{{formatNumber(model.movein_ministry_women)}}</td><td class='text-center'>{{formatNumber(model.movein_ministry_total - model.movein_ministry_women)}}</td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>
<script type="text/javascript" src="js/angular.js"></script>
<script type="text/javascript">
  var app = angular.module('mohaApp', []);
  app.controller('officerResignController', function($scope, $http, $sce, $timeout) {
    $scope.url = 'index.php?r=stat-officer-resign/';
    $http.get($scope.url+ 'get')
      .then(function(r) {
        $scope.years = r.data.years;
      }, function(r) {
        $scope.response = r;
        $timeout(function () {
          $scope.response = null;
        }, 15000);
      });

    $scope.enquiry = function() {
      $scope.model = null;
      if($scope.year)
        $http.get($scope.url + 'enquiry&year='+$scope.year.id)
          .then(function(r) {
            $scope.model = r.data.model;
            if(r.data.model) {
              $scope.model.retire_total = parseInt($scope.model.retire_total);
              $scope.model.bumnet_total = parseInt($scope.model.bumnet_total);
              $scope.model.die_total = parseInt($scope.model.die_total);
              $scope.model.leave_total = parseInt($scope.model.leave_total);
              $scope.model.fire_total = parseInt($scope.model.fire_total);
              $scope.model.resign_total = parseInt($scope.model.resign_total);
              $scope.model.lose_total = parseInt($scope.model.lose_total);
              $scope.model.move_soe_total = parseInt($scope.model.move_soe_total);
              $scope.model.move_soe_total = parseInt($scope.model.move_soe_total);
              $scope.model.moveto_ministry_total = parseInt($scope.model.moveto_ministry_total);
              $scope.model.movein_ministry_total = parseInt($scope.model.movein_ministry_total);

              $scope.model.retire_women = parseInt($scope.model.retire_women);
              $scope.model.bumnet_women = parseInt($scope.model.bumnet_women);
              $scope.model.die_women = parseInt($scope.model.die_women);
              $scope.model.leave_women = parseInt($scope.model.leave_women);
              $scope.model.fire_women = parseInt($scope.model.fire_women);
              $scope.model.resign_women = parseInt($scope.model.resign_women);
              $scope.model.lose_women = parseInt($scope.model.lose_women);
              $scope.model.move_soe_women = parseInt($scope.model.move_soe_women);
              $scope.model.move_soe_women = parseInt($scope.model.move_soe_women);
              $scope.model.moveto_ministry_women = parseInt($scope.model.moveto_ministry_women);
              $scope.model.movein_ministry_women = parseInt($scope.model.movein_ministry_women);
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
        $http.post($scope.url+'save&year='+$scope.year.id, {
          'Model': $scope.model,
          '_csrf': $('meta[name="csrf-token"]').attr("content")
        }).then(function(r) {
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

    $scope.formatNumber = function(num, dec) {
      if (dec === undefined) dec = 2;
      var r = "" + Math.abs(parseFloat(num).toFixed(dec));
      var decimals = "";
      if (r.lastIndexOf(".") != -1) {
        decimals = "." + r.substring(r.lastIndexOf(".") + 1);
        decimals = decimals.substring(0, Math.min(dec + 1, decimals.length)); // Take only 2 digits after decimals
        r = r.substring(0, r.lastIndexOf("."));
      }
      for (var i = r.length - 3; i > 0; i -= 3)
        r = r.substr(0, i) + "," + r.substr(i);
      return (num < 0 ? "-" : "") + r + decimals;
    }
  });
</script>
