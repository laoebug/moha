<?php $_GET['menu']=1;?>
<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\StatOfficerOrganisationSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */
// $this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'ກົມປະເມີນຜົນ ແລະ ພັດທະນາລັດຖະກອນ'), 'url' => ['index']];
// $this->title = "ສະຖິຕິສັງລວມພະນັກງານ ລັດຖະກອນຂັ້ນອົງການທຽບເທົ່າ ທີ່ໄປຍົກລະດັບຢູ່ພາຍໃນ ແລະ ຕ່າງປະເທດ";
// $this->params['breadcrumbs'][] = $this->title;
?>
<style rel="stylesheet" href="css/angular-datepicker.css"></style>
<div ng-app="mohaApp" ng-controller="officerOrganisationUpgradeController">
    <div class="col-sm-12">
        <label class="col-sm-12"><?= Yii::t('app', 'Phiscal Year') ?></label>
        <div class="col-sm-4">
            <select class="form-control" ng-model="year" ng-change="enquiry()"
                    ng-options="y.year for y in years"></select>
        </div>
        <div class="col-sm-8">
            <div ng-show="response" class="alert alert-{{response.status == 200? 'success':'danger'}}">
                {{response.statusText}}
            </div>
        </div>
    </div>
    <div class="col-sm-12">
        <div class="panel panel-primary" style="margin-top: 2em" ng-show="year">
            <div class="panel-heading" ng-click="changemode()"><i class="fa fa-{{mode=='input'?'minus':'plus'}}"></i> ປ້ອນຂໍ້ມູນ
            </div>
            <div class="panel-body {{mode=='input'?'':'hidden'}}">
                <div class="col-sm-3">
                    <label>ອົງການຈັດຕັ້ງ</label>
                    <select ng-options="m.name for m in organisations" ng-model="model.organisation"
                            ng-change="inquiry()" class="form-control"></select>
                </div>
                <br/>
                <div class="col-sm-9">
                    <table class="table table-bordered">
                        <thead>
                        <tr>
                            <th class="text-center" colspan="4">ປະລິນຍາເອກ</th>
                            <th class="text-center" colspan="4">ປະລິນຍາໂທ</th>
                        </tr>
                        <tr>
                            <?php for ($i = 0; $i < 4; $i++): ?>
                                <th class="text-center"
                                    colspan="2"><?= Yii::t('app', $i % 2 == 0 ? 'Local' : 'Oversea') ?></th>
                            <?php endfor; ?>
                        </tr>
                        <tr>
                            <?php for ($i = 0; $i < 8; $i++): ?>
                                <th class="text-center"><?= Yii::t('app', $i % 2 == 0 ? 'T' : 'W') ?></th>
                            <?php endfor; ?>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td style="width: 12.5%"><input class="form-control" ng-model="model.doctor_in_total"
                                                            min="0" type="number"></td>
                            <td style="width: 12.5%"><input class="form-control" ng-model="model.doctor_in_women"
                                                            min="0" max="{{model.doctor_in_total}}" type="number"></td>
                            <td style="width: 12.5%"><input class="form-control" ng-model="model.doctor_out_total"
                                                            min="0" type="number"></td>
                            <td style="width: 12.5%"><input class="form-control" ng-model="model.doctor_out_women"
                                                            min="0" max="{{model.doctor_out_total}}" type="number"></td>

                            <td style="width: 12.5%"><input class="form-control" ng-model="model.master_in_total"
                                                            min="0" type="number"></td>
                            <td style="width: 12.5%"><input class="form-control" ng-model="model.master_in_women"
                                                            min="0" max="{{model.master_in_total}}" type="number"></td>
                            <td style="width: 12.5%"><input class="form-control" ng-model="model.master_out_total"
                                                            min="0" type="number"></td>
                            <td style="width: 12.5%"><input class="form-control" ng-model="model.master_out_women"
                                                            min="0" max="{{model.master_out_total}}" type="number"></td>
                        </tr>
                        </tbody>
                    </table>
                </div>
                <div class="col-sm-12">
                    <table class="table table-bordered">
                        <thead>
                        <tr>
                            <th class="text-center" colspan="4">ປະລິນຍາຕີ</th>
                            <th class="text-center" colspan="4">ຊັ້ນສູງ</th>
                        </tr>
                        <tr>
                            <?php for ($i = 0; $i < 4; $i++): ?>
                                <th class="text-center"
                                    colspan="2"><?= Yii::t('app', $i % 2 == 0 ? 'Local' : 'Oversea') ?></th>
                            <?php endfor; ?>
                        </tr>
                        <tr>
                            <?php for ($i = 0; $i < 8; $i++): ?>
                                <th class="text-center"><?= Yii::t('app', $i % 2 == 0 ? 'T' : 'W') ?></th>
                            <?php endfor; ?>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td style="width: 12.5%"><input class="form-control" ng-model="model.bachelor_in_total"
                                                            min="0" type="number"></td>
                            <td style="width: 12.5%"><input class="form-control" ng-model="model.bachelor_in_women"
                                                            min="0" max="{{model.bachelor_in_total}}" type="number">
                            </td>
                            <td style="width: 12.5%"><input class="form-control" ng-model="model.bachelor_out_total"
                                                            min="0" type="number"></td>
                            <td style="width: 12.5%"><input class="form-control" ng-model="model.bachelor_out_women"
                                                            min="0" max="{{model.bachelor_out_total}}" type="number">
                            </td>

                            <td style="width: 12.5%"><input class="form-control" ng-model="model.high_in_total" min="0"
                                                            type="number"></td>
                            <td style="width: 12.5%"><input class="form-control" ng-model="model.high_in_women" min="0"
                                                            max="{{model.high_in_total}}" type="number"></td>
                            <td style="width: 12.5%"><input class="form-control" ng-model="model.high_out_total" min="0"
                                                            type="number"></td>
                            <td style="width: 12.5%"><input class="form-control" ng-model="model.high_out_women" min="0"
                                                            max="{{model.high_out_total}}" type="number"></td>
                        </tr>
                        </tbody>
                    </table>
                </div>
                <div class="col-sm-12">
                    <table class="table table-bordered">
                        <thead>
                        <tr>
                            <th class="text-center" colspan="4">ຊັ້ນກາງ</th>
                            <th class="text-center" colspan="4">ຊັ້ນຕົ້ນ</th>
                        </tr>
                        <tr>
                            <?php for ($i = 0; $i < 4; $i++): ?>
                                <th class="text-center"
                                    colspan="2"><?= Yii::t('app', $i % 2 == 0 ? 'Local' : 'Oversea') ?></th>
                            <?php endfor; ?>
                        </tr>
                        <tr>
                            <?php for ($i = 0; $i < 8; $i++): ?>
                                <th class="text-center"><?= Yii::t('app', $i % 2 == 0 ? 'T' : 'W') ?></th>
                            <?php endfor; ?>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td style="width: 12.5%"><input class="form-control" ng-model="model.middle_in_total"
                                                            min="0" type="number"></td>
                            <td style="width: 12.5%"><input class="form-control" ng-model="model.middle_in_women"
                                                            min="0" max="{{model.middle_in_total}}" type="number"></td>
                            <td style="width: 12.5%"><input class="form-control" ng-model="model.middle_out_total"
                                                            min="0" type="number"></td>
                            <td style="width: 12.5%"><input class="form-control" ng-model="model.middle_out_women"
                                                            min="0" max="{{model.middle_out_total}}" type="number"></td>

                            <td style="width: 12.5%"><input class="form-control" ng-model="model.begin_in_total" min="0"
                                                            type="number"></td>
                            <td style="width: 12.5%"><input class="form-control" ng-model="model.begin_in_women" min="0"
                                                            max="{{model.begin_in_total}}" type="number"></td>
                            <td style="width: 12.5%"><input class="form-control" ng-model="model.begin_out_total"
                                                            min="0" type="number"></td>
                            <td style="width: 12.5%"><input class="form-control" ng-model="model.begin_out_women"
                                                            min="0" max="{{model.begin_out_total}}" type="number"></td>
                        </tr>
                        </tbody>
                    </table>
                </div>
                <div class="col-sm-12">
                    <div class="col-sm-3">
                        <label>&nbsp;</label>
                        <button type="button" class="btn btn-primary col-sm-12" ng-click="save()">
                            <i class="fa fa-save"></i> <?= Yii::t('app', 'Save') ?>
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="col-sm-12" ng-show="models">
        <div class="bs-component card">
            <ul class="nav nav-tabs">
                <li class="active"><a href="#table" data-toggle="tab">ຕາຕະລາງ</a></li>
                <li><a href="#chart" data-toggle="tab">ເສັ້ນສະແດງ</a></li>
                <li><a href="#reference" data-toggle="tab">ເອກະສານອ້າງອີງ</a></li>
            </ul>
            <div class="tab-content" id="myTabContent">
                <div class="tab-pane fade active in" id="table">
                    <div class="card" style="overflow-x: scroll">
                        <div class="card-title-w-btn ">
                            <h3><?= $this->title ?> {{year.year}}</h3>
                            <p>
                                <a class="btn btn-default" target="_blank" href="{{url}}print&year={{year.id}}"><i
                                            class="fa fa-print fa-2x"></i></a>
                                <a class="btn btn-info" target="_blank" href="{{url}}download&year={{year.id}}"><i
                                            class="fa fa-download fa-2x"></i></a>
                            </p>
                        </div>
                        <table class="table table-bordered">
                            <thead>
                            <tr>
                                <th class="text-center" rowspan="5"><?= Yii::t('app', 'No.') ?></th>
                                <th class="text-center" rowspan="3">ຊື່ພາກສ່ວນຕ່າງໆ</th>
                                <th class="text-center" rowspan="2" colspan="2"><?= Yii::t('app', 'Total') ?></th>

                                <th class="text-center" colspan="4">ປະລິນຍາເອກ</th>
                                <th class="text-center" colspan="4">ປະລິນຍາໂທ</th>
                                <th class="text-center" colspan="4">ປະລິນຍາຕີ</th>
                                <th class="text-center" colspan="4">ຊັ້ນສູງ</th>
                                <th class="text-center" colspan="4">ຊັ້ນກາງ</th>
                                <th class="text-center" colspan="4">ຊັ້ນຕົ້ນ</th>
                            </tr>
                            <tr>
                                <?php for ($i = 0; $i < 12; $i++): ?>
                                    <th class="text-center"
                                        colspan="2"><?= Yii::t('app', $i % 2 == 0 ? 'Local' : 'Oversea') ?></th>
                                <?php endfor; ?>
                            </tr>
                            <tr>
                                <?php for ($i = 0; $i < 26; $i++): ?>
                                    <th class="text-center"><?= Yii::t('app', $i % 2 == 0 ? 'T' : 'W') ?></th>
                                <?php endfor; ?>
                            </tr>
                            <tr>
                                <th class="text-center"><?= Yii::t('app', 'Total') ?></th>
                                <th class="text-center">
                                    {{formatNumber(sum('doctor_in_total') + sum('doctor_out_total')+
                                    sum('master_in_total') + sum('master_out_total')+ sum('bachelor_in_total') +
                                    sum('bachelor_out_total') + sum('high_in_total') + sum('high_out_total') +
                                    sum('middle_in_total') + sum('middle_out_total') + sum('begin_in_total') +
                                    sum('begin_out_total'))}}
                                </th>
                                <th class="text-center">
                                    {{formatNumber(sum('doctor_in_women') + sum('doctor_out_women')+
                                    sum('master_in_women') + sum('master_out_women')+ sum('bachelor_in_women') +
                                    sum('bachelor_out_women') + sum('high_in_women') + sum('high_out_women') +
                                    sum('middle_in_women') + sum('middle_out_women') + sum('begin_in_women') +
                                    sum('begin_out_women'))}}
                                </th>
                                </th>
                                <?php foreach ($cols as $col): ?>
                                    <th class="text-center">{{formatNumber(sum('<?= $col ?>'))}}</th>
                                <?php endforeach; ?>
                            </tr>
                            </thead>
                            <tbody>
                            <tr ng-repeat="m in models">
                                <td class="text-center">{{$index + 1}}</td>
                                <td class="text-center">{{m.name}}</td>
                                <td class="text-center">{{formatNumber(sumtotal(m)) | number | dash}}</td>
                                <td class="text-center">{{formatNumber(sumwomen(m)) | number | dash}}</td>
                                <?php foreach ($cols as $col): ?>
                                    <td class="text-center">{{formatNumber(m.<?= $col ?> )| number | dash}}</td>
                                <?php endforeach; ?>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="tab-pane fade" id="chart">
                    <div class="card" ng-show="stat">
                        <h3><?= $this->title ?> {{year.year}}</h3>
                        <div class="row">
                            <div class="col-sm-8">
                                <canvas id="statbar" class="chart chart-bar"
                                        chart-data="stat.data"
                                        chart-labels="stat.labels"
                                        chart-series="stat.series"
                                        chart-colors="stat.colors"
                                        chart-options="options"
                                </canvas>
                            </div>
                            <div class="col-sm-4">
                                <canvas id="statpie" class="chart chart-pie"
                                        chart-data="stat.data"
                                        chart-labels="stat.labels"
                                        chart-series="stat.series"
                                        chart-colors="stat.colors"
                                </canvas>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="tab-pane fade" id="reference">
                    <div class="row">
                        <div class="col-sm-3">
                            <label>ເລກທີ</label>
                            <input type="text" ng-model="issued_no" class="form-control">
                        </div>
                        <div class="col-sm-3">
                            <label>ລົງວັນທີ</label>
                            <input id="issued_date" class="form-control datepicker" data-ng-model="$parent.issued_date" type="text">
                        </div>
                        <div class="col-sm-3">
                            <label>ອອກໂດຍ</label>
                            <input type="text" ng-model="issued_by" class="form-control">
                        </div>

                        <div class="col-sm-3">
                            <label>ເລືອກໄຟລ໌</label>
                            <input type="file" name="image" onchange="angular.element(this).scope().uploadedFile(this);"
                                   class="form-control" required>
                        </div>

                        <div class="col-sm-12" ng-if="references">
                            <div class="card">
                                <table class="table table-bordered">
                                    <thead>
                                    <tr>
                                        <th class="text-center">ວັນທີອັບໂຫຼດ</th>
                                        <th class="text-center">ຊື່</th>
                                        <th class="text-center">ເລກທີ</th>
                                        <th class="text-center">ລົງວັນທີ</th>
                                        <th class="text-center">ອອກໂດຍ</th>
                                        <th class="text-center">ລຶບ</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr ng-repeat="f in references">
                                        <td class="text-center">{{f.upload_date}}</td>
                                        <td class="text-center"><a href="upload/{{f.dir}}/{{f.name}}" target="_blank">{{f.original_name}}</a></td>
                                        <td class="text-center">{{f.issued_no}}</td>
                                        <td class="text-center">{{f.issued_date | date}}</td>
                                        <td class="text-center">{{f.issued_by}}</td>
                                        <td class="text-center">
                                            <button class="btn btn-danger" type="button" ng-click="deletefile(f)">
                                                <i class="fa fa-trash"></i>
                                            </button>
                                        </td>
                                    </tr>

                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript" src="js/Chart.js"></script>
