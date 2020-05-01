<?php $_GET['menu'] = 1; ?>
<?php

/* @var $this yii\web\View */
/* @var $searchModel app\models\StatOfficerAddSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */
$this->title = "ຈຳນວນລັດຖະກອນທີ່ເພີ່ມເຂົ້າໃນຮູບການຕ່າງໆ";
?>
<style rel="stylesheet" href="css/angular-datepicker.css"></style>
<div ng-app="mohaApp" ng-controller="officerAddController">
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
                <th class="text-center" rowspan="2">ຊື່ພາກສ່ວນຕ່າງໆ</th>
                <th class="text-center" colspan="2">ເຂົ້າໃໝ່ 95%</th>
                <th class="text-center" colspan="2">ຍົກຍ້າຍມາຈາກກຳລັງປະກອບອາວຸດ</th>
                <th class="text-center" colspan="2">ຍົກຍ້າຍມາຈາກລັດວິສາຫະກິດ</th>
                <th class="text-center" colspan="2">ຍົກຍ້າຍມາຈາກກະຊວງ, ອົງການ, ແຂວງ</th>
                <th class="text-center" colspan="2">ຄວາມຕ້ອງການລັດຖະກອນໃໝ່</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td>
                  <select class="form-control" ng-model="group" ng-change="inquiry()" ng-options="y.name for y in groups"></select>
                </td>
                <td style="width: 10%"><input type="number" min="0" ng-model="model.quota_total" class="form-control"></td>
                <td style="width: 10%"><input type="number" min="0" ng-model="model.quota_women" max="{{model.quota_total}}" class="form-control"></td>
                <td style="width: 10%"><input type="number" min="0" ng-model="model.army_total" class="form-control"></td>
                <td style="width: 10%"><input type="number" min="0" ng-model="model.army_women" max="{{model.army_total}}" class="form-control"></td>
                <td style="width: 10%"><input type="number" min="0" ng-model="model.soe_total" class="form-control"></td>
                <td style="width: 10%"><input type="number" min="0" ng-model="model.soe_women" max="{{model.soe_total}}" class="form-control"></td>
                <td style="width: 10%"><input type="number" min="0" ng-model="model.move_total" class="form-control"></td>
                <td style="width: 10%"><input type="number" min="0" ng-model="model.move_women" max="{{model.move_total}}" class="form-control"></td>
                <td style="width: 10%"><input type="number" min="0" ng-model="model.need" class="form-control"></td>
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
                  <th class="text-center" rowspan="4">ຊື່ພາກສ່ວນຕ່າງໆ</th>
                  <th class="text-center" colspan="2" rowspan="3">ເພີ່ມເຂົ້າຕາມການແບ່ງປັນທັງໝົດ</th>
                  <th class="text-center" colspan="8">ຈຳນວນເພີ່ມເຂົ້າໃໝ່ໃນຮູບການຕ່າງໆ</th>
                  <th class="text-center" rowspan="3">ຄວາມຕ້ອງການລັດຖະກອນໃໝ່</th>
                </tr>
                <tr>
                  <th colspan="8" class="text-center">ຕາມແຜນແບ່ງປັນ (ໂກຕາ) ງວດ I ແລະ III</th>
                </tr>
                <tr>
                  <th colspan="2" class="text-center">ເຂົ້າໃໝ່ 95%</th>
                  <th colspan="2" class="text-center">ຍົກຍ້າຍມາຈາກກຳລັງປະກອບອາວຸດ</th>
                  <th colspan="2" class="text-center">ຍົກຍ້າຍມາຈາກລັດວິສາຫະກິດ</th>
                  <th colspan="2" class="text-center">ຍົກຍ້າຍມາຈາກກະຊວງ, ອົງການ, ແຂວງ</th>
                </tr>
                <tr>
                  <?php for ($i = 0; $i < 5; $i++) : ?>
                    <th class="text-center">ລ</th>
                    <th class="text-center">ຍ</th>
                  <?php endfor; ?>
                  <th class="text-center">ລ</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <th>ຈຳນວນລັດຖະກອນທັງໝົດ</th>
                  <th class="text-center">
                    {{sumcolumn('quota_total') + sumcolumn('army_total') + sumcolumn('soe_total') + sumcolumn('move_total') | number | dash}}
                  </th>
                  <th class="text-center">
                    {{sumcolumn('quota_women') + sumcolumn('army_women') + sumcolumn('soe_women') + sumcolumn('move_women') | number | dash}}
                  </th>
                  <th class="text-center">{{sumcolumn('quota_total') | number | dash}}</th>
                  <th class="text-center">{{sumcolumn('quota_women') | number | dash}}</th>
                  <th class="text-center">{{sumcolumn('army_total') | number | dash}}</th>
                  <th class="text-center">{{sumcolumn('army_women') | number | dash}}</th>
                  <th class="text-center">{{sumcolumn('soe_total') | number | dash}}</th>
                  <th class="text-center">{{sumcolumn('soe_women') | number | dash}}</th>
                  <th class="text-center">{{sumcolumn('move_total') | number | dash}}</th>
                  <th class="text-center">{{sumcolumn('move_women') | number | dash}}</th>
                  <th class="text-center">{{sumcolumn('need') | number | dash}}</th>
                </tr>
                <tr ng-repeat="m in models">
                  <td style="width: 10%">{{m.name}}</td>
                  <td class="text-center" style="width: 6%">{{m.quota_total + m.army_total + m.soe_total + m.move_total | number | dash}}</td>
                  <td class="text-center" style="width: 6%">{{m.quota_women + m.army_women + m.soe_women + m.move_women | number | dash}}</td>
                  <td class="text-center" style="width: 5%">{{m.quota_total | number | dash}}</td>
                  <td class="text-center" style="width: 5%">{{m.quota_women | number | dash}}</td>
                  <td class="text-center" style="width: 5%">{{m.army_total | number | dash}}</td>
                  <td class="text-center" style="width: 5%">{{m.army_women | number | dash}}</td>
                  <td class="text-center" style="width: 5%">{{m.soe_total | number | dash}}</td>
                  <td class="text-center" style="width: 5%">{{m.soe_women | number | dash}}</td>
                  <td class="text-center" style="width: 5%">{{m.move_total | number | dash}}</td>
                  <td class="text-center" style="width: 5%">{{m.move_women | number | dash}}</td>
                  <td class="text-center" style="width: 5%">{{m.need | number | dash}}</td>
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
  app.controller('officerAddController', function($scope, $http, $sce, $timeout) {
    $scope.url = 'index.php?r=stat-officer-add/';
    $scope.mode = 'read';
    $scope.changemode = function() {
      $scope.mode = $scope.mode == 'read' ? 'input' : 'read';
    };

    $scope.sumcolumn = function(key) {
      var s = 0;
      if ($scope.models)
        for (var i = 0; i < $scope.models.length; i++)
          if ($scope.models[i][key])
            s += parseInt($scope.models[i][key]);
      return s;
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

    $scope.enquiry = function() {
      $scope.model = null;
      if ($scope.year)
        $http.get($scope.url + 'enquiry&year=' + $scope.year.id)
        .then(function(r) {
          $scope.models = r.data.models;
          $scope.models.forEach(function(model) {
            model.quota_total = parseInt(model.quota_total);
            model.army_total = parseInt(model.army_total);
            model.soe_total = parseInt(model.soe_total);
            model.move_total = parseInt(model.move_total);
            model.quota_women = parseInt(model.quota_women);
            model.army_women = parseInt(model.army_women);
            model.soe_women = parseInt(model.soe_women);
            model.move_women = parseInt(model.move_women);
            model.need = parseInt(model.need);
          });
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
      if ($scope.year && $scope.group)
        $http.get($scope.url + 'inquiry&year=' + $scope.year.id + '&id=' + $scope.group.id)
        .then(function(r) {
          $scope.model = r.data.model;
          if (r.data.model) {
            $scope.model.quota_total = parseInt($scope.model.quota_total);
            $scope.model.army_total = parseInt($scope.model.army_total);
            $scope.model.soe_total = parseInt($scope.model.soe_total);
            $scope.model.move_total = parseInt($scope.model.move_total);
            $scope.model.quota_women = parseInt($scope.model.quota_women);
            $scope.model.army_women = parseInt($scope.model.army_women);
            $scope.model.soe_women = parseInt($scope.model.soe_women);
            $scope.model.move_women = parseInt($scope.model.move_women);
            $scope.model.need = parseInt($scope.model.need);
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
        $scope.model.ministry_group_id = $scope.group.id;
        $http.post($scope.url + 'save&year=' + $scope.year.id, {
          'Model': $scope.model,
          '_csrf': $('meta[name="csrf-token"]').attr("content")
        }).then(function(r) {
          $scope.response = r;
          $scope.enquiry();
          $timeout(function() {
            $scope.response = null;
          }, 15000);
          $scope.model = null;
          $scope.group = null;
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