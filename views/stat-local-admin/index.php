<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\StatLocalAdminSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = Yii::t('app', 'Stat Local Admins');
?>
<div class="row" ng-app="mohaApp" ng-controller="statLocalAdminController">
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
                    <table class="table">
                        <tr>
                            <td class="text-center" colspan="2"><?=Yii::t('app', 'Province Head') ?></td>
                            <td class="text-center" colspan="2"><?=Yii::t('app', 'Province Vice') ?></td>
                            <td class="text-center" colspan="2"><?=Yii::t('app', 'District Head') ?></td>
                            <td class="text-center" colspan="2"><?=Yii::t('app', 'District Vice') ?></td>
                        </tr>
                        <tr>
                            <td class="text-center" style="width: 12.5%"><?=Yii::t('app', 'T') ?></td>
                            <td class="text-center" style="width: 12.5%"><?=Yii::t('app', 'W') ?></td>
                            <td class="text-center" style="width: 12.5%"><?=Yii::t('app', 'T') ?></td>
                            <td class="text-center" style="width: 12.5%"><?=Yii::t('app', 'W') ?></td>
                            <td class="text-center" style="width: 12.5%"><?=Yii::t('app', 'T') ?></td>
                            <td class="text-center" style="width: 12.5%"><?=Yii::t('app', 'W') ?></td>
                            <td class="text-center" style="width: 12.5%"><?=Yii::t('app', 'T') ?></td>
                            <td class="text-center" style="width: 12.5%"><?=Yii::t('app', 'W') ?></td>
                        </tr>
                        <tr>
                            <td class="text-center"><input min="0" type="number" class="form-control" ng-model="model.province_head_total"></td>
                            <td class="text-center"><input
                                        ng-blur="model.province_head_women=model.province_head_total < model.province_head_women?null:model.province_head_women"
                                        min="0" max="{{model.province_head_total}}" type="number" class="form-control" ng-model="model.province_head_women"></td>
                            <td class="text-center"><input min="0" type="number" class="form-control" ng-model="model.province_vice_total"></td>
                            <td class="text-center"><input
                                        ng-blur="model.province_vice_women=model.province_vice_total < model.province_vice_women? null:model.province_vice_women"
                                        min="0" max="{{model.province_vice_total}}" type="number" class="form-control" ng-model="model.province_vice_women"></td>

                            <td class="text-center"><input min="0" max="1" type="number" class="form-control" ng-model="model.district_head_total"></td>
                            <td class="text-center"><input
                                        ng-blur="model.district_head_women=model.district_head_total < model.district_head_women? null:model.district_head_women"
                                        min="0" max="{{model.district_head_total}}" type="number" class="form-control" ng-model="model.district_head_women"></td>
                            <td class="text-center"><input min="0" max="1" type="number" class="form-control" ng-model="model.district_vice_total"></td>
                            <td class="text-center"><input
                                        ng-blur="model.district_vice_women=model.district_vice_total < model.district_vice_women? null:model.district_vice_women"
                                        min="0" max="{{model.village_head_total}}" type="number" class="form-control" ng-model="model.district_vice_women"></td>
                        </tr>
                    </table>
                </div>
                <div class="col-sm-12">
                    <table class="table">
                        <tr>
                            <td class="text-center" colspan="2"><?=Yii::t('app', 'Village Head') ?></td>
                            <td class="text-center" colspan="2"><?=Yii::t('app', 'Village Vice') ?></td>
                            <td class="text-center" colspan="2"><?=Yii::t('app', 'Population') ?></td>
                            <td class="text-center" ><?=Yii::t('app', 'Village') ?></td>
                            <td class="text-center" colspan="2"><?=Yii::t('app', 'Family') ?></td>
                        </tr>
                        <tr>
                            <td class="text-center" style="width: 9%"><?=Yii::t('app', 'T') ?></td>
                            <td class="text-center" style="width: 9%"><?=Yii::t('app', 'W') ?></td>
                            <td class="text-center" style="width: 9%"><?=Yii::t('app', 'T') ?></td>
                            <td class="text-center" style="width: 9%"><?=Yii::t('app', 'W') ?></td>
                            <td class="text-center" style="width: 11%"><?=Yii::t('app', 'T') ?></td>
                            <td class="text-center" style="width: 11%"><?=Yii::t('app', 'W') ?></td>
                            <td class="text-center" style="width: 9%"><?=Yii::t('app', 'T') ?></td>
                            <td class="text-center" style="width: 11%"><?=Yii::t('app', 'W') ?></td>
                            <td class="text-center" style="width: 11%"><?=Yii::t('app', 'P') ?></td>
                        </tr>
                        <tr>
                            <td class="text-center"><input min="0" type="number" class="form-control" ng-model="model.village_head_total"></td>
                            <td class="text-center"><input ng-blur="model.village_head_women=model.village_head_total<model.village_head_women?null:model.village_head_women"
                                                           min="0" max="{{model.village_head_total}}" type="number" class="form-control" ng-model="model.village_head_women"></td>
                            <td class="text-center"><input min="0" type="number" class="form-control" ng-model="model.village_vice_total"></td>
                            <td class="text-center"><input
                                        ng-blur="model.village_vice_women=model.village_vice_total<model.village_vice_women?null:model.village_vice_women"
                                        min="0" max="{{model.village_vice_total}}" type="number" class="form-control" ng-model="model.village_vice_women"></td>
                            <td class="text-center"><input min="0" type="number" class="form-control" ng-model="model.population_total"></td>
                            <td class="text-center"><input
                                        ng-blur="model.population_women=model.population_total<model.population_women?null:model.population_women"
                                        min="0" max="{{model.population_total}}" type="number" class="form-control" ng-model="model.population_women"></td>
                            <td class="text-center"><input min="0" type="number" class="form-control" ng-model="model.village_total"></td>
                            <td class="text-center"><input min="0" max="{{model.family_total}}" type="number" class="form-control" ng-model="model.family_total"></td>
                            <td class="text-center"><input
                                        ng-blur="model.family_poor=model.family_total<model.family_poor?null:model.family_poor"
                                        min="0" max="{{model.family_poor}}" type="number" class="form-control" ng-model="model.family_women"></td>
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
            <h3><?= Yii::t('app', 'Statistics of Local Administration') ?></h3>
            <p>
                <a class="btn btn-default" target="_blank" href="{{url}}print&year={{year.id}}"><i class="fa fa-print fa-2x"></i></a>
                <a class="btn btn-info" target="_blank" href="{{url}}download&year={{year.id}}"><i class="fa fa-download fa-2x"></i></a>
            </p>
        </div>
        <table class="table table-bordered table-hover" ng-show="models">
            <thead>
                <tr>
                    <th class="text-center" rowspan="2"><?= Yii::t('app', 'No.') ?></th>
                    <th class="text-center" rowspan="2"><?= Yii::t('app', 'Province') ?></th>
                    <th class="text-center" colspan="2"><?= Yii::t('app', 'Province Head') ?></th>
                    <th class="text-center" colspan="2"><?= Yii::t('app', 'Province Vice') ?></th>
                    <th class="text-center" colspan="2"><?= Yii::t('app', 'District Head') ?></th>
                    <th class="text-center" colspan="2"><?= Yii::t('app', 'District Vice') ?></th>
                    <th class="text-center" colspan="2"><?= Yii::t('app', 'Village Head') ?></th>
                    <th class="text-center" colspan="2"><?= Yii::t('app', 'Village Vice') ?></th>
                    <th class="text-center" colspan="2"><?= Yii::t('app', 'Population') ?></th>
                    <th class="text-center"><?= Yii::t('app', 'Village') ?></th>
                    <th class="text-center" colspan="2"><?= Yii::t('app', 'Family') ?></th>
                </tr>
                <tr>
                    <th class="text-center"><?= Yii::t('app', 'T') ?></th>
                    <th class="text-center"><?= Yii::t('app', 'W') ?></th>
                    <th class="text-center"><?= Yii::t('app', 'T') ?></th>
                    <th class="text-center"><?= Yii::t('app', 'W') ?></th>
                    <th class="text-center"><?= Yii::t('app', 'T') ?></th>
                    <th class="text-center"><?= Yii::t('app', 'W') ?></th>
                    <th class="text-center"><?= Yii::t('app', 'T') ?></th>
                    <th class="text-center"><?= Yii::t('app', 'W') ?></th>
                    <th class="text-center"><?= Yii::t('app', 'T') ?></th>
                    <th class="text-center"><?= Yii::t('app', 'W') ?></th>
                    <th class="text-center"><?= Yii::t('app', 'T') ?></th>
                    <th class="text-center"><?= Yii::t('app', 'W') ?></th>
                    <th class="text-center"><?= Yii::t('app', 'T') ?></th>
                    <th class="text-center"><?= Yii::t('app', 'W') ?></th>
                    <th class="text-center"><?= Yii::t('app', 'T') ?></th>
                    <th class="text-center"><?= Yii::t('app', 'T') ?></th>
                    <th class="text-center"><?= Yii::t('app', 'P') ?></th>
                </tr>
                <tr>
                    <th class="text-center" colspan="2"><?= Yii::t('app', 'Total') ?></th>
                    <th class="text-center">{{sum('province_head_total')}}</th>
                    <th class="text-center">{{sum('province_head_women')}}</th>
                    <th class="text-center">{{sum('province_vice_total')}}</th>
                    <th class="text-center">{{sum('province_vice_women')}}</th>
                    <th class="text-center">{{sum('district_head_total')}}</th>
                    <th class="text-center">{{sum('district_head_women')}}</th>
                    <th class="text-center">{{sum('district_vice_total')}}</th>
                    <th class="text-center">{{sum('district_vice_women')}}</th>
                    <th class="text-center">{{sum('village_head_total')}}</th>
                    <th class="text-center">{{sum('village_head_women')}}</th>
                    <th class="text-center">{{sum('village_vice_total')}}</th>
                    <th class="text-center">{{sum('village_vice_women')}}</th>
                    <th class="text-center">{{sum('population_total')}}</th>
                    <th class="text-center">{{sum('population_women')}}</th>
                    <th class="text-center">{{sum('village_total')}}</th>
                    <th class="text-center">{{sum('family_total')}}</th>
                    <th class="text-center">{{sum('family_poor')}}</th>
                </tr>
            </thead>
            <tbody>
                <tr ng-repeat="m in models">
                    <td class="text-center">{{$index + 1}}</td>
                    <td>{{m.province_name}}</td>
                    <td class="text-center">{{m.province_head_total}}</td>
                    <td class="text-center">{{m.province_head_women}}</td>
                    <td class="text-center">{{m.province_vice_total}}</td>
                    <td class="text-center">{{m.province_vice_women}}</td>
                    <td class="text-center">{{m.district_head_total}}</td>
                    <td class="text-center">{{m.district_head_women}}</td>
                    <td class="text-center">{{m.district_vice_total}}</td>
                    <td class="text-center">{{m.district_vice_women}}</td>
                    <td class="text-center">{{m.village_head_total}}</td>
                    <td class="text-center">{{m.village_head_women}}</td>
                    <td class="text-center">{{m.village_vice_total}}</td>
                    <td class="text-center">{{m.village_vice_women}}</td>
                    <td class="text-center">{{m.population_total}}</td>
                    <td class="text-center">{{m.population_women}}</td>
                    <td class="text-center">{{m.village_total}}</td>
                    <td class="text-center">{{m.family_total}}</td>
                    <td class="text-center">{{m.family_poor}}</td>
                </tr>
            </tbody>
        </table>
    </div>
