<?php $_GET['menu'] = 1; ?>
<?php

/* @var $this yii\web\View */
/* @var $dataProvider yii\data\ActiveDataProvider */
// $this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'ກົມວຽກງານຊົນເຜົ່າ ແລະ ສາສະໜາ'), 'url' => ['index']];
$this->title = "ສະຖິຕິຊົນເຜົ່າໃນທົ່ວປະເທດ";
// $this->params['breadcrumbs'][] = $this->title;
?>
<style rel="stylesheet" href="css/angular-datepicker.css"></style>
<div class="row" ng-app="mohaApp" ng-controller="statEthnicController">

  <label class="col-sm-12"><?= Yii::t('app', 'Phiscal Year') ?></label>
  <div class="col-sm-4">
    <select class="form-control" ng-model="year" ng-change="enquiry()" ng-options="y.year for y in years"></select>
  </div>
  <!-- <div class="col-sm-8">
            <div ng-show="response" class="alert alert-{{response.status == 200? 'success':'danger'}}">
                {{response.statusText}}
            </div>
        </div> -->

  <div class="col-sm-12">
    <div class="panel panel-primary" style="margin-top: 2em" ng-show="year != null">
      <div class="panel-heading" ng-click="changemode()"><i class="fa fa-{{mode=='input'?'minus':'plus'}}"></i> ປ້ອນຂໍ້ມູນ
      </div>
      <div class="panel-body {{mode=='input'?'':'hidden'}}">
        <div class="col-sm-3">
          <label for="">ແຂວງ</label>
          <select class="form-control" ng-model="model.province" ng-options="b.province_name for b in provinces">
          </select>
        </div>
        <div class="col-sm-3">
          <label for=""><?= Yii::t('app', 'Ethnic') ?></label>
          <select class="form-control" ng-model="model.ethnic" ng-options="e.name for e in ethnics" ng-change="inquiry()">
          </select>
        </div>
        <div class="col-sm-2">
          <label for=""><?= Yii::t('app', 'Total') ?></label>
          <input type="number" class="form-control" ng-model="model.total" min="0">
        </div>
        <div class="col-sm-2">
          <label class="col-sm-12" for=""><?= Yii::t('app', 'Women') ?></label>
          <input type="number" class="form-control" ng-model="model.women" max="{{model.total}}">
        </div>
        <div class="col-sm-2">
          <label class="col-sm-12" for="">&nbsp;</label>
          <button class="btn btn-primary" type="button" ng-click="save()">
            <i class="fa fa-save"></i> <?= Yii::t('app', 'Save') ?>
          </button>
        </div>
      </div>
    </div>
  </div>
  <div class="col-sm-12" ng-show="year">
    <div class="bs-component card">
      <ul class="nav nav-tabs">
        <li class="active"><a href="#table" data-toggle="tab">ຕາຕະລາງ</a></li>
        <li><a href="#reference" data-toggle="tab">ເອກະສານອ້າງອີງ</a></li>
      </ul>
      <div class="tab-content" id="myTabContent">
        <div class="tab-pane fade active in" id="table">
          <div class="row">
            <div class="col-sm-12" ng-bind-html="result"></div>
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
                      <td class="text-center">{{(f.issued_by=='undefined')?'':f.issued_by}}</td>
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
<script type="text/javascript" src="js/angular.js"></script>
<script type="text/javascript" src="js/moment.js"></script>
<script type="text/javascript" src="js/datetimepicker.js"></script>
<script type="text/javascript" src="js/datetimepicker.templates.js"></script>
<script type="text/javascript">
  var app = angular.module('mohaApp', ['ui.bootstrap.datetimepicker']);
  app.filter('dash', function() {
    return function(input) {
      return input ? input : '-';
    };
  });
  app.controller('statEthnicController', function($scope, $http, $sce, $timeout) {
    $scope.url = 'index.php?r=stat-ethnic/';
    $scope.mode = 'read';
    $scope.changemode = function() {
      $scope.mode = $scope.mode == 'read' ? 'input' : 'read';
    };
    $http.get($scope.url + 'get')
      .then(function(r) {
        $scope.years = r.data.years;
        $scope.provinces = r.data.provinces;
        $scope.ethnics = r.data.ethnics;
      }, function(r) {
        $scope.response = r;
        $timeout(function() {
          $scope.response = null;
        }, 15000);
      });

    $scope.enquiry = function() {
      $scope.model = null;
      $scope.result = null;
      if ($scope.year)
        $http.get($scope.url + 'enquiry&year=' + $scope.year.id)
        .then(function(r) {
          $scope.result = $sce.trustAsHtml(r.data);
          $scope.getreferences();
        }, function(r) {
          $scope.response = r;
          $scope.result = null;
          $timeout(function() {
            $scope.response = null;
          }, 15000);
        });
    };

    $scope.inquiry = function() {
      if ($scope.year && $scope.model.province && $scope.model.ethnic)
        $http.get($scope.url + 'inquiry&province=' + $scope.model.province.id + '&year=' + $scope.year.id + '&ethnic=' + $scope.model.ethnic.id)
        .then(function(r) {
          if (r.data.model) {
            $scope.model.total = parseInt(r.data.model.total);
            $scope.model.women = parseInt(r.data.model.women);
          } else {
            $scope.model.total = null;
            $scope.model.women = null;
          }
        }, function(r) {
          $scope.response = r;
          $timeout(function() {
            $scope.response = null;
          }, 15000);
        });
    };

    $scope.save = function() {
      if ($scope.year && $scope.model) {
        $http.post($scope.url + 'save&year=' + $scope.year.id, {
          'StatEthnicDetail': $scope.model,
          '_csrf': $('meta[name="csrf-token"]').attr("content")
        }).then(function(r) {
          $scope.model = null;
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
              text: r.status + " " + r.statusText,
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
            text: r.status + " " + r.statusText,
            showConfirmButton: false,
            timer: 3000
          });

        });
      }
    };


    $scope.uploadedFile = function(element) {
      if (!$scope.issued_no) {
        $scope.files = null;
        Swal.fire({
          title: 'ອັບໂຫຼດຟາຍ',
          type: 'warning',
          text: 'ກະລຸນາປ້ອນເລກທີ',

        });
        return;
      }
      $scope.issued_date = $('#issued_date').val();
      if (!$scope.issued_date) {
        $scope.files = null;

        Swal.fire({
          title: 'ອັບໂຫຼດຟາຍ',
          type: 'warning',
          text: 'ກະລຸນາປ້ອນວັນທີ',

        });
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
        }).then(
          function(r) {

            $scope.getreferences();
            $scope.issued_date = null;
            $scope.issued_no = null;
            $scope.issued_by = null;
            $("input[name='image'], #issued_date").val("");
            $scope.status = r.status;
            $scope.formdata = "";
            Swal.fire({
              position: 'top-end',
              type: 'success',
              title: 'ອັບໂຫລດຟາຍສໍາເລັດ',
              text: r.status + " " + r.statusText,
              showConfirmButton: false,
              timer: 3000
            });
          },
          function(r) {
            $scope.response = r;
            Swal.fire({
              position: 'top-end',
              type: 'error',
              title: 'ອັບໂຫລດຟາຍບໍ່ສໍາເລັດ',
              text: r.status + " " + r.statusText,
              showConfirmButton: false,
              timer: 3000
            });
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
                  text: r.status + " " + r.statusText,
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
                text: r.status + " " + r.statusText,
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