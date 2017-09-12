<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\StatPopulationMovementSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = Yii::t('app', 'Stat Population Movements');
$this->params['breadcrumbs'][] = $this->title;
?>
<style>
</style>
<div class="row" ng-app="mohaApp" ng-controller="statPopulationMovementController">
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
                <div class="col-sm-3">
                    <label for=""><?= Yii::t('app', 'Province') ?></label>
                    <select class="form-control" ng-model="model.province" ng-options="b.province_name for b in provinces"
                            ng-change="inquiry()">
                    </select>
                </div>
                <div class="col-sm-9">
                    <table class="table table-bordered">
                        <tr>
                            <td class="text-center" rowspan="2"><?=Yii::t('app', 'District') ?></td>
                            <td class="text-center" rowspan="2"><?=Yii::t('app', 'Village') ?></td>
                            <td class="text-center" colspan="2"><?=Yii::t('app', 'Population') ?></td>
                        </tr>
                        <tr>
                            <td class="text-center" style="width: 12.5%"><?=Yii::t('app', 'T') ?></td>
                            <td class="text-center" style="width: 12.5%"><?=Yii::t('app', 'W') ?></td>
                        </tr>
                        <tr>
                            <td class="text-center" style="width: 12%"><input ng-model="model.district" min="0" type="number" class="form-control"></td>
                            <td class="text-center" style="width: 12%"><input ng-model="model.village" min="{{model.village}}" type="number" class="form-control"></td>
                            <td class="text-center" style="width: 18%"><input ng-model="model.population_total" min="0" type="number" class="form-control" ></td>
                            <td class="text-center" style="width: 18%"><input ng-model="model.population_women" max="{{model.population_total}}" type="number" class="form-control"></td>
                        </tr>
                    </table>
                </div>
                <div class="col-sm-12">
                    <table class="table table-bordered">
                        <tr>
                            <td class="text-center" colspan="2"><?=Yii::t('app', 'Born') ?></td>
                            <td class="text-center" colspan="2"><?=Yii::t('app', 'Die') ?></td>
                            <td class="text-center" rowspan="2"><?=Yii::t('app', 'Married') ?></td>
                            <td class="text-center" rowspan="2"><?=Yii::t('app', 'Divorced') ?></td>
                        </tr>
                        <tr>
                            <?php for ($i=0;$i<2;$i++): ?>
                            <td class="text-center" style="width: 12.5%"><?=Yii::t('app', 'T') ?></td>
                            <td class="text-center" style="width: 12.5%"><?=Yii::t('app', 'W') ?></td>
                            <?php endfor; ?>
                        </tr>
                        <tr>
                            <td class="text-center" style="width: 15%"><input ng-model="model.born_total" min="0" type="number" class="form-control" ></td>
                            <td class="text-center" style="width: 15%"><input ng-model="model.born_women" max="{{model.born_total}}" type="number" class="form-control"></td>
                            <td class="text-center" style="width: 10%"><input ng-model="model.die_total" min="0" type="number" class="form-control"></td>
                            <td class="text-center" style="width: 10%"><input ng-model="model.die_women" max="{{model.die_total}}" type="number" class="form-control"></td>
                            <td class="text-center" style="width: 10%"><input ng-model="model.married" min="0" type="number" class="form-control"></td>
                            <td class="text-center" style="width: 10%"><input ng-model="model.divorce" max="{{model.married}}" type="number" class="form-control"></td>
                        </tr>
                    </table>
                </div>
                <div class="col-sm-12">
                    <table class="table table-bordered">
                        <tr>
                            <td class="text-center" colspan="2"><?=Yii::t('app', 'Move-In') ?></td>
                            <td class="text-center" colspan="2"><?=Yii::t('app', 'Move-Out') ?></td>
                            <td class="text-center" colspan="2"><?=Yii::t('app', 'Real') ?></td>
                        </tr>
                        <tr>
                            <?php for ($i=0;$i<3;$i++): ?>
                                <td class="text-center" style="width: 12.5%"><?=Yii::t('app', 'T') ?></td>
                                <td class="text-center" style="width: 12.5%"><?=Yii::t('app', 'W') ?></td>
                            <?php endfor; ?>
                        </tr>
                        <tr>
                            <td class="text-center" style="width: 10%"><input ng-model="model.movein_total" min="0" type="number" class="form-control" ></td>
                            <td class="text-center" style="width: 10%"><input ng-model="model.movein_women" max="{{model.movein_total}}" type="number" class="form-control"></td>
                            <td class="text-center" style="width: 10%"><input ng-model="model.moveout_total" min="0" type="number" class="form-control" ></td>
                            <td class="text-center" style="width: 10%"><input ng-model="model.moveout_women" max="{{model.moveout_total}}" type="number" class="form-control"></td>
                            <td class="text-center" style="width: 10%"><input ng-model="model.real_total" min="0" type="number" class="form-control"></td>
                            <td class="text-center" style="width: 10%"><input ng-model="model.real_women" max="{{model.real_total}}" type="number" class="form-control"></td>
                        </tr>
                    </table>
                </div>
                <div class="col-sm-2 col-sm-offset-5" style="margin-top: 1em">
                    <button type="button" class="btn btn-primary col-sm-12" ng-click="save()">
                        <i class="fa fa-save"></i> <?= Yii::t('app', 'Save') ?>
                    </button>
                </div>
            </div>
        </div>
    </div>
    <div ng-show="models" class="col-sm-12 card" style="margin-top: 2em;overflow-x: scroll">
        <div class="card-title-w-btn ">
            <h3><?= Yii::t('app', 'Statistics of Population Movement') ?></h3>
            <p>
                <a class="btn btn-default" target="_blank" href="{{url}}print&year={{year.id}}"><i class="fa fa-print fa-2x"></i></a>
                <a class="btn btn-info" target="_blank" href="{{url}}download&year={{year.id}}"><i class="fa fa-download fa-2x"></i></a>
            </p>
        </div>
        <table class="table table-bordered table-hover">
            <thead>
            <tr>
                <th class="text-center" rowspan="2"><?= Yii::t('app', 'No.') ?></th>
                <th class="text-center" rowspan="2"><?= Yii::t('app', 'Province') ?></th>
                <th class="text-center" rowspan="2"><?= Yii::t('app', 'District') ?></th>
                <th class="text-center" rowspan="2"><?= Yii::t('app', 'Village') ?></th>
                <th class="text-center" colspan="2"><?= Yii::t('app', 'Population') ?></th>
                <th class="text-center" colspan="2"><?= Yii::t('app', 'Born') ?></th>
                <th class="text-center" colspan="2"><?= Yii::t('app', 'Die') ?></th>
                <th class="text-center" rowspan="2"><?= Yii::t('app', 'Married') ?></th>
                <th class="text-center" rowspan="2"><?= Yii::t('app', 'Divorced') ?></th>
                <th class="text-center" colspan="2"><?= Yii::t('app', 'Move-In') ?></th>
                <th class="text-center" colspan="2"><?= Yii::t('app', 'Move-Out') ?></th>
                <th class="text-center" colspan="2"><?= Yii::t('app', 'Real') ?></th>
            </tr>
            <tr>
                <?php for($i = 0; $i < 6; $i++): ?>
                <th class="text-center"><?= Yii::t('app', 'T') ?></th>
                <th class="text-center"><?= Yii::t('app', 'W') ?></th>
                <?php endfor; ?>
            </tr>
            <tr>
                <th class="text-center" colspan="2"><?= Yii::t('app', 'Total') ?></th>
                <?php foreach ($columns as $c): ?>
                <th class="text-center">{{sum('<?= $c ?>') | number}}</th>
                <?php endforeach; ?>
            </tr>
            </thead>
            <tbody>
            <tr ng-repeat="m in models">
                <td class="text-center">{{$index + 1}}</td>
                <td>{{m.province_name}}</td>
                <?php foreach ($columns as $c): ?>
                    <td class="text-center">{{m.<?= $c ?> | number}}</td>
                <?php endforeach; ?>
            </tr>
            </tbody>
        </table>
    </div>
