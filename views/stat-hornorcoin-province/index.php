<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\StatHornorcoingProvinceSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = "ປະເພດຫຼຽນນາມມະຍົດຕ່າງໆ ສຳລັບການຍ້ອງຍໍພາຍໃນຂອງບັນດາແຂວງ";
$this->params['breadcrumbs'][] = $this->title;
?>
<div ng-app="mohaApp" ng-controller="statHornorcoingProvince">
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
                    <input type="text" class="form-control" ng-model="model.remark" >
                </div>
                <div class="col-sm-12" style="margin-top: 1em">
                    <table class="table table-bordered">
                        <thead>
                        <tr>
                            <th class="text-center" colspan="2">ຫຼຽນນາມມະຍົດ ວິລະຊົນແຫ່ງຊາດ</th>
                            <th class="text-center" colspan="2">ຫຼຽນນາມມະຍົດ ນັກຮົບແຂ່ງຂັນ ແຫ່ງຊາດ</th>
                            <th class="text-center" colspan="2">ຫຼຽນນາມມະຍົດ ວິລະຊົນ ແຮງງານ</th>
                            <th class="text-center" colspan="2">ຫຼຽນນາມມະຍົດ ພັດທະນາດີເດັ່ນ ແຫ່ງຊາດ</th>
                        </tr>
                        <tr>
                            <?php for($i=0;$i<8;$i++): ?>
                            <th class="text-center"><?= $i%2==0?'ບຸກຄົນ':'ກົມກອງ' ?></th>
                            <?php endfor; ?>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td><input type="number" class="form-control" ng-model="model.hero_personal" min="0"></td>
                            <td><input type="number" class="form-control" ng-model="model.hero_team" min="0"></td>
                            <td><input type="number" class="form-control" ng-model="model.knight_personal" min="0"></td>
                            <td><input type="number" class="form-control" ng-model="model.knight_team" min="0"></td>
                            <td><input type="number" class="form-control" ng-model="model.labor_personal" min="0"></td>
                            <td><input type="number" class="form-control" ng-model="model.labor_team" min="0"></td>
                            <td><input type="number" class="form-control" ng-model="model.dev_personal" min="0"></td>
                            <td><input type="number" class="form-control" ng-model="model.dev_team" min="0"></td>
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
                    <th class="text-center" rowspan="2"><?= Yii::t('app', 'No.') ?></th>
                    <th class="text-center" rowspan="2" rowspan="2">ຊື່ກະຊວງ ແລະ ອົງການທຽບເທົ່າ</th>
                    <th class="text-center" rowspan="2" rowspan="2">ຍ້ອງຍໍຜົນງານ</th>
                    <th class="text-center" colspan="2">ຫຼຽນນາມມະຍົດວິລະຊົນແຫ່ງຊາດ</th>
                    <th class="text-center" colspan="2">ຫຼຽນນາມມະຍົດນັກຮົບແຂ່ງຂັນແຫ່ງຊາດ</th>
                    <th class="text-center" colspan="2">ຫຼຽນນາມມະຍົດວິລະຊົນແຮງງານ</th>
                    <th class="text-center" colspan="2">ຫຼຽນນາມມະຍົດພັດທະນາດີເດັ່ນແຫ່ງຊາດ</th>
                    <th class="text-center" colspan="2">ລວມ</th>
                    <th class="text-center" rowspan="2">ໝາຍເຫດ</th>
                </tr>
                <tr>
                    <?php for ($i=0;$i<10;$i++):?>
                        <th class="text-center"><?= $i%2 == 0?'ບຸກຄົນ':'ກົມກອງ' ?></th>
                    <?php endfor; ?>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <th colspan="3">ລວມ</th>
                    <td class="text-center">{{sum('hero_personal')| number }} </td>
                    <td class="text-center">{{sum('hero_team')| number }} </td>
                    <td class="text-center">{{sum('knight_personal')| number }} </td>
                    <td class="text-center">{{sum('knight_team')| number }} </td>
                    <td class="text-center">{{sum('labor_personal')| number }} </td>
                    <td class="text-center">{{sum('labor_team')| number }} </td>
                    <td class="text-center">{{sum('dev_personal')| number }} </td>
                    <td class="text-center">{{sum('dev_team')| number }} </td>
                    <td class="text-center">{{sum('hero_personal') + sum('knight_personal') + sum('labor_personal') + sum('dev_personal')}}</td>
                    <td class="text-center">{{sum('hero_team') + sum('knight_team') + sum('labor_team') + sum('dev_team')}}</td>
                    <td class="text-center"></td>
                </tr>
                <tr ng-repeat="model in models">
                    <td class="text-center">{{$index + 1}}</td>
                    <td class="text-center">{{model.province}}</td>
                    <td class="text-center">{{model.award}}</td>
                    <td class="text-center">{{model.hero_personal | number}}</td>
                    <td class="text-center">{{model.hero_team | number}}</td>
                    <td class="text-center">{{model.knight_personal | number}}</td>
                    <td class="text-center">{{model.knight_team | number}}</td>
                    <td class="text-center">{{model.labor_personal | number}}</td>
                    <td class="text-center">{{model.labor_team | number}}</td>
                    <td class="text-center">{{model.dev_personal | number}}</td>
                    <td class="text-center">{{model.dev_team | number}}</td>
                    <td class="text-center">{{sumpersonal(model) | number}}</td>
                    <td class="text-center">{{sumteam(model) | number}}</td>
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
  app.controller('statHornorcoingProvince', function($scope, $http, $sce, $timeout) {
    $scope.url = 'index.php?r=stat-hornorcoin-province/';
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
              $scope.model.hero_personal  = parseInt(r.data.model.hero_personal);
              $scope.model.hero_team      = parseInt(r.data.model.hero_team);
              $scope.model.knight_personal= parseInt(r.data.model.knight_personal);
              $scope.model.knight_team    = parseInt(r.data.model.knight_team);
              $scope.model.labor_personal = parseInt(r.data.model.labor_personal);
              $scope.model.labor_team     = parseInt(r.data.model.labor_team);
              $scope.model.dev_personal   = parseInt(r.data.model.dev_personal);
              $scope.model.dev_team       = parseInt(r.data.model.dev_team);
              $scope.model.remark         = r.data.model.remark;
            } else {
              $scope.model.hero_personal  = null;
              $scope.model.hero_team      = null;
              $scope.model.knight_personal= null;
              $scope.model.knight_team    = null;
              $scope.model.labor_personal = null;
              $scope.model.labor_team     = null;
              $scope.model.dev_personal   = null;
              $scope.model.dev_team       = null;
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

    $scope.sum = function(key) {
      var s = 0;
      for(var i = 0;i < $scope.models.length; i++) {
        if($scope.models[i][key])
          s += parseInt($scope.models[i][key]);
      }
      return s;
    };

    $scope.sumpersonal = function(m) {
      var s = 0;
      if(m['hero_personal'])
        s += parseInt(m['hero_personal']);
      if(m['knight_personal'])
        s += parseInt(m['knight_personal']);
      if(m['labor_personal'])
        s += parseInt(m['labor_personal']);
      if(m['dev_personal'])
        s += parseInt(m['dev_personal']);
      return s;
    };

    $scope.sumteam = function(m) {
      var s = 0;
      if(m['hero_team'])
        s += parseInt(m['hero_team']);
      if(m['knight_team'])
        s += parseInt(m['knight_team']);
      if(m['labor_team'])
        s += parseInt(m['labor_team']);
      if(m['dev_team'])
        s += parseInt(m['dev_team']);
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