<script type="text/javascript" src="js/angular.js"></script>
<script type="text/javascript" src="js/angular-chart.js"></script>
<script type="text/javascript" src="js/moment.js"></script>
<script type="text/javascript" src="js/datetimepicker.js"></script>
<script type="text/javascript" src="js/datetimepicker.templates.js"></script>
<script type="text/javascript">
  Chart.defaults.global.defaultFontFamily = 'Saysettha OT';
  var app = angular.module('mohaApp', ['chart.js']);
  app.filter('dash', function() {
    return function(input) {
      return input ? input : '-';
    };
  });
  app.controller('officerOrganisationUpgradeController', function ($scope, $http, $sce, $timeout) {
    $scope.url = 'index.php?r=stat-officer-organisation-upgrade/';
    $scope.mode = 'read';
    $scope.changemode = function () {
      $scope.mode = $scope.mode == 'read' ? 'input' : 'read';
    };
    $scope.options = {
      legend: {
        display: false,
        labels: {
          fontColor: '',
        }
      },
      scales: {
        xAxes: [{
          stacked: false,
          beginAtZero: true,
          scaleLabel: {
//            labelString: ''
          },
          ticks: {
//                        stepSize: 1,
            min: 0,
            autoSkip: false
          }
        }]
      },
    };

    $http.get($scope.url + 'get')
      .then(function (r) {
        $scope.years = r.data.years;
        $scope.organisations = r.data.organisations;
      }, function (r) {
        $scope.response = r;
        $timeout(function () {
          $scope.response = null;
        }, 15000);
      });

    $scope.enquiry = function () {
      $scope.models = null;
      if ($scope.year)
        $http.get($scope.url + 'enquiry&year=' + $scope.year.id)
          .then(function (r) {
            $scope.models = r.data.models;
            $scope.stat = r.data.stat;
            $scope.getreferences();
          }, function (r) {
            $scope.response = r;
            $timeout(function () {
              $scope.response = null;
            }, 15000);
          });
    };

    $scope.inquiry = function () {
      if ($scope.year && $scope.model.organisation)
        $http.get($scope.url + 'inquiry&year=' + $scope.year.id + '&organisation=' + $scope.model.organisation.id)
          .then(function (r) {
            if (r.data.model) {
                <?php foreach ($cols as $col): ?>
              $scope.model.<?= $col ?> = parseInt(r.data.model.<?= $col ?>);
                <?php endforeach; ?>
            } else {
                <?php foreach ($cols as $col): ?>
              $scope.model.<?= $col ?> = null;
                <?php endforeach; ?>
            }
          }, function (r) {
            $scope.response = r;
            $timeout(function () {
              $scope.response = null;
            }, 15000);
          });
    };

    $scope.save = function () {
      if ($scope.model)
        $http.post($scope.url + 'save&year=' + $scope.year.id, {
          'Model': $scope.model,
          '_csrf': $('meta[name="csrf-token"]').attr("content")
        }).then(function (r) {
          $scope.enquiry();
          $scope.model = null;
          $scope.response = r;
          $timeout(function () {
            $scope.response = null;
          }, 15000);
        }, function (r) {
          $scope.response = r;
          $timeout(function () {
            $scope.response = null;
          }, 15000);
        })
    };

    $scope.sum = function (key) {
      var total = 0;
      if ($scope.models)
        for (var n = 0; n < $scope.models.length; n++)
          if ($scope.models[n][key])
            total += parseInt($scope.models[n][key]);
      return total;
    };

    $scope.sumtotal = function (m) {
      var s = 0;
      if (m.doctor_in_total) s += parseInt(m.doctor_in_total);
      if (m.doctor_out_total) s += parseInt(m.doctor_out_total);
      if (m.master_in_total) s += parseInt(m.master_in_total);
      if (m.master_out_total) s += parseInt(m.master_out_total);
      if (m.bachelor_in_total) s += parseInt(m.bachelor_in_total);
      if (m.bachelor_out_total) s += parseInt(m.bachelor_out_total);

      if (m.high_in_total) s += parseInt(m.high_in_total);
      if (m.high_out_total) s += parseInt(m.high_out_total);
      if (m.middle_in_total) s += parseInt(m.middle_in_total);
      if (m.middle_out_total) s += parseInt(m.middle_out_total);
      if (m.begin_in_total) s += parseInt(m.begin_in_total);
      if (m.begin_out_total) s += parseInt(m.begin_out_total);
      return $scope.formatNumber(s);
    };

    $scope.sumwomen = function (m) {
      var s = 0;
      if (m.doctor_in_women) s += parseInt(m.doctor_in_women);
      if (m.doctor_out_women) s += parseInt(m.doctor_out_women);
      if (m.master_in_women) s += parseInt(m.master_in_women);
      if (m.master_out_women) s += parseInt(m.master_out_women);
      if (m.bachelor_in_women) s += parseInt(m.bachelor_in_women);
      if (m.bachelor_out_women) s += parseInt(m.bachelor_out_women);

      if (m.high_in_women) s += parseInt(m.high_in_women);
      if (m.high_out_women) s += parseInt(m.high_out_women);
      if (m.middle_in_women) s += parseInt(m.middle_in_women);
      if (m.middle_out_women) s += parseInt(m.middle_out_women);
      if (m.begin_in_women) s += parseInt(m.begin_in_women);
      if (m.begin_out_women) s += parseInt(m.begin_out_women);
      return $scope.formatNumber(s);
    };

    $scope.formatNumber = function (num, dec) {
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
    };


    $scope.uploadedFile = function (element) {
      if(!$scope.issued_no) {
        $scope.files = null;
        alert('ກະລຸນາປ້ອນເລກທີ');
        return;
      }
      $scope.issued_date = $('#issued_date').val();
      if(!$scope.issued_date) {
        $scope.files = null;
        alert('ກະລຸນາປ້ອນວັນທີ');
        return;
      }

      $scope.$apply(function ($scope) {
        $scope.files = element.files;
        $http({
          url: $scope.url + "upload&year=" + $scope.year.id,
          method: "POST",
          processData: false,
          headers: {'Content-Type': undefined},
          data: {
            '_csrf': $('meta[name="csrf-token"]').attr("content"),
            'issued_no': $scope.issued_no,
            'issued_date': $scope.issued_date,
            'issued_by': $scope.issued_by
          },
          transformRequest: function (data) {
            var formData = new FormData();
            var file = $scope.files[0];
            formData.append("file_upload", file);
            angular.forEach(data, function (value, key) {
              formData.append(key, value);
            });
            return formData;
          }
        }).success(function (data, status, headers, config) {
          $scope.getreferences();
          $scope.issued_date = null;
          $scope.issued_no = null;
          $scope.issued_by = null;
          $("input[name='image'], #issued_date").val("");
          $scope.status = data.status;
          $scope.formdata = "";
        }).error(function (data, status, headers, config) {
          $scope.response = data;
          $timeout(function () {
            $scope.response = null;
          }, 15000);
        });
      });
    };

    $scope.getreferences = function() {
      if($scope.year) {
        $http.get($scope.url + 'getreferences&year=' + $scope.year.id)
          .then(function (r) {
            if (r.data)
              $scope.references = r.data.files;
          }, function (r) {
            $scope.response = r;
            $timeout(function () {
              $scope.response = null;
            }, 15000);
          });
      }
    };

    $scope.deletefile = function(f) {
      if($scope.year && f) {
        if(confirm('ທ່ານຕ້ອງການລຶບແທ້ບໍ?'))
          $http.post($scope.url + 'deletefile&year='+$scope.year.id, {
            'id': f.id,
            '_csrf': $('meta[name="csrf-token"]').attr("content")
          }).then(function (r) {
            $scope.response = r;
            $scope.getreferences();
            $timeout(function () {
              $scope.response = null;
            }, 15000);
          }, function (r) {
            $scope.response = r;
            $timeout(function () {
              $scope.response = null;
            }, 15000);
          });
      }
    };
  });
</script>