</div>
<script type="text/javascript" src="js/angular.js"></script>
<script type="text/javascript">
  var app = angular.module('mohaApp', []);
  app.controller('statLocalAdminController', function($scope, $http, $sce, $timeout) {
    $scope.url = 'index.php?r=stat-local-admin/';
    $scope.sum = [];
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
            var p = $scope.model.province;
            if(r.data.model) {
              $scope.model.province_head_total = parseInt(r.data.model.province_head_total);
              $scope.model.province_head_women = parseInt(r.data.model.province_head_women);
              $scope.model.province_vice_total = parseInt(r.data.model.province_vice_total);
              $scope.model.province_vice_women = parseInt(r.data.model.province_vice_women);
              $scope.model.district_head_total = parseInt(r.data.model.district_head_total);
              $scope.model.district_head_women = parseInt(r.data.model.district_head_women);
              $scope.model.district_vice_total = parseInt(r.data.model.district_vice_total);
              $scope.model.district_vice_women = parseInt(r.data.model.district_vice_women);
              $scope.model.village_head_total = parseInt(r.data.model.village_head_total);
              $scope.model.village_head_women = parseInt(r.data.model.village_head_women);
              $scope.model.village_vice_total = parseInt(r.data.model.village_vice_total);
              $scope.model.village_vice_women = parseInt(r.data.model.village_vice_women);
              $scope.model.population_total = parseInt(r.data.model.population_total);
              $scope.model.population_women = parseInt(r.data.model.population_women);
              $scope.model.village_total = parseInt(r.data.model.village_total);
              $scope.model.family_total = parseInt(r.data.model.family_total);
              $scope.model.family_poor = parseInt(r.data.model.family_poor);
            } else {

              $scope.model.province_head_total = null;
              $scope.model.province_head_women = null;
              $scope.model.province_vice_total = null;
              $scope.model.province_vice_women = null;
              $scope.model.district_head_total = null;
              $scope.model.district_head_women = null;
              $scope.model.district_vice_total = null;
              $scope.model.district_vice_women = null;
              $scope.model.village_head_total = null;
              $scope.model.village_head_women = null;
              $scope.model.village_vice_total = null;
              $scope.model.village_vice_women = null;
              $scope.model.population_total = null;
              $scope.model.population_women = null;
              $scope.model.village_total = null;
              $scope.model.family_total = null;
              $scope.model.family_poor = null;
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
        console.log($scope.model);
        $http.post($scope.url+'save&year='+$scope.year.id, {
          'StatLocalAdminDetail': $scope.model,
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
