<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\StatGovcoinProvinceSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = "ປະເພດຫຼຽນກາສຳລັບຍ້ອງຍໍພາຍໃນຂອງບັນດາແຂວງ, ນະຄອນຫຼວງວຽງຈັນ";
$this->params['breadcrumbs'][] = $this->title;
?>
<div ng-app="mohaApp" ng-controller="statGovcoinProvince">
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
                <div class="col-sm-3">
                    <label><?= Yii::t('app', 'Province') ?></label>
                    <select class="form-control" ng-model="model.province" ng-change="inquiry()" ng-options="m.province_name for m in provinces"></select>
                </div>
                <div class="col-sm-3">
                    <label><?= Yii::t('app', 'Award') ?></label>
                    <select class="form-control" ng-model="model.award" ng-change="inquiry()" ng-options="a.name for a in awards"></select>
                </div>
                <div class="col-sm-6">
                    <label><?= Yii::t('app', 'Remark') ?></label>
                    <input type="text" class="form-control" ng-model="model.remark">
                </div>
                <div class="col-sm-12" style="margin-top: 1em">
                    <table class="table table-bordered">
                        <thead>
                        <tr>
                            <?php foreach($labels as $label): ?>
                                <th class="text-center" colspan="2"><?= $label ?></th>
                            <?php endforeach; ?>
                        </tr>
                        <tr>
                            <?php for($i=0;$i<12;$i++): ?>
                            <th class="text-center"><?= $i%2==0?'ບຸກຄົນ':'ກົມກອງ' ?></th>
                            <?php endfor; ?>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td><input type="number" class="form-control" ng-model="model.labo_personal"    min="0"></td>
                            <td><input type="number" class="form-control" ng-model="model.labo_team"        min="0"></td>
                            <td><input type="number" class="form-control" ng-model="model.deve_personal"    min="0"></td>
                            <td><input type="number" class="form-control" ng-model="model.deve_team"        min="0"></td>
                            <td><input type="number" class="form-control" ng-model="model.memo_personal"    min="0"></td>
                            <td><input type="number" class="form-control" ng-model="model.memo_team"        min="0"></td>
                            <td><input type="number" class="form-control" ng-model="model.amer_personal"    min="0"></td>
                            <td><input type="number" class="form-control" ng-model="model.amer_team"        min="0"></td>
                            <td><input type="number" class="form-control" ng-model="model.fran_personal"    min="0"></td>
                            <td><input type="number" class="form-control" ng-model="model.fran_team"        min="0"></td>
                            <td><input type="number" class="form-control" ng-model="model.gove_personal"    min="0"></td>
                            <td><input type="number" class="form-control" ng-model="model.gove_team"        min="0"></td>
                        </tr>
                        </tbody>
                    </table>
                </div>
                <div class="col-sm-2" style="margin-top: 1em">
                    <button type="button" class="btn btn-primary col-sm-12" ng-click="save()">
                        <i class="fa fa-save"></i> <?= Yii::t('app', 'Save') ?>
                    </button>
                </div>
            </div>
        </div>
    </div>
    <div ng-if="models" class="col-sm-12" style="margin-top: 2em;overflow-x: scroll">
        <div class="card" style="overflow-x: scroll">
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
                    <th class="text-center" rowspan="3"><?= Yii::t('app', 'No.') ?></th>
                    <th class="text-center" rowspan="3" rowspan="2">ຊື່ກະຊວງ ແລະ ອົງການທຽບເທົ່າ</th>
                    <th class="text-center" rowspan="3" rowspan="2">ຍ້ອງຍໍຜົນງານ</th>
                    <th class="text-center" colspan="10">ປະເພດຫຼຽນກາ</th>
                    <th class="text-center" colspan="2" rowspan="2">ໃບຍ້ອງຍໍລັດຖະບານ</th>
                    <th class="text-center" colspan="2" rowspan="2">ລວມ</th>
                    <th class="text-center" rowspan="3">ໝາຍເຫດ</th>
                </tr>
                <tr>
                    <?php foreach ($labels as $i => $label): if($i==5) break; ?>
                        <th class="text-center" colspan="2"><?= $label ?></th>
                    <?php endforeach; ?>
                </tr>
                <tr>
                    <?php for ($i=0;$i<count($labels)*2 + 2;$i++):?>
                        <th class="text-center"><?= $i%2 == 0?'ບຸກຄົນ':'ກົມກອງ' ?></th>
                    <?php endfor; ?>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <th class="text-center" colspan="3">ລວມ</th>
                    <td class="text-center">{{sumcolumn('labo_personal') | number }} </td>
                    <td class="text-center">{{sumcolumn('labo_team')     | number }} </td>
                    <td class="text-center">{{sumcolumn('deve_personal') | number }} </td>
                    <td class="text-center">{{sumcolumn('deve_team')     | number }} </td>
                    <td class="text-center">{{sumcolumn('memo_personal') | number }} </td>
                    <td class="text-center">{{sumcolumn('memo_team')     | number }} </td>

                    <td class="text-center">{{sumcolumn('amer_personal') | number }} </td>
                    <td class="text-center">{{sumcolumn('amer_team')     | number }} </td>
                    <td class="text-center">{{sumcolumn('fran_personal') | number }} </td>
                    <td class="text-center">{{sumcolumn('fran_team')     | number }} </td>
                    <td class="text-center">{{sumcolumn('gove_personal') | number }} </td>
                    <td class="text-center">{{sumcolumn('gove_team')     | number }} </td>

                    <td class="text-center">{{sumtotal('personal')         | number }}</td>
                    <td class="text-center">{{sumtotal('team')             | number }}</td>

                    <td class="text-center"></td>
                </tr>
                <tr ng-repeat="model in models">
                    <td class="text-center">{{$index + 1}}</td>
                    <td class="text-center">{{model.province}}</td>
                    <td class="text-center">{{model.award}}</td>
                    <td class="text-center">{{model.labo_personal| number }} </td>
                    <td class="text-center">{{model.labo_team    | number }} </td>
                    <td class="text-center">{{model.deve_personal| number }} </td>
                    <td class="text-center">{{model.deve_team    | number }} </td>
                    <td class="text-center">{{model.memo_personal| number }} </td>
                    <td class="text-center">{{model.memo_team    | number }} </td>
                    <td class="text-center">{{model.amer_personal| number }} </td>
                    <td class="text-center">{{model.amer_team    | number }} </td>
                    <td class="text-center">{{model.fran_personal| number }} </td>
                    <td class="text-center">{{model.fran_team    | number }} </td>
                    <td class="text-center">{{model.gove_personal| number }} </td>
                    <td class="text-center">{{model.gove_team    | number }} </td>

                    <td class="text-center">{{sumrow($index, 'personal') | number }}</td>
                    <td class="text-center">{{sumrow($index, 'team')      | number }}</td>

                    <td class="text-center">{{model.remark}}</td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>
