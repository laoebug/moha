<?php $_GET['menu'] = 1; ?>
<?php

/* @var $this yii\web\View */
/* @var $searchModel app\models\StatPopulationMovementSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = "ການສົມທຽບສະຖິຕິເໜັງຕີງຂອງພົນລະເມືອງ";
// $this->params['breadcrumbs'][] = $this->title;
?>
<style rel="stylesheet" href="css/angular-datepicker.css"></style>
<div class="row" ng-app="mohaApp" ng-controller="statPopulationMovementController">
  <div class="col-sm-12 hidden">
    <label class="col-sm-12"><?= Yii::t('app', 'Phiscal Year') ?></label>
    <div class="col-sm-4">
      <select class="form-control" multiple="" ng-model="year" ng-options="y.year for y in years"></select>
    </div>
    <div class="col-sm-2">
      <button type="button" class="btn btn-primary col-sm-12" ng-click="enquiry()">
        <i class="fa fa-search"></i> <?= Yii::t('app', 'Inquiry') ?>
      </button>
    </div>
  </div>

  <!-- <div class="col-sm-12" ng-show="response.status == 200">
        <div ng-show="response" class="alert alert-danger">
            {{response.statusText}}
        </div>
    </div> -->

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
                <a class="btn btn-default" target="_blank" href="{{url}}print&year={{year.id}}"><i class="fa fa-print fa-2x"></i></a>
                <a class="btn btn-info" target="_blank" href="{{url}}download"><i class="fa fa-download fa-2x"></i></a>
              </p>
            </div>
            <table class="table table-bordered table-hover">
              <thead>
                <tr>
                  <th class="text-center" rowspan="2">ປີ</th>
                  <th class="text-center" colspan="2">ຈຳນວນພົນລວມທົ່ວປະເທດ</th>
                  <th class="text-center" rowspan="2">ຈຳນວນແຂວງ</th>
                  <th class="text-center" rowspan="2">ຈຳນວນເມືອງ</th>
                  <th class="text-center" rowspan="2">ຈຳນວນບ້ານ</th>
                  <th class="text-center" rowspan="2"><?= Yii::t('app', 'Married') ?></th>
                  <th class="text-center" rowspan="2"><?= Yii::t('app', 'Divorced') ?></th>
                  <th class="text-center" colspan="2"><?= Yii::t('app', 'Born') ?></th>
                  <th class="text-center" colspan="2">ເສຍຊີວິດ</th>
                  <th class="text-center" colspan="2"><?= Yii::t('app', 'Move-In') ?></th>
                  <th class="text-center" colspan="2">ຍ້າຍອອກໄປ</th>
                  <th class="text-center" colspan="2"><?= Yii::t('app', 'Real') ?></th>
                </tr>
                <tr>
                  <?php for ($i = 0; $i < 12; $i++) : ?>
                    <th class="text-center"><?= Yii::t('app', $i % 2 == 0 ? 'T' : 'W') ?></th>
                  <?php endfor; ?>
                </tr>
              </thead>
              <tbody>
                <tr ng-repeat="m in models">
                  <td>{{m.year}}</td>
                  <?php foreach ($columns as $c) : ?>
                    <td class="text-center">{{m.<?= $c ?> | number | dash}}</td>
                  <?php endforeach; ?>
                </tr>
              </tbody>
            </table>
          </div>
        </div>
        <div class="tab-pane fade" id="chart">
          <div class="card">
            <h3>ເສັ້ນສະແດງສົມທຽບການເພີ່ມຂຶ້ນ-ຫຼຸດລົງ ຂອງພົນລະເມືອງ</h3>
            <canvas id="stat" class="chart chart-bar" chart-data="stat.data" chart-labels="stat.labels" chart-series="stat.series" chart-colors="stat.colors" </canvas> </div> </div> <!-- <div class="tab-pane fade" id="reference">-->
              <!--                    <div class="row">-->
              <!--                        <div class="col-sm-3">-->
              <!--                            <label>ເລກທີ</label>-->
              <!--                            <input type="text" ng-model="issued_no" class="form-control">-->
              <!--                        </div>-->
              <!--                        <div class="col-sm-3">-->
              <!--                            <label>ລົງວັນທີ</label>-->
              <!--                            <input id="issued_date" class="form-control datepicker" data-ng-model="$parent.issued_date" type="text">-->
              <!--                        </div>-->
              <!--                        <div class="col-sm-3">-->
              <!--                            <label>ອອກໂດຍ</label>-->
              <!--                            <input type="text" ng-model="issued_by" class="form-control">-->
              <!--                        </div>-->
              <!---->
              <!--                        <div class="col-sm-3">-->
              <!--                            <label>ເລືອກໄຟລ໌</label>-->
              <!--                            <input type="file" name="image" onchange="angular.element(this).scope().uploadedFile(this);"-->
              <!--                                   class="form-control" required>-->
              <!--                        </div>-->
              <!---->
              <!--                        <div class="col-sm-12" ng-if="references">-->
              <!--                            <div class="card">-->
              <!--                                <table class="table table-bordered">-->
              <!--                                    <thead>-->
              <!--                                    <tr>-->
              <!--                                        <th class="text-center">ວັນທີອັບໂຫຼດ</th>-->
              <!--                                        <th class="text-center">ຊື່</th>-->
              <!--                                        <th class="text-center">ເລກທີ</th>-->
              <!--                                        <th class="text-center">ລົງວັນທີ</th>-->
              <!--                                        <th class="text-center">ອອກໂດຍ</th>-->
              <!--                                        <th class="text-center">ລຶບ</th>-->
              <!--                                    </tr>-->
              <!--                                    </thead>-->
              <!--                                    <tbody>-->
              <!--                                    <tr ng-repeat="f in references">-->
              <!--                                        <td class="text-center">{{f.upload_date}}</td>-->
              <!--                                        <td class="text-center"><a href="upload/{{f.dir}}/{{f.name}}" target="_blank">{{f.original_name}}</a></td>-->
              <!--                                        <td class="text-center">{{f.issued_no}}</td>-->
              <!--                                        <td class="text-center">{{f.issued_date | date}}</td>-->
              <!--                                        <td class="text-center">{{f.issued_by}}</td>-->
              <!--                                        <td class="text-center">-->
              <!--                                            <button class="btn btn-danger" type="button" ng-click="deletefile(f)">-->
              <!--                                                <i class="fa fa-trash"></i>-->
              <!--                                            </button>-->
              <!--                                        </td>-->
              <!--                                    </tr>-->
              <!---->
              <!--                                    </tbody>-->
              <!--                                </table>-->
              <!--                            </div>-->
              <!--                        </div>-->
              <!--                    </div>-->
              <!--                </div>-->
          </div>
        </div>
      </div>
    </div>

    <script type="text/javascript" src="js/sweetalert2.js"></script>
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
      app.controller('statPopulationMovementController', function($scope, $http, $sce, $timeout) {
        $scope.url = 'index.php?r=stat-population-movement-chart/';
        $scope.enquiry = function() {
          $scope.model = null;
          $scope.models = null;
          $scope.stat = null;
          $http.get($scope.url + 'inquiry')
            .then(function(r) {
              $scope.models = r.data.models;
              $scope.stat = r.data.stat;
              $scope.stat.colors = ['#FF0000', '#0000FF'];
              $scope.getreferences();
            }, function(r) {
              $scope.response = r;
              $timeout(function() {
                $scope.response = null;
              }, 15000);
            });
        };

        $scope.enquiry();

        $scope.uploadedFile = function(element) {
          if (!$scope.issued_no) {
            $scope.files = null;
            alert('ກະລຸນາປ້ອນເລກທີ');
            return;
          }
          $scope.issued_date = $('#issued_date').val();
          if (!$scope.issued_date) {
            $scope.files = null;
            alert('ກະລຸນາປ້ອນວັນທີ');
            return;
          }

          $scope.$apply(function($scope) {
            $scope.files = element.files;
            $http({
              url: $scope.url + "upload&year=" + $scope.year.id,
              method: "POST",
              processData: false,
              headers: {
                'Content-Type': undefined
              },
              data: {
                '_csrf': $('meta[name="csrf-token"]').attr("content"),
                'issued_no': $scope.issued_no,
                'issued_date': $scope.issued_date,
                'issued_by': $scope.issued_by
              },
              transformRequest: function(data) {
                var formData = new FormData();
                var file = $scope.files[0];
                formData.append("file_upload", file);
                angular.forEach(data, function(value, key) {
                  formData.append(key, value);
                });
                return formData;
              }
            }).success(function(data, status, headers, config) {
              $scope.getreferences();
              $scope.issued_date = null;
              $scope.issued_no = null;
              $scope.issued_by = null;
              $("input[name='image'], #issued_date").val("");
              $scope.status = data.status;
              $scope.formdata = "";
            }).error(function(data, status, headers, config) {
              $scope.response = data;
              $timeout(function() {
                $scope.response = null;
              }, 15000);
            });
          });
        };

        $scope.getreferences = function() {
          if ($scope.year) {
            $http.get($scope.url + 'getreferences&year=' + $scope.year.id)
              .then(function(r) {
                if (r.data)
                  $scope.references = r.data.files;
              }, function(r) {
                $scope.response = r;
                $timeout(function() {
                  $scope.response = null;
                }, 15000);
              });
          }
        };

        $scope.deletefile = function(f) {
          if ($scope.year && f) {
            swal({
              title: "ໝັ້ນໃຈບໍ່?",
              text: "ເມື່ອລຶບແລ້ວຈະບໍ່ສາມາດເອົາຄືນມາໄດ້",
              type: "warning",
              showCancelButton: true,
              confirmButtonText: "ແມ່ນ, ລຶບ",
              cancelButtonText: "ບໍ່, ບໍ່ລຶບ",
              closeOnConfirm: true,
              closeOnCancel: true
            }, function(isConfirm) {
              if (isConfirm) {
                $http.post($scope.url + 'deletefile&year=' + $scope.year.id, {
                  'id': f.id,
                  '_csrf': $('meta[name="csrf-token"]').attr("content")
                }).then(function(r) {
                  $scope.response = r;
                  $scope.getreferences();
                  $timeout(function() {
                    $scope.response = null;
                  }, 15000);

                  if (r.status == 200) {
                    Swal.fire({
                      position: 'top-end',
                      type: 'success',
                      title: 'ການລຶບສໍາເລັດ',
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
                    title: 'ການລຶບບໍ່ສໍາເລັດ',
                    text: r.status,
                    showConfirmButton: false,
                    timer: 3000
                  });


                });
              }
            });
          }
        };
      });
    </script>