</div>
<script type="text/javascript" src="js/angular.js"></script>
<script type="text/javascript">
  var app = angular.module('mohaApp', []);
  app.controller('statPopulationMovementController', function($scope, $http, $sce, $timeout) {
    $scope.url = 'index.php?r=stat-population-movement/';
    $http.get($scope.url+ 'get')
      .then(function(r) {
        $scope.years = r.data.years;
        $scope.provinces = r.data.provinces;
      }, function(r) {
        $scope.response = r;
        $timeout(function () {
          $scope.response = null;
        }, 15000);
      });

    $scope.enquiry = function() {
      $scope.model=null;
      if($scope.year)
        $http.get($scope.url + 'enquiry&year='+$scope.year.id)
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
      if($scope.year && $scope.model.province)
        $http.get($scope.url+'inquiry&province='+$scope.model.province.id+'&year='+ $scope.year.id)
          .then(function(r) {
            if(r.data.model) {
              $scope.model.district         = parseInt(r.data.model.district);
              $scope.model.village          = parseInt(r.data.model.village);
              $scope.model.population_total = parseInt(r.data.model.population_total);
              $scope.model.population_women = parseInt(r.data.model.population_women);
              $scope.model.born_total       = parseInt(r.data.model.born_total);
              $scope.model.born_women       = parseInt(r.data.model.born_women);
              $scope.model.die_total        = parseInt(r.data.model.die_total);
              $scope.model.die_women        = parseInt(r.data.model.die_women);
              $scope.model.married          = parseInt(r.data.model.married);
              $scope.model.divorce          = parseInt(r.data.model.divorce);
              $scope.model.movein_total     = parseInt(r.data.model.movein_total);
              $scope.model.movein_women     = parseInt(r.data.model.movein_women);
              $scope.model.moveout_total    = parseInt(r.data.model.moveout_total);
              $scope.model.moveout_women    = parseInt(r.data.model.moveout_women);
              $scope.model.real_total       = parseInt(r.data.model.real_total);
              $scope.model.real_women       = parseInt(r.data.model.real_women);
            } else {
              $scope.model.district         = null;
              $scope.model.village          = null;
              $scope.model.population_total = null;
              $scope.model.population_women = null;
              $scope.model.born_total       = null;
              $scope.model.born_women       = null;
              $scope.model.die_total        = null;
              $scope.model.die_women        = null;
              $scope.model.married          = null;
              $scope.model.divorce          = null;
              $scope.model.movein_total     = null;
              $scope.model.movein_women     = null;
              $scope.model.moveout_total    = null;
              $scope.model.moveout_women    = null;
              $scope.model.real_total       = null;
              $scope.model.real_women       = null;
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
          'StatPopulationMovementDetail': $scope.model,
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

    $scope.sum = function(key) {
      var total = 0;
      if($scope.models)
        for(var n = 0; n < $scope.models.length; n++)
          if($scope.models[n][key])
            total += parseInt($scope.models[n][key]);
      return total == 0 ? null:total;
    };
  });
</script>
