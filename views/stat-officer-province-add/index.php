<?php $_GET['menu'] = 1; ?>
<?php

/* @var $this yii\web\View */
/* @var $dataProvider yii\data\ActiveDataProvider */
// $this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'ກົມຄຸ້ມຄອງລັດຖະກອນ'), 'url' => ['index']];
$this->title = "ສະຖິຕິລັດຖະກອນທີ່ເພີ່ມເຂົ້າ ແລະ ອອກໃນທຸກຮູບການທົ່ວແຂວງ ແລະ ນະຄອນຫຼວງວຽງຈັນ";
// $this->params['breadcrumbs'][] = $this->title;
?>
<style rel="stylesheet" href="css/angular-datepicker.css"></style>
<div ng-app="mohaApp" ng-controller="officerProvinceAddController">
  <!-- <div class="col-sm-12"> -->
  <label class="col-sm-12"><?= Yii::t('app', 'Phiscal Year') ?></label>
  <div class="col-sm-4">
    <select class="form-control" ng-model="year" ng-change="enquiry()" ng-options="y.year for y in years"></select>
  </div>
  <!-- <div class="col-sm-8">
            <div ng-show="response" class="alert alert-{{response.status == 200? 'success':'danger'}}">
                {{response.statusText}}
            </div>
        </div>
    </div> -->
  <div class="col-sm-12">
    <div class="panel panel-primary" style="margin-top: 2em" ng-show="year">
      <div class="panel-heading" ng-click="changemode()"><i class="fa fa-{{mode=='input'?'minus':'plus'}}"></i> ປ້ອນຂໍ້ມູນ
      </div>
      <div class="panel-body {{mode=='input'?'':'hidden'}}">
        <div class="col-sm-12">
          <div class="col-sm-3">
            <label><?= Yii::t('app', 'Province') ?></label>
            <select ng-options="m.province_name for m in provinces" ng-model="model.province" ng-change="inquiry()" class="form-control"></select>
          </div>
          <div class="col-sm-3">
            <label>ເພີ່ມເຂົ້າ</label>
            <input class="form-control" ng-model="model.add" min="0" type="number">
          </div>
          <div class="col-sm-3">
            <label>ລາອອກ (ບໍ່ເອົາບຳເນັດ)</label>
            <input class="form-control" ng-model="model.resign" min="0" max="model.add" type="number">
          </div>
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
          <div class="card">
            <div class="card-title-w-btn ">
              <h3>ຕາຕະລາງ <?= $this->title ?> {{year.year}}</h3>
              <p>
                <a class="btn btn-default" target="_blank" href="{{url}}print&year={{year.id}}"><i class="fa fa-print fa-2x"></i></a>
                <a class="btn btn-info" target="_blank" href="{{url}}download&year={{year.id}}"><i class="fa fa-download fa-2x"></i></a>
              </p>
            </div>
            <table class="table table-bordered">
              <thead>
                <tr>
                  <th><?= Yii::t('app', 'No.') ?></th>
                  <th>ແຂວງ/ນະຄອນຫຼວງ</th>
                  <th class="text-center"><?= Yii::t('app', 'Add') ?></th>
                  <th class="text-center"><?= Yii::t('app', 'Resign') ?></th>
                </tr>
              </thead>
              <tbody>
                <tr ng-repeat="m in models">
                  <td>{{$index + 1}}</td>
                  <td>{{m.province_name}}</td>
                  <td class="text-center">{{m.add | number | dash}}</td>
                  <td class="text-center">{{m.resign | number | dash}}</td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>
        <div class="tab-pane fade" id="chart">
          <div class="card">
            <h3><?= $this->title ?> {{year.year}}</h3>
            <canvas id="stat" class="chart chart-horizontal-bar" chart-data="stat.data" chart-labels="stat.labels" chart-series="stat.series" chart-colors="stat.colors" chart-options="options">
            </canvas>
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
              <input type="file" name="image" onchange="angular.element(this).scope().uploadedFile(this);" class="form-control" required>
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
<script type="text/javascript" src="js/sweetalert2.js"></script>
<script type="text/javascript" src="js/Chart.js"></script>
<script type="text/javascript" src="js/angular.js"></script>
<script type="text/javascript" src="js/angular-chart.js"></script>
<script type="text/javascript" src="js/moment.js"></script>
<script type="text/javascript" src="js/datetimepicker.js"></script>
<script type="text/javascript" src="js/datetimepicker.templates.js"></script>
<script type="text/javascript">
  Chart.defaults.global.defaultFontFamily = 'Saysettha OT';
  var app = angular.module('mohaApp', ['chart.js', 'ui.bootstrap.datetimepicker']);
  app.filter('dash', function() {
    return function(input) {
      return input ? input : '-';
    };
  });
  app.controller('officerProvinceAddController', function($scope, $http, $sce, $timeout) {
    $scope.url = 'index.php?r=stat-officer-province-add/';
    $scope.mode = 'read';
    $scope.changemode = function() {
      $scope.mode = $scope.mode == 'read' ? 'input' : 'read';
    };
    $scope.options = {
      legend: {
        display: true,
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
            //            stepSize: 1,
            min: 0,
            //            autoSkip: false
          }
        }]
      },
      tooltipEvents: [],
      showTooltips: true,
      tooltipCaretSize: 0,
      onAnimationComplete: function() {
        this.showTooltip(this.segments, true);
      }
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

    $scope.enquiry = function() {
      $scope.models = null;
      $scope.stat = null;
      if ($scope.year)
        $http.get($scope.url + 'enquiry&year=' + $scope.year.id)
        .then(function(r) {
          $scope.getreferences();
          $scope.models = r.data.models;
          $scope.stat = r.data.stat;
          $scope.stat.colors = ['#0000FF', '#FF0000'];
          $scope.getreferences();
        }, function(r) {
          $scope.response = r;
          $timeout(function() {
            $scope.response = null;
          }, 15000);
        });
    };

    $scope.inquiry = function() {
      if ($scope.year && $scope.model.province)
        $http.get($scope.url + 'inquiry&year=' + $scope.year.id + '&province=' + $scope.model.province.id)
        .then(function(r) {
          if (r.data.model) {
            $scope.model.add = parseInt(r.data.model.add);
            $scope.model.resign = parseInt(r.data.model.resign);
          } else {
            $scope.model.add = null;
            $scope.model.resign = null;
          }
        }, function(r) {
          $scope.response = r;
          $timeout(function() {
            $scope.response = null;
          }, 15000);
        });
    };

    $scope.save = function() {
      if ($scope.model)
        $http.post($scope.url + 'save&year=' + $scope.year.id, {
          'Model': $scope.model,
          '_csrf': $('meta[name="csrf-token"]').attr("content")
        }).then(function(r) {
          $scope.model = null;
          $scope.enquiry();
          $scope.response = r;
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


        })
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