<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\StatContract */

$this->title = "ຕາຕະລາງສັງລວມພະນັກງານຕາມສັນຍາ";
$this->params['breadcrumbs'][] = $this->title;
?>
<div ng-app="mohaApp" ng-controller="statContract">
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
                    <label>ພາກສ່ວນ</label>
                    <select class="form-control" ng-model="model.level" ng-change="inquiry()" ng-options="l.name for l in levels"></select>
                </div>
                <div class="col-sm-12">
                    <table class="table table-bordered table-hover">
                        <thead>
                        <tr>
                            <th class="text-center" colspan="8">ປະເພດພະນັກງານຕາມສັນຍາ</th>
                        </tr>
                        <tr>
                            <th class="text-center" colspan="4">ຕາມໂກຕາທີ່ລັດຖະບານ ອະນຸມັດ</th>
                            <th class="text-center" colspan="4">ບໍ່ນອນໃນ ໂກຕາທີ່ລັດຖະບານ ໄດ້ອະນຸມັດ (ຈ້າງເອງ)</th>
                        </tr>
                        <tr>
                            <th class="text-center" colspan="2">ບໍລິຫານ</th>
                            <th class="text-center" colspan="2">ວິຊາການ</th>
                            <th class="text-center" colspan="2">ບໍລິຫານ</th>
                            <th class="text-center" colspan="2">ວິຊາການ</th>
                        </tr>
                        <?php for ($i=1;$i<=8;$i++): ?>
                            <th class="text-center"><?= $i % 2 == 1 ? 'ລ':'ຍ' ?></th>
                        <?php endfor; ?>
                        </thead>
                        <tbody>
                        <tr>
                            <td><input type="number" class="form-control" ng-model="model.quota_manage_total">
                            </td><td><input type="number" class="form-control" ng-model="model.quota_manage_women">
                            </td><td><input type="number" class="form-control" ng-model="model.quota_technic_total">
                            </td><td><input type="number" class="form-control" ng-model="model.quota_technic_women">
                            </td><td><input type="number" class="form-control" ng-model="model.nonquota_manage_total">
                            </td><td><input type="number" class="form-control" ng-model="model.nonquota_manage_women">
                            </td><td><input type="number" class="form-control" ng-model="model.nonquota_technic_total">
                            </td><td><input type="number" class="form-control" ng-model="model.nonquota_technic_women">
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
                <div class="col-sm-3" style="margin-top: 1em">
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
                    <th rowspan="4" class="text-center">ຊື່ພາກສ່ວນຕ່າງໆ</th>
                    <th rowspan="3" class="text-center" colspan="2">ຈຳນວນພະນັກງານຕາມສັນຍາທັງໝົດ</th>
                    <th class="text-center" colspan="8">ປະເພດພະນັກງານຕາມສັນຍາ</th>
                </tr>
                <tr>
                    <th class="text-center" colspan="4">ຕາມໂກຕາທີ່ລັດຖະບານ ອະນຸມັດ</th>
                    <th class="text-center" colspan="4">ບໍ່ນອນໃນ ໂກຕາທີ່ລັດຖະບານ ໄດ້ອະນຸມັດ (ຈ້າງເອງ)</th>
                </tr>
                <tr>
                    <th class="text-center" colspan="2">ບໍລິຫານ</th>
                    <th class="text-center" colspan="2">ວິຊາການ</th>
                    <th class="text-center" colspan="2">ບໍລິຫານ</th>
                    <th class="text-center" colspan="2">ວິຊາການ</th>
                </tr>
                <tr>
                    <?php for ($i=1;$i<=10;$i++): ?>
                        <th class="text-center"><?= $i % 2 == 1 ? 'ລ':'ຍ' ?></th>
                    <?php endfor; ?>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <th>ກະຊວງພາຍໃນ</th>
                    <td class="text-center">{{sumtotal('total') | number }}</td>
                    <td class="text-center">{{sumtotal('women') | number }}</td>
                    <td class="text-center">{{sumcolumn('quota_manage_total') | number }}</td>
                    <td class="text-center">{{sumcolumn('quota_manage_women') | number }}</td>
                    <td class="text-center">{{sumcolumn('quota_technic_total') | number }}</td>
                    <td class="text-center">{{sumcolumn('quota_technic_women') | number }}</td>
                    <td class="text-center">{{sumcolumn('nonquota_manage_total') | number }}</td>
                    <td class="text-center">{{sumcolumn('nonquota_manage_women') | number }}</td>
                    <td class="text-center">{{sumcolumn('nonquota_technic_total') | number }}</td>
                    <td class="text-center">{{sumcolumn('nonquota_technic_women') | number }}</td>
                </tr>
                <tr ng-repeat="m in models">
                    <td>{{m.name}}</td>
                    <td class="text-center">{{sumrow(m, 'total') | number }}</td>
                    <td class="text-center">{{sumrow(m, 'women') | number }}</td>
                    <td class="text-center">{{m.quota_manage_total | number }}</td>
                    <td class="text-center">{{m.quota_manage_women | number }}</td>
                    <td class="text-center">{{m.quota_technic_total | number }}</td>
                    <td class="text-center">{{m.quota_technic_women | number }}</td>
                    <td class="text-center">{{m.nonquota_manage_total | number }}</td>
                    <td class="text-center">{{m.nonquota_manage_women | number }}</td>
                    <td class="text-center">{{m.nonquota_technic_total | number }}</td>
                    <td class="text-center">{{m.nonquota_technic_women | number }}</td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>