<script type="text/javascript" src="js/angular.js"></script>
<script type="text/javascript">
  var app = angular.module('mohaApp', []);
  app.controller('statGovcoinProvince', function($scope, $http, $sce, $timeout) {
    $scope.url = 'index.php?r=stat-govcoin-province/';
    $scope.mode = 'read';
    $scope.changemode = function() {
      $scope.mode = $scope.mode == 'read'?'input':'read';
    };
    $http.get($scope.url+ 'get')
      .then(function(r) {
        $scope.years = r.data.years;
        $scope.provinces = r.data.provinces;
        $scope.awards = r.data.awards;
      }, function(r) {
        $scope.response = r;
        $timeout(function () {
          $scope.response = null;
        }, 15000);
      });

    $scope.enquiry = function() {
      $scope.models = null;
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
      if($scope.model.province && $scope.model.award) {
        $http.get($scope.url + 'inquiry&year='+$scope.year.id + '&province='+$scope.model.province.id+'&award='+$scope.model.award.id)
          .then(function(r) {
            if(r.data.model) {
              $scope.model.labo_personal  = parseInt(r.data.model.labo_personal);
              $scope.model.labo_team      = parseInt(r.data.model.labo_team);
              $scope.model.deve_personal  = parseInt(r.data.model.deve_personal);
              $scope.model.deve_team      = parseInt(r.data.model.deve_team);
              $scope.model.memo_personal  = parseInt(r.data.model.memo_personal);
              $scope.model.memo_team      = parseInt(r.data.model.memo_team);

              $scope.model.amer_personal  = parseInt(r.data.model.amer_personal);
              $scope.model.amer_team      = parseInt(r.data.model.amer_team);
              $scope.model.fran_personal  = parseInt(r.data.model.fran_personal);
              $scope.model.fran_team      = parseInt(r.data.model.fran_team);
              $scope.model.gove_personal  = parseInt(r.data.model.gove_personal);
              $scope.model.gove_team      = parseInt(r.data.model.gove_team);

              $scope.model.remark         = r.data.model.remark;
            } else {
              $scope.model.labo_personal  = null;
              $scope.model.labo_team      = null;
              $scope.model.deve_personal  = null;
              $scope.model.deve_team      = null;
              $scope.model.memo_personal  = null;
              $scope.model.memo_team      = null;
              $scope.model.amer_personal  = null;
              $scope.model.amer_team      = null;
              $scope.model.fran_personal  = null;
              $scope.model.fran_team      = null;
              $scope.model.gove_personal  = null;
              $scope.model.gove_team      = null;

              $scope.model.remark         = null;
            }
          }, function(r) {
            $scope.response = r;
            $timeout(function () {
              $scope.response = null;
            }, 15000);
          });
      }
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

    $scope.sumcolumn = function(key) {
      var s = 0;
      for(var i = 0;i < $scope.models.length; i++) {
        if($scope.models[i][key])
          s += parseInt($scope.models[i][key]);
      }
      return s;
    };

    $scope.sumrow = function(index, key) {
        var s = 0;
        var model = $scope.models[index];
        if(key == 'personal') {
          if(model.labo_personal) s += parseInt(model.labo_personal);
          if(model.deve_personal) s += parseInt(model.deve_personal);
          if(model.memo_personal) s += parseInt(model.memo_personal);
          if(model.amer_personal) s += parseInt(model.amer_personal);
          if(model.fran_personal) s += parseInt(model.fran_personal);
          if(model.gove_personal) s += parseInt(model.gove_personal);
        }

      if(key == 'team') {
        if(model.labo_team) s += parseInt(model.labo_team);
        if(model.deve_team) s += parseInt(model.deve_team);
        if(model.memo_team) s += parseInt(model.memo_team);
        if(model.amer_team) s += parseInt(model.amer_team);
        if(model.fran_team) s += parseInt(model.fran_team);
        if(model.gove_team) s += parseInt(model.gove_team);
      }

        return s;
    };

    $scope.sumtotal = function(key) {
      var s = 0;
      if(key == 'personal') {
        s += $scope.sumcolumn('labo_personal') + $scope.sumcolumn('deve_personal') + $scope.sumcolumn('memo_personal');
        s += $scope.sumcolumn('amer_personal') + $scope.sumcolumn('fran_personal') + $scope.sumcolumn('gove_personal');
      }

      if(key == 'team') {
        s += $scope.sumcolumn('labo_team') + $scope.sumcolumn('deve_team') + $scope.sumcolumn('memo_team');
        s += $scope.sumcolumn('amer_team') + $scope.sumcolumn('fran_team') + $scope.sumcolumn('gove_team');
      }
      return s;
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
