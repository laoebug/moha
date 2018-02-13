<?php $_GET['menu']=1;?>
<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\StatReligionTeacherSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */
// $this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'ກົມວຽກງານຊົນເຜົ່າ ແລະ ສາສະໜາ'), 'url' => ['index']];
// $this->title = "ສະຖິຕິພະສົງ ແລະ ຄູສອນສາສະໜາ ໃນທົ່ວປະເທດ";
// $this->params['breadcrumbs'][] = $this->title;
?>
<style rel="stylesheet" href="css/angular-datepicker.css"></style>
<div class="row" ng-app="mohaApp" ng-controller="rerigionTeacherController">
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
        <div class="panel panel-primary" style="margin-top: 2em" ng-show="year != null">
            <div class="panel-heading" ng-click="changemode()"><i class="fa fa-{{mode=='input'?'minus':'plus'}}"></i> ປ້ອນຂໍ້ມູນ
            </div>
            <div class="panel-body {{mode=='input'?'':'hidden'}}">
                <div class="col-sm-3">
                    <label for=""><?= Yii::t('app', 'Province') ?></label>
                    <select class="form-control" ng-model="model.province"
                            ng-options="b.province_name for b in provinces"
                            ng-change="inquiry()">
                    </select>
                </div>
                <div class="col-sm-9">
                    <table class="table table-bordered">
                        <tr>
                            <td class="text-center" colspan="5">ສາສະໜາພຸດ</td>
                        </tr>
                        <tr>
                            <td class="text-center" style="width: 12.5%"><?= Yii::t('app', 'ພະ') ?></td>
                            <td class="text-center" style="width: 12.5%"><?= Yii::t('app', 'ຈົວ') ?></td>
                            <td class="text-center" style="width: 12.5%"><?= Yii::t('app', 'ພໍ່ຂາວ') ?></td>
                            <td class="text-center" style="width: 12.5%"><?= Yii::t('app', 'ແມ່ຂາວ') ?></td>
                            <td class="text-center" style="width: 12.5%"><?= Yii::t('app', 'ສັງກະລີ') ?></td>
                        </tr>
                        <tr>
                            <td class="text-center"><input min="0" type="number" class="form-control"
                                                           ng-model="model.buddhis_monk"></td>
                            <td class="text-center"><input min="0" type="number" class="form-control"
                                                           ng-model="model.buddhis_novice"></td>
                            <td class="text-center"><input min="0" type="number" class="form-control"
                                                           ng-model="model.buddhis_dad"></td>
                            <td class="text-center"><input min="0" type="number" class="form-control"
                                                           ng-model="model.buddhis_mom"></td>
                            <td class="text-center"><input min="0" type="number" class="form-control"
                                                           ng-model="model.buddhis_boy"></td>
                        </tr>
                    </table>
                </div>
                <div class="col-sm-12">
                    <table class="table table-bordered">
                        <tr>
                            <td class="text-center" colspan="6">ສາສະໜາເຍຊູຄຣິດ</td>
                            <td class="text-center" colspan="2" rowspan="2">ສາສະໜາບາຮາຍ</td>
                            <td class="text-center" colspan="2" rowspan="2">ສາສະໜາອິດສະລາມ</td>
                            <td class="text-center" rowspan="3"><?= Yii::t('app', 'Remark') ?></td>
                        </tr>
                        <tr>
                            <td class="text-center" colspan="2">ຂ່າວປະເສີດ</td>
                            <td class="text-center" colspan="2">ວັນເສົາ</td>
                            <td class="text-center" colspan="2">ກາໂຕລິກ</td>
                        </tr>
                        <tr>
                            <td style="width: 10%" class="text-center"><?= Yii::t('app', 'Total') ?></td>
                            <td style="width: 10%" class="text-center"><?= Yii::t('app', 'Women') ?></td>
                            <td style="width: 10%" class="text-center"><?= Yii::t('app', 'Total') ?></td>
                            <td style="width: 10%" class="text-center"><?= Yii::t('app', 'Women') ?></td>
                            <td style="width: 10%" class="text-center"><?= Yii::t('app', 'Total') ?></td>
                            <td style="width: 10%" class="text-center"><?= Yii::t('app', 'Women') ?></td>
                            <td style="width: 10%" class="text-center"><?= Yii::t('app', 'Total') ?></td>
                            <td style="width: 10%" class="text-center"><?= Yii::t('app', 'Women') ?></td>
                            <td style="width: 10%" class="text-center"><?= Yii::t('app', 'Total') ?></td>
                            <td style="width: 10%" class="text-center"><?= Yii::t('app', 'Women') ?></td>
                        </tr>
                        <tr>
                            <td class="text-center">
                                <input ng-model="model.christ_news_total" class="form-control" min="0" type="number">
                            </td>
                            <td class="text-center">
                                <input ng-model="model.christ_news_women" class="form-control" min="0"
                                       max="{{model.christ_news_total}}" type="number"
                                       ng-blur="model.christ_news_women = model.christ_news_total < model.christ_news_women ? null : model.christ_news_women">
                            </td>
                            <td class="text-center">
                                <input ng-model="model.christ_sat_total" class="form-control" min="0" type="number">
                            </td>
                            <td class="text-center">
                                <input ng-model="model.christ_sat_women" class="form-control" min="0"
                                       max="{{model.christ_sat_total}}" type="number"
                                       ng-blur="model.christ_sat_women = model.christ_sat_total < model.christ_sat_women ? null : model.christ_sat_women">
                            </td>
                            <td class="text-center">
                                <input ng-model="model.christ_cato_total" class="form-control" min="0" type="number">
                            </td>
                            <td class="text-center">
                                <input ng-model="model.christ_cato_women" class="form-control" min="0"
                                       max="{{model.christ_cato_total}}" type="number"
                                       ng-blur="model.christ_cato_women = model.christ_cato_total < model.christ_cato_women ? null : model.christ_cato_women">
                            </td>
                            <td class="text-center">
                                <input ng-model="model.bahai_total" class="form-control" min="0" type="number">
                            </td>
                            <td class="text-center">
                                <input ng-model="model.bahai_women" class="form-control" min="0"
                                       max="{{model.bahai_total}}" type="number"
                                       ng-blur="model.bahai_women = model.bahai_total < model.bahai_women ? null : model.bahai_women">
                            </td>
                            <td class="text-center">
                                <input ng-model="model.idslam_total" class="form-control" min="0" type="number">
                            </td>
                            <td class="text-center">
                                <input ng-model="model.idslam_women" class="form-control" min="0"
                                       max="{{model.idslam_total}}" type="number"
                                       ng-blur="model.idslam_women = model.idslam_total < model.idslam_women ? null : model.idslam_women">
                            </td>
                            <td class="text-center">
                                <input ng-model="model.remark" class="form-control" type="text">
                            </td>
                        </tr>
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
    <div ng-show="models" class="col-sm-12" style="margin-top: 2em;overflow-x: scroll">
        <div class="bs-component card">
            <ul class="nav nav-tabs">
                <li class="active"><a href="#table" data-toggle="tab">ຕາຕະລາງ</a></li>
                <li><a href="#chart" data-toggle="tab">ເສັ້ນສະແດງ</a></li>
                <li><a href="#reference" data-toggle="tab">ເອກະສານອ້າງອີງ</a></li>
            </ul>
            <div class="tab-content" id="myTabContent">
                <div class="tab-pane fade active in" id="table">
                    <div class="card">
                        <div class="card-title-w-btn ">
                            <h3><?= $this->title ?> {{year.year}}</h3>
                            <p>
                                <a class="btn btn-default" target="_blank" href="{{url}}print&year={{year.id}}"><i
                                            class="fa fa-print fa-2x"></i></a>
                                <a class="btn btn-info" target="_blank" href="{{url}}download&year={{year.id}}"><i
                                            class="fa fa-download fa-2x"></i></a>
                            </p>
                        </div>
                        <table class="table table-bordered table-hover" ng-show="models">
                            <thead>
                            <tr>
                                <th class="text-center" rowspan="3"><?= Yii::t('app', 'No.') ?></th>
                                <th class="text-center" rowspan="3"><?= Yii::t('app', 'Province') ?></th>
                                <th class="text-center" colspan="5">ສາສະໜາພຸດ</th>
                                <th class="text-center" colspan="6">ສາສະໜາເຍຊູຄຣິດ</th>
                                <th class="text-center" colspan="2" rowspan="2">ສາສະໜາບາຮາຍ</th>
                                <th class="text-center" colspan="2" rowspan="2">ສາສະໜາອິດສະລາມ</th>
                                <th class="text-center" rowspan="3"><?= Yii::t('app', 'Remark') ?></th>
                            </tr>
                            <tr>
                                <th class="text-center" rowspan="2">ພະ</th>
                                <th class="text-center" rowspan="2">ຈົວ</th>
                                <th class="text-center" rowspan="2">ພໍ່ຂາວ</th>
                                <th class="text-center" rowspan="2">ແມ່ຂາວ</th>
                                <th class="text-center" rowspan="2">ສັງກະລີ</th>
                                <th class="text-center" colspan="2">ຂ່າວປະເສີດ</th>
                                <th class="text-center" colspan="2">ວັນເສົາ</th>
                                <th class="text-center" colspan="2">ກາໂຕລິກ</th>
                            </tr>
                            <tr>
                                <th class="text-center"><?= Yii::t('app', 'Total') ?></th>
                                <th class="text-center"><?= Yii::t('app', 'Women') ?></th>
                                <th class="text-center"><?= Yii::t('app', 'Total') ?></th>
                                <th class="text-center"><?= Yii::t('app', 'Women') ?></th>
                                <th class="text-center"><?= Yii::t('app', 'Total') ?></th>
                                <th class="text-center"><?= Yii::t('app', 'Women') ?></th>
                                <th class="text-center"><?= Yii::t('app', 'Total') ?></th>
                                <th class="text-center"><?= Yii::t('app', 'Women') ?></th>
                                <th class="text-center"><?= Yii::t('app', 'Total') ?></th>
                                <th class="text-center"><?= Yii::t('app', 'Women') ?></th>
                            </tr>
                            <tr>
                                <th style="width: 10%" class="text-center"
                                    colspan="2"><?= Yii::t('app', 'Total') ?></th>
                                <th style="width: 10%" class="text-center">{{sum('buddhis_monk') | number | dash}}</th>
                                <th style="width: 10%" class="text-center">{{sum('buddhis_novice') | number | dash}}</th>
                                <th style="width: 10%" class="text-center">{{sum('buddhis_dad') | number | dash}}</th>
                                <th style="width: 10%" class="text-center">{{sum('buddhis_mom') | number | dash}}</th>
                                <th style="width: 10%" class="text-center">{{sum('buddhis_boy') | number | dash}}</th>
                                <th style="width: 10%" class="text-center">{{sum('christ_news_total') | number | dash}}</th>
                                <th style="width: 10%" class="text-center">{{sum('christ_news_women') | number | dash}}</th>
                                <th style="width: 10%" class="text-center">{{sum('christ_sat_total') | number | dash}}</th>
                                <th style="width: 10%" class="text-center">{{sum('christ_sat_women') | number | dash}}</th>
                                <th style="width: 10%" class="text-center">{{sum('christ_cato_total') | number | dash}}</th>
                                <th style="width: 10%" class="text-center">{{sum('christ_cato_women') | number | dash}}</th>
                                <th style="width: 10%" class="text-center">{{sum('bahai_total') | number | dash}}</th>
                                <th style="width: 10%" class="text-center">{{sum('bahai_women') | number | dash}}</th>
                                <th style="width: 10%" class="text-center">{{sum('idslam_total') | number | dash}}</th>
                                <th style="width: 10%" class="text-center">{{sum('idslam_women') | number | dash}}</th>
                                <th style="width: 10%"></th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr ng-repeat="m in models">
                                <td class="text-center">{{$index + 1}}</td>
                                <td>{{m.province_name}}</td>
                                <td class="text-center">{{m.buddhis_monk | number | dash}}</td>
                                <td class="text-center">{{m.buddhis_novice | number | dash}}</td>
                                <td class="text-center">{{m.buddhis_dad | number | dash}}</td>
                                <td class="text-center">{{m.buddhis_mom | number | dash}}</td>
                                <td class="text-center">{{m.buddhis_boy | number | dash}}</td>
                                <td class="text-center">{{m.christ_news_total | number | dash}}</td>
                                <td class="text-center">{{m.christ_news_women | number | dash}}</td>
                                <td class="text-center">{{m.christ_sat_total | number | dash}}</td>
                                <td class="text-center">{{m.christ_sat_women | number | dash}}</td>
                                <td class="text-center">{{m.christ_cato_total | number | dash}}</td>
                                <td class="text-center">{{m.christ_cato_women | number | dash}}</td>
                                <td class="text-center">{{m.bahai_total | number | dash}}</td>
                                <td class="text-center">{{m.bahai_women | number | dash}}</td>
                                <td class="text-center">{{m.idslam_total | number | dash}}</td>
                                <td class="text-center">{{m.idslam_women | number | dash}}</td>
                                <td class="text-center">{{m.remark}}</td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="tab-pane fade" id="chart">
                    <div ng-show="stat" class="card">
                        <div class="row">
                            <h3><?= $this->title ?> {{year.year}}</h3>
                            <div class="col-sm-12">
                                <canvas id="stat" class="chart chart-bar"
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
  var app = angular.module('mohaApp', ['chart.js', 'ui.bootstrap.datetimepicker']);
  app.filter('dash', function() {
    return function(input) {
      return input ? input : '-';
    };
  });
  app.controller('rerigionTeacherController', function ($scope, $http, $sce, $timeout) {
    $scope.url = 'index.php?r=stat-religion-teacher/';
    $scope.mode = 'read';
    $scope.changemode = function () {
      $scope.mode = $scope.mode == 'read' ? 'input' : 'read';
    };
    $scope.sum = [];
    $http.get($scope.url + 'get')
      .then(function (r) {
        $scope.years = r.data.years;
        $scope.provinces = r.data.provinces;
      }, function (r) {
        $scope.response = r;
        $timeout(function () {
          $scope.response = null;
        }, 15000);
      });

    $scope.enquiry = function () {
      $scope.model = null;
      if ($scope.year)
        $http.get($scope.url + 'enquiry&year=' + $scope.year.id)
          .then(function (r) {
            $scope.models = r.data.models;
            $scope.stat = r.data.stat;
            $scope.stat.colors = ['#FF0000', '#0000FF', '#00FF00', '#FFFF00'];
            $scope.getreferences();
          }, function (r) {
            $scope.response = r;
            $timeout(function () {
              $scope.response = null;
            }, 15000);
          });
    };

    $scope.inquiry = function () {
      if ($scope.year && $scope.model.province)
        $http.get($scope.url + 'inquiry&province=' + $scope.model.province.id + '&year=' + $scope.year.id)
          .then(function (r) {
            var p = $scope.model.province;
            if (r.data.model) {
              $scope.model.buddhis_monk = parseInt(r.data.model.buddhis_monk);
              $scope.model.buddhis_novice = parseInt(r.data.model.buddhis_novice);
              $scope.model.buddhis_dad = parseInt(r.data.model.buddhis_dad);
              $scope.model.buddhis_mom = parseInt(r.data.model.buddhis_mom);
              $scope.model.buddhis_boy = parseInt(r.data.model.buddhis_boy);
              $scope.model.christ_news_total = parseInt(r.data.model.christ_news_total);
              $scope.model.christ_news_women = parseInt(r.data.model.christ_news_women);
              $scope.model.christ_sat_total = parseInt(r.data.model.christ_sat_total);
              $scope.model.christ_sat_women = parseInt(r.data.model.christ_sat_women);
              $scope.model.christ_cato_total = parseInt(r.data.model.christ_cato_total);
              $scope.model.christ_cato_women = parseInt(r.data.model.christ_cato_women);
              $scope.model.bahai_total = parseInt(r.data.model.bahai_total);
              $scope.model.bahai_women = parseInt(r.data.model.bahai_women);
              $scope.model.idslam_total = parseInt(r.data.model.idslam_total);
              $scope.model.idslam_women = parseInt(r.data.model.idslam_women);
              $scope.model.remark = r.data.model.remark;
            } else {
              $scope.model.buddhis_monk = null;
              $scope.model.buddhis_novice = null;
              $scope.model.buddhis_dad = null;
              $scope.model.buddhis_mom = null;
              $scope.model.buddhis_boy = null;
              $scope.model.christ_news_total = null;
              $scope.model.christ_news_women = null;
              $scope.model.christ_sat_total = null;
              $scope.model.christ_sat_women = null;
              $scope.model.christ_cato_total = null;
              $scope.model.christ_cato_women = null;
              $scope.model.bahai_total = null;
              $scope.model.bahai_women = null;
              $scope.model.idslam_total = null;
              $scope.model.idslam_women = null;
              $scope.model.remark = null;
            }
          }, function (r) {
            $scope.response = r;
            $timeout(function () {
              $scope.response = null;
            }, 15000);
          });
    };

    $scope.save = function () {
      if ($scope.year && $scope.model) {
        console.log($scope.model);
        $http.post($scope.url + 'save&year=' + $scope.year.id, {
          'StatReligionTeacherDetail': $scope.model,
          '_csrf': $('meta[name="csrf-token"]').attr("content")
        }).then(function (r) {
          $scope.model = null;
          $scope.response = r;
          $scope.enquiry();
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

    $scope.sum = function (key) {
      var total = 0;
      if ($scope.models)
        for (var n = 0; n < $scope.models.length; n++)
          if ($scope.models[n][key])
            total += parseInt($scope.models[n][key]);
      return total == 0 ? null : total;
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
