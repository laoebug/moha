<?php $_GET['menu']=1;?>
<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel app\models\StatPopulationMovementSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */
// $this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'ກົມຄຸ້ມຄອງພົນລະເມືອງ'), 'url' => ['index']];
// $this->title = "ການເກັບກຳສະຖິຕິເໜັງຕີງຂອງພົນລະເມືອງຂອງກະຊວງພາຍໃນ";
// $this->params['breadcrumbs'][] = $this->title;
?>
<style rel="stylesheet" href="css/angular-datepicker.css"></style>
<div class="row" ng-app="mohaApp" ng-controller="statPopulationMovementController">
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
                            <td class="text-center" rowspan="2">ຈຳນວນເມືອງ</td>
                            <td class="text-center" rowspan="2">ຈຳນວນບ້ານ</td>
                            <td class="text-center" colspan="2">ຂຳນວນ ພົນລະເມືອງ</td>
                        </tr>
                        <tr>
                            <td class="text-center" style="width: 12.5%"><?= Yii::t('app', 'Total') ?></td>
                            <td class="text-center" style="width: 12.5%"><?= Yii::t('app', 'Women') ?></td>
                        </tr>
                        <tr>
                            <td class="text-center" style="width: 12%"><input ng-model="model.district" min="0"
                                                                              type="number" class="form-control"></td>
                            <td class="text-center" style="width: 12%"><input ng-model="model.village"
                                                                              min="{{model.village}}" type="number"
                                                                              class="form-control"></td>
                            <td class="text-center" style="width: 18%"><input ng-model="model.population_total" min="0"
                                                                              type="number" class="form-control"></td>
                            <td class="text-center" style="width: 18%"><input ng-model="model.population_women"
                                                                              max="{{model.population_total}}"
                                                                              type="number" class="form-control"></td>
                        </tr>
                    </table>
                </div>
                <div class="col-sm-12">
                    <table class="table table-bordered">
                        <tr>
                            <td class="text-center" colspan="2">ຈຳນວນເກີດ</td>
                            <td class="text-center" colspan="2">ຈຳນວນເສຍຊີວິດ</td>
                            <td class="text-center" rowspan="2">ແຕ່ງດອງ</td>
                            <td class="text-center" rowspan="2">ຢ່າຮ້າງ</td>
                        </tr>
                        <tr>
                            <?php for ($i = 0; $i < 2; $i++): ?>
                                <td class="text-center" style="width: 12.5%"><?= Yii::t('app', 'Total') ?></td>
                                <td class="text-center" style="width: 12.5%"><?= Yii::t('app', 'Women') ?></td>
                            <?php endfor; ?>
                        </tr>
                        <tr>
                            <td class="text-center" style="width: 15%"><input ng-model="model.born_total" min="0"
                                                                              type="number" class="form-control"></td>
                            <td class="text-center" style="width: 15%"><input ng-model="model.born_women"
                                                                              max="{{model.born_total}}" type="number"
                                                                              class="form-control"></td>
                            <td class="text-center" style="width: 10%"><input ng-model="model.die_total" min="0"
                                                                              type="number" class="form-control"></td>
                            <td class="text-center" style="width: 10%"><input ng-model="model.die_women"
                                                                              max="{{model.die_total}}" type="number"
                                                                              class="form-control"></td>
                            <td class="text-center" style="width: 10%"><input ng-model="model.married" min="0"
                                                                              type="number" class="form-control"></td>
                            <td class="text-center" style="width: 10%"><input ng-model="model.divorce"
                                                                              max="{{model.married}}" type="number"
                                                                              class="form-control"></td>
                        </tr>
                    </table>
                </div>
                <div class="col-sm-12">
                    <table class="table table-bordered">
                        <tr>
                            <td class="text-center" colspan="2">ຍ້າຍມາ</td>
                            <td class="text-center" colspan="2">ຍ້າຍອອກໄປ</td>
                            <td class="text-center" colspan="2">ຈຳນວນພົນລະເມືອງ ທີ່ມີໜ້າຕົວຈິງ</td>
                        </tr>
                        <tr>
                            <?php for ($i = 0; $i < 3; $i++): ?>
                                <td class="text-center" style="width: 12.5%"><?= Yii::t('app', 'Total') ?></td>
                                <td class="text-center" style="width: 12.5%"><?= Yii::t('app', 'Women') ?></td>
                            <?php endfor; ?>
                        </tr>
                        <tr>
                            <td class="text-center" style="width: 10%"><input ng-model="model.movein_total" min="0"
                                                                              type="number" class="form-control"></td>
                            <td class="text-center" style="width: 10%"><input ng-model="model.movein_women"
                                                                              max="{{model.movein_total}}" type="number"
                                                                              class="form-control"></td>
                            <td class="text-center" style="width: 10%"><input ng-model="model.moveout_total" min="0"
                                                                              type="number" class="form-control"></td>
                            <td class="text-center" style="width: 10%"><input ng-model="model.moveout_women"
                                                                              max="{{model.moveout_total}}"
                                                                              type="number" class="form-control"></td>
                            <td class="text-center" style="width: 10%"><input ng-model="model.real_total" min="0"
                                                                              type="number" class="form-control"></td>
                            <td class="text-center" style="width: 10%"><input ng-model="model.real_women"
                                                                              max="{{model.real_total}}" type="number"
                                                                              class="form-control"></td>
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
    <div ng-show="models" class="col-sm-12" style="margin-top: 2em;overflow-x: scroll">
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
                            <h3><?= $this->title ?></h3>
                            <p>
                                <a class="btn btn-default" target="_blank" href="{{url}}print&year={{year.id}}"><i
                                            class="fa fa-print fa-2x"></i></a>
                                <a class="btn btn-info" target="_blank" href="{{url}}download&year={{year.id}}"><i
                                            class="fa fa-download fa-2x"></i></a>
                            </p>
                        </div>
                        <table class="table table-bordered table-hover">
                            <thead>
                            <tr>
                                <th class="text-center" rowspan="2"><?= Yii::t('app', 'No.') ?></th>
                                <th class="text-center" rowspan="2"><?= Yii::t('app', 'Province') ?></th>
                                <th class="text-center" rowspan="2"><?= Yii::t('app', 'District') ?></th>
                                <th class="text-center" rowspan="2"><?= Yii::t('app', 'Village') ?></th>
                                <th class="text-center" colspan="2">ຈຳນວນພົນລະເມືອງ</th>
                                <th class="text-center" colspan="2"><?= Yii::t('app', 'Born') ?></th>
                                <th class="text-center" colspan="2">ເສຍຊີວິດ</th>
                                <th class="text-center" rowspan="2"><?= Yii::t('app', 'Married') ?></th>
                                <th class="text-center" rowspan="2"><?= Yii::t('app', 'Divorced') ?></th>
                                <th class="text-center" colspan="2"><?= Yii::t('app', 'Move-In') ?></th>
                                <th class="text-center" colspan="2">ຍ້າຍອອກໄປ</th>
                                <th class="text-center" colspan="2"><?= Yii::t('app', 'Real') ?></th>
                            </tr>
                            <tr>
                                <?php for ($i = 0; $i < 6; $i++): ?>
                                    <th class="text-center"><?= Yii::t('app', 'T') ?></th>
                                    <th class="text-center"><?= Yii::t('app', 'W') ?></th>
                                <?php endfor; ?>
                            </tr>
                            <tr>
                                <th class="text-center" colspan="2"><?= Yii::t('app', 'Total') ?></th>
                                <?php foreach ($columns as $c): ?>
                                    <th class="text-center">{{sum('<?= $c ?>') | number | dash}}</th>
                                <?php endforeach; ?>
                            </tr>
                            </thead>
                            <tbody>
                            <tr ng-repeat="m in models">
                                <td class="text-center">{{$index + 1}}</td>
                                <td>{{m.province_name}}</td>
                                <?php foreach ($columns as $c): ?>
                                    <td class="text-center">{{m.<?= $c ?> | number | dash}}</td>
                                <?php endforeach; ?>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="tab-pane fade" id="chart">
                    <h3>ເສັ້ນສະແດງສົມທຽບການເພີ່ມຂຶ້ນ-ຫຼຸດລົງ ຂອງພົນລະເມືອງ</h3>
                    <canvas id="stat" class="chart chart-bar"
                            chart-data="stat.data"
                            chart-labels="stat.labels"
                            chart-series="stat.series"
                            chart-colors="stat.colors"
                    </canvas>
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
  app.controller('statPopulationMovementController', function ($scope, $http, $sce, $timeout) {
    $scope.url = 'index.php?r=stat-population-movement/';
    $scope.mode = 'read';
    $scope.changemode = function () {
      $scope.mode = $scope.mode == 'read' ? 'input' : 'read';
    };
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
            $scope.stat.colors = ['#FF0000', '#0000FF'];
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
            if (r.data.model) {
              $scope.model.district = parseInt(r.data.model.district);
              $scope.model.village = parseInt(r.data.model.village);
              $scope.model.population_total = parseInt(r.data.model.population_total);
              $scope.model.population_women = parseInt(r.data.model.population_women);
              $scope.model.born_total = parseInt(r.data.model.born_total);
              $scope.model.born_women = parseInt(r.data.model.born_women);
              $scope.model.die_total = parseInt(r.data.model.die_total);
              $scope.model.die_women = parseInt(r.data.model.die_women);
              $scope.model.married = parseInt(r.data.model.married);
              $scope.model.divorce = parseInt(r.data.model.divorce);
              $scope.model.movein_total = parseInt(r.data.model.movein_total);
              $scope.model.movein_women = parseInt(r.data.model.movein_women);
              $scope.model.moveout_total = parseInt(r.data.model.moveout_total);
              $scope.model.moveout_women = parseInt(r.data.model.moveout_women);
              $scope.model.real_total = parseInt(r.data.model.real_total);
              $scope.model.real_women = parseInt(r.data.model.real_women);
            } else {
              $scope.model.district = null;
              $scope.model.village = null;
              $scope.model.population_total = null;
              $scope.model.population_women = null;
              $scope.model.born_total = null;
              $scope.model.born_women = null;
              $scope.model.die_total = null;
              $scope.model.die_women = null;
              $scope.model.married = null;
              $scope.model.divorce = null;
              $scope.model.movein_total = null;
              $scope.model.movein_women = null;
              $scope.model.moveout_total = null;
              $scope.model.moveout_women = null;
              $scope.model.real_total = null;
              $scope.model.real_women = null;
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
        $http.post($scope.url + 'save&year=' + $scope.year.id, {
          'StatPopulationMovementDetail': $scope.model,
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
