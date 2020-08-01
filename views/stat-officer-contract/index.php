<?php $_GET['menu'] = 1; ?>
<?php

/* @var $this yii\web\View */
/* @var $searchModel app\models\StatOfficerContractSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */
$this->title = "ຈຳນວນພະນັກງານຕາມສັນຍາ";
?>
<style rel="stylesheet" href="css/angular-datepicker.css"></style>
<div ng-app="mohaApp" ng-controller="officerContractController">
  <label class="col-sm-12"><?= Yii::t('app', 'Phiscal Year') ?></label>
  <div class="col-sm-4">
    <select class="form-control" ng-model="year" ng-change="enquiry()" ng-options="y.year for y in years"></select>
  </div>
  <div class="col-sm-12">
    <div class="panel panel-primary" style="margin-top: 2em" ng-show="year != null">
      <div class="panel-heading" ng-click="changemode()"><i class="fa fa-{{mode=='input'?'minus':'plus'}}"></i> ປ້ອນຂໍ້ມູນ
      </div>
      <div class="panel-body {{mode=='input'?'':'hidden'}}">
        <div class="col-sm-12">
          <table class="table table-bordered table-hover">
            <thead>
              <tr>
                <th rowspan="3" class="text-center">ຊື່ພາກສ່ວນຕ່າງໆ</th>
                <th colspan="4" class="text-center">ໂຄຕາລັດຖະບານອະນຸມັດ</th>
                <th colspan="4" class="text-center">ບໍ່ນອນໃນ ໂຄຕາລັດຖະບານອະນຸມັດ (ຈ້າງເອງ)</th>
              </tr>
              <tr>
                <th colspan="2" class="text-center">ບໍລິຫານຮັບໃຊ້</th>
                <th colspan="2" class="text-center">ວິຊາການ</th>
                <th colspan="2" class="text-center">ບໍລິຫານຮັບໃຊ້</th>
                <th colspan="2" class="text-center">ວິຊາການ</th>
              </tr>
              <tr>
                <?php for ($i = 0; $i < 4; $i++) : ?>
                  <th class="text-center" style="width: 10%">ລ</th>
                  <th class="text-center" style="width: 10%">ຍ</th>
                <?php endfor; ?>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td>
                  <select class="form-control" ng-model="group" ng-change="inquiry()" ng-options="y.name for y in groups"></select>
                </td>
                <td><input type="number" min="0" ng-model="model.admin_approve_total" class="form-control"></td>
                <td><input type="number" min="0" ng-model="model.admin_approve_women" max="{{model.admin_approve_total}}" class="form-control"></td>
                <td><input type="number" min="0" ng-model="model.admin_non_total" class="form-control"></td>
                <td><input type="number" min="0" ng-model="model.admin_non_women" max="{{model.admin_non_total}}" class="form-control"></td>
                <td><input type="number" min="0" ng-model="model.officer_approve_total" class="form-control"></td>
                <td><input type="number" min="0" ng-model="model.officer_approve_women" max="{{model.officer_approve_total}}" class="form-control"></td>
                <td><input type="number" min="0" ng-model="model.officer_non_total" class="form-control"></td>
                <td><input type="number" min="0" ng-model="model.officer_non_women" max="{{model.officer_non_total}}" class="form-control"></td>
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
  <div ng-show="models" class="col-sm-12" style="margin-top: 2em;overflow-x: scroll">
    <div class="bs-component card">
      <ul class="nav nav-tabs">
        <li class="active"><a href="#table" data-toggle="tab">ຕາຕະລາງ</a></li>
        <li><a href="#reference" data-toggle="tab">ເອກະສານອ້າງອີງ</a></li>
      </ul>
      <div class="tab-content" id="myTabContent">
        <div class="tab-pane fade active in" id="table">
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
                  <th rowspan="4" class="text-center">ຊື່ພາກສ່ວນຕ່າງໆ</th>
                  <th colspan="2" rowspan="3" class="text-center">ຈຳນວນພະນັກງານຕາມສັນຍາທັງໝົດ</th>
                  <th colspan="8" class="text-center">ປະເພດພະນັກງານຕາມສັນຍາ</th>
                </tr>
                <tr>
                  <th colspan="4" class="text-center">ໂຄຕາລັດຖະບານອະນຸມັດ</th>
                  <th colspan="4" class="text-center">ບໍ່ນອນໃນ ໂຄຕາລັດຖະບານອະນຸມັດ (ຈ້າງເອງ)</th>
                </tr>
                <tr>
                  <th colspan="2" class="text-center">ບໍລິຫານຮັບໃຊ້</th>
                  <th colspan="2" class="text-center">ວິຊາການ</th>
                  <th colspan="2" class="text-center">ບໍລິຫານຮັບໃຊ້</th>
                  <th colspan="2" class="text-center">ວິຊາການ</th>
                </tr>
                <tr>
                  <?php for ($i = 0; $i < 5; $i++) : ?>
                    <th class="text-center" style="width: 8%">ລ</th>
                    <th class="text-center" style="width: 8%">ຍ</th>
                  <?php endfor; ?>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <th>ຈຳນວນລັດຖະກອນທັງໝົດ</th>
                  <th class="text-center">{{sum(models, 'total') | number | dash}}</th>
                  <th class="text-center">{{sum(models, 'women') | number | dash}}</th>
                  <th class="text-center">{{sumcol(models, 'admin_approve_total') | number | dash}}</th>
                  <th class="text-center">{{sumcol(models, 'admin_approve_women') | number | dash}}</th>
                  <th class="text-center">{{sumcol(models, 'admin_non_total') | number | dash}}</th>
                  <th class="text-center">{{sumcol(models, 'admin_non_women') | number | dash}}</th>
                  <th class="text-center">{{sumcol(models, 'officer_approve_total') | number | dash}}</th>
                  <th class="text-center">{{sumcol(models, 'officer_approve_women') | number | dash}}</th>
                  <th class="text-center">{{sumcol(models, 'officer_non_total') | number | dash}}</th>
                  <th class="text-center">{{sumcol(models, 'officer_non_women') | number | dash}}</th>
                </tr>
                <tr ng-repeat="m in models">
                  <td>{{m.name}}</td>
                  <td class="text-center">{{sumrow(m, 'total') | number | dash}}</td>
                  <td class="text-center">{{sumrow(m, 'women') | number | dash}}</td>
                  <td class="text-center">{{m.admin_approve_total | number | dash}}</td>
                  <td class="text-center">{{m.admin_approve_women | number | dash}}</td>
                  <td class="text-center">{{m.admin_non_total | number | dash}}</td>
                  <td class="text-center">{{m.admin_non_women | number | dash}}</td>
                  <td class="text-center">{{m.officer_approve_total | number | dash}}</td>
                  <td class="text-center">{{m.officer_approve_women | number | dash}}</td>
                  <td class="text-center">{{m.officer_non_total | number | dash}}</td>
                  <td class="text-center">{{m.officer_non_women | number | dash}}</td>
                </tr>
              </tbody>
            </table>
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
  app.controller('officerContractController', function($scope, $http, $sce, $timeout) {
    $scope.url = 'index.php?r=stat-officer-contract/';
    $scope.mode = 'read';
    $scope.changemode = function() {
      $scope.mode = $scope.mode == 'read' ? 'input' : 'read';
    };
    $http.get($scope.url + 'get')
      .then(function(r) {
        $scope.years = r.data.years;
        $scope.groups = r.data.groups;
      }, function(r) {
        $scope.response = r;
        $timeout(function() {
          $scope.response = null;
        }, 15000);
      });

    $scope.sum = function(models, key) {
      var sum = 0;
      if (key == 'women') {
        sum += $scope.sumcol(models, 'admin_approve_women');
        sum += $scope.sumcol(models, 'admin_non_women');
        sum += $scope.sumcol(models, 'officer_approve_women');
        sum += $scope.sumcol(models, 'officer_non_women');
      } else {
        sum += $scope.sumcol(models, 'admin_approve_total');
        sum += $scope.sumcol(models, 'admin_non_total');
        sum += $scope.sumcol(models, 'officer_approve_total');
        sum += $scope.sumcol(models, 'officer_non_total');
      }
      return sum;
    };

    $scope.sumrow = function(item, key) {
      var sum = 0;
      if (key == 'women') {
        sum += parseInt(item.admin_approve_women);
        sum += parseInt(item.admin_non_women);
        sum += parseInt(item.officer_approve_women);
        sum += parseInt(item.officer_non_women);
      } else {
        sum += parseInt(item.admin_approve_total);
        sum += parseInt(item.admin_non_total);
        sum += parseInt(item.officer_approve_total);
        sum += parseInt(item.officer_non_total);
      }
      return sum;
    };

    $scope.sumcol = function(items, key) {
      var sum = 0;
      if (items)
        items.forEach(e => {
          sum += parseInt(e[key]);
        });
      return sum;
    }

    $scope.enquiry = function() {
      $scope.model = null;
      if ($scope.year)
        $http.get($scope.url + 'enquiry&year=' + $scope.year.id)
        .then(function(r) {
          $scope.models = r.data.models;
          $scope.getreferences();
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
        $http.get($scope.url + 'inquiry&year=' + $scope.year.id + '&group=' + $scope.group.id)
        .then(function(r) {
          $scope.model = r.data.model;
          if ($scope.model) {
            $scope.model.admin_approve_total = parseInt($scope.model.admin_approve_total);
            $scope.model.admin_non_total = parseInt($scope.model.admin_non_total);
            $scope.model.officer_approve_total = parseInt($scope.model.officer_approve_total);
            $scope.model.officer_non_total = parseInt($scope.model.officer_non_total);

            $scope.model.admin_approve_women = parseInt($scope.model.admin_approve_women);
            $scope.model.admin_non_women = parseInt($scope.model.admin_non_women);
            $scope.model.officer_approve_women = parseInt($scope.model.officer_approve_women);
            $scope.model.officer_non_women = parseInt($scope.model.officer_non_women);
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
        $scope.model.group = $scope.group.id;
        $http.post($scope.url + 'save&year=' + $scope.year.id, {
          'Model': $scope.model,
          '_csrf': $('meta[name="csrf-token"]').attr("content")
        }).then(function(r) {
          $scope.response = r;
          $scope.enquiry();
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
          $scope.model = null;
          $scope.group = null;
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