<script type="text/javascript" src="js/angular.js"></script>
<script type="text/javascript">
  var app = angular.module('mohaApp', []);
  app.controller('statContract', function($scope, $http, $sce, $timeout) {
    $scope.url = 'index.php?r=stat-contract/';
    $scope.mode = 'read';
    $scope.changemode = function() {
      $scope.mode = $scope.mode == 'read'?'input':'read';
    };
    $http.get($scope.url+ 'get')
      .then(function(r) {
        $scope.years = r.data.years;
        $scope.levels = r.data.levels;
      }, function(r) {
        $scope.response = r;
        $timeout(function () {
          $scope.response = null;
        }, 15000);
      });

    $scope.inquiry = function() {
      if($scope.year && $scope.model.level)
        $http.get($scope.url + 'inquiry&year='+$scope.year.id + '&level='+$scope.model.level.id)
          .then(function(r) {
            if(r.data.model) {
              $scope.model.quota_manage_total  = parseInt(r.data.model.quota_manage_total);
              $scope.model.quota_manage_women  = parseInt(r.data.model.quota_manage_women);
              $scope.model.quota_technic_total = parseInt(r.data.model.quota_technic_total);
              $scope.model.quota_technic_women = parseInt(r.data.model.quota_technic_women);
              $scope.model.nonquota_manage_total  = parseInt(r.data.model.nonquota_manage_total);
              $scope.model.nonquota_manage_women  = parseInt(r.data.model.nonquota_manage_women);
              $scope.model.nonquota_technic_total = parseInt(r.data.model.nonquota_technic_total);
              $scope.model.nonquota_technic_women = parseInt(r.data.model.nonquota_technic_women);
            } else {
              $scope.model.quota_manage_total  = null;
              $scope.model.quota_manage_women  = null;
              $scope.model.quota_technic_total = null;
              $scope.model.quota_technic_women = null;
              $scope.model.nonquota_manage_total  = null;
              $scope.model.nonquota_manage_women  = null;
              $scope.model.nonquota_technic_total = null;
              $scope.model.nonquota_technic_women = null;
            }
          }, function(r) {
            $scope.response = r;
            $timeout(function () {
              $scope.response = null;
            }, 15000);
          });
    };

    $scope.enquiry = function() {
      $scope.model = null;
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
      for(var i=0;i<$scope.models.length;i++)
        if($scope.models[i][key])
          s+= parseInt($scope.models[i][key]);
      return s;
    };

    $scope.sumrow = function(m, key) {
      var s = 0;
      if(key == "total") {
        if(m.quota_manage_total) s += parseInt(m.quota_manage_total);
        if(m.quota_technic_total) s += parseInt(m.quota_technic_total);
      } else if(key == "women") {
        if(m.quota_manage_women) s += parseInt(m.quota_manage_women);
        if(m.quota_technic_women) s += parseInt(m.quota_technic_women);
      }

      return s;
    };

    $scope.sumtotal = function(key) {
      var s = 0;
      if(key == 'total') {
        s = $scope.sumcolumn('quota_manage_total')
          + $scope.sumcolumn('quota_technic_total');
      } else if(key == 'women') {
        s = $scope.sumcolumn('quota_manage_women')
          + $scope.sumcolumn('quota_technic_women');
      }
      return s;
    };
  });
</script>
