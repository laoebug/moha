<?php $_GET['menu'] = 1; ?>
<?php

/* @var $this yii\web\View */
/* @var $searchModel app\models\StatPeopleProvinceSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = "ຈຳນວນພົນລະເມືອງທັງໝົດທົ່ວປະເທດ";
?>
<div class="row" ng-app="mohaApp" ng-controller="statPeopleProvince">
  <label class="col-sm-12"><?= Yii::t('app', 'Phiscal Year') ?></label>
  <div class="col-sm-4">
    <select class="form-control" ng-model="year" ng-change="enquiry()" ng-options="y.year for y in years"></select>
  </div>

  <div class="col-sm-12">
    <div class="panel panel-primary" style="margin-top: 2em" ng-show="year">
      <div class="panel-heading" ng-click="changemode()"><i class="fa fa-{{mode=='input'?'minus':'plus'}}"></i> ປ້ອນຂໍ້ມູນ
      </div>
      <div class="panel-body {{mode=='input'?'':'hidden'}}">
        <div class="col-sm-3">
          <label>ແຂວງ</label>
          <select class="form-control" ng-model="province" ng-change="inquiry()" ng-options="y.province_name for y in provinces"></select>
        </div>
        <div class="col-sm-3">
          <label>ຈຳນວນຄົນ</label>
          <input class="form-control" type="number" ng-model="model" />
        </div>

        <div class="col-sm-3" style="margin-top: 2em">
          <button type="button" class="btn btn-primary" ng-click="save()">
            <i class="fa fa-save"></i> <?= Yii::t('app', 'Save') ?>
          </button>
        </div>
      </div>
    </div>
  </div>

  <div class="col-sm-12" style="margin-top: 2em;overflow-x: scroll">
    <div class="bs-component card">
      <div class="card-title-w-btn " ng-if="year">
        <h3><?= $this->title ?> {{year.year}}</h3>
        <p class="hidden">
          <a class="btn btn-default" target="_blank" href="{{url}}print&year={{year.id}}"><i class="fa fa-print fa-2x"></i></a>
          <a class="btn btn-info" target="_blank" href="{{url}}download"><i class="fa fa-download fa-2x"></i></a>
        </p>
      </div>
      <table class="table table-bordered table-hover" ng-if="models">
        <thead>
          <tr>
            <th style="width: 5%" class="text-center" ng-repeat="p in models">
              {{p.name}}
            </th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td class="text-center" ng-repeat="m in models">
              {{m.people | number | dash}}
            </td>
          </tr>
        </tbody>
      </table>

      <canvas id="stat" chart-options="chartoption" class="chart chart-bar" chart-data="stat" chart-labels="labels" chart-series="series">
      </canvas>
    </div>
  </div>
</div>

<script type="text/javascript" src="js/sweetalert2.js"></script>
<script type="text/javascript" src="js/Chart.js"></script>
<script type="text/javascript" src="js/angular.js"></script>
<script type="text/javascript" src="js/angular-chart.js"></script>
<script type="text/javascript" src="js/moment.js"></script>
<script type="text/javascript">
  var app = angular.module('mohaApp', ['chart.js']);
  app.filter('dash', function() {
    return function(input) {
      return input ? input : '-';
    };
  });
  app.controller('statPeopleProvince', function($scope, $http, $sce, $timeout) {
    $scope.url = 'index.php?r=stat-people-province/';
    $scope.mode = 'read';
    $scope.chartoption = {
      scales: {
        yAxes: [{
          ticks: {
            beginAtZero: true
          }
        }]
      }
    };
    $scope.changemode = function() {
      $scope.mode = $scope.mode == 'read' ? 'input' : 'read';
    };

    $http.get($scope.url + 'get')
      .then(function(r) {
        $scope.years = r.data.years;
        $scope.provinces = r.data.provinces;
      }, function(r) {
        $scope.response = r;
        $timeout(function() {
          $scope.response = null;
        }, 15000);
      });

    $scope.save = function() {
      if ($scope.year && $scope.model && $scope.province) {
        $http.post($scope.url + 'save&year=' + $scope.year.id, {
          'Model': {
            'province': $scope.province.id,
            'people': $scope.model
          },
          '_csrf': $('meta[name="csrf-token"]').attr("content")
        }).then(function(r) {
          $scope.model = null;
          $scope.province = null;
          $scope.response = r;
          $scope.enquiry();
          $timeout(function() {
            $scope.response = null;
          }, 15000);

          if (r.status == 200) {
            Swal.fire({
              position: 'top-end',
              type: 'success',
              title: 'ການບັນທຶກສໍາເລັດ',
              text: r.status,
              showConfirmButton: false,
              timer: 3000
            });
          }

        }, function(r) {
          $scope.response = r;
          $timeout(function() {
            $scope.response = null;
          }, 15000);

          Swal.fire({
            position: 'top-end',
            type: 'error',
            title: 'ການບັນທຶກບໍ່ສໍາເລັດ',
            text: r.status,
            showConfirmButton: false,
            timer: 3000
          });
        });
      }
    };

    $scope.enquiry = function() {
      $scope.models = null;
      $scope.stat = null;
      if ($scope.year)
        $http.get($scope.url + 'enquiry&year=' + $scope.year.id)
        .then(function(r) {
          $scope.models = r.data.models;
          $scope.labels = r.data.labels;
          $scope.series = r.data.series;
          $scope.stat = r.data.stat;
          if ($scope.stat)
            $scope.stat.forEach(function(s, index) {
              $scope.stat[index] = parseInt(s);
            });
          console.log($scope.stat);
        }, function(r) {
          $scope.response = r;
          $timeout(function() {
            $scope.response = null;
          }, 15000);
        });
    };

    $scope.inquiry = function() {
      $scope.model = null;
      if ($scope.year)
        $http.get($scope.url + 'inquiry&year=' + $scope.year.id + '&province=' + $scope.province.id)
        .then(function(r) {
          $scope.model = parseInt(r.data.people);
        }, function(r) {
          $scope.response = r;
          $timeout(function() {
            $scope.response = null;
          }, 15000);
        });
    };

  });
</script>