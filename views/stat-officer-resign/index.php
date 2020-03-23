<?php $_GET['menu'] = 1; ?>
<?php

/* @var $this yii\web\View */
/* @var $searchModel app\models\StatOfficerResignSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */
$this->title = "ຈຳນວນລັດຖະກອນທີ່ອອກໃນຮູບການຕ່າງໆ";
?>
<style rel="stylesheet" href="css/angular-datepicker.css"></style>
<div ng-app="mohaApp" ng-controller="officerResignController">
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
                <th class="text-center" colspan="2">ບຳນານ</th>
                <th class="text-center" colspan="2">ບຳເນັດ</th>
                <th class="text-center" colspan="2">ເສຍຊີວິດ</th>
                <th class="text-center" colspan="2">ປະລະໜ້າທີ່</th>
              </tr>
              <tr>
                <?php for ($i = 0; $i < 4; $i++) : ?>
                  <th class="text-center">ລ</th>
                  <th class="text-center">ຍ</th>
                <?php endfor; ?>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td>
                  <select class="form-control" ng-model="group" ng-change="inquiry()" ng-options="y.name for y in groups"></select>
                </td>
                <td style="width: 10%"><input type="number" min="0" ng-model="model.retire_total" class="form-control"></td>
                <td style="width: 10%"><input type="number" min="0" ng-model="model.retire_women" max="{{model.retire_total}}" class="form-control"></td>
                <td style="width: 10%"><input type="number" min="0" ng-model="model.bumnet_total" class="form-control"></td>
                <td style="width: 10%"><input type="number" min="0" ng-model="model.bumnet_women" max="{{model.bumnet_total}}" class="form-control"></td>
                <td style="width: 10%"><input type="number" min="0" ng-model="model.die_total" class="form-control"></td>
                <td style="width: 10%"><input type="number" min="0" ng-model="model.die_women" max="{{model.die_total}}" class="form-control"></td>
                <td style="width: 10%"><input type="number" min="0" ng-model="model.leave_total" class="form-control"></td>
                <td style="width: 10%"><input type="number" min="0" ng-model="model.leave_women" max="{{model.leave_total}}" class="form-control"></td>
              </tr>
            </tbody>
          </table>
          <table class="table table-bordered table-hover">
            <thead>
              <tr>
                <th class="text-center" colspan="2">ຖືກວິໄນໄລ່ອອກ</th>
                <th class="text-center" colspan="2">ລາອອກ</th>
                <th class="text-center" colspan="2">ເສຍກຳລັງແຮງງານ</th>
                <th class="text-center" colspan="2">ຍົກຍ້າຍໄປກຳລັງປະກອບອາວຸດ, ລັດວິສາຫະກິດ</th>
                <th class="text-center" colspan="2">ຍົກຍ້າຍໄປອົງການ, ກະຊວງ, ແຂວງ, ນະຄອນຫຼວງ</th>
              </tr>
              <tr>
                <?php for ($i = 0; $i < 5; $i++) : ?>
                  <th class="text-center">ລ</th>
                  <th class="text-center">ຍ</th>
                <?php endfor; ?>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td style="width: 10%"><input type="number" min="0" ng-model="model.fire_total" class="form-control"></td>
                <td style="width: 10%"><input type="number" min="0" ng-model="model.fire_women" max="{{model.fire_total}}" class="form-control"></td>
                <td style="width: 10%"><input type="number" min="0" ng-model="model.resign_total" class="form-control"></td>
                <td style="width: 10%"><input type="number" min="0" ng-model="model.resign_women" max="{{model.resign_total}}" class="form-control"></td>
                <td style="width: 10%"><input type="number" min="0" ng-model="model.lose_total" class="form-control"></td>
                <td style="width: 10%"><input type="number" min="0" ng-model="model.lose_women" max="{{model.lose_total}}" class="form-control"></td>
                <td style="width: 10%"><input type="number" min="0" ng-model="model.move_soe_total" class="form-control"></td>
                <td style="width: 10%"><input type="number" min="0" ng-model="model.move_soe_women" max="{{model.move_ministry_total}}" class="form-control"></td>
                <td style="width: 10%"><input type="number" min="0" ng-model="model.moveto_ministry_total" class="form-control"></td>
                <td style="width: 10%"><input type="number" min="0" ng-model="model.moveto_ministry_women" max="{{model.moveto_ministry_total}}" class="form-control"></td>
              </tr>
            </tbody>
          </table>
        </div>
        <div class="col-sm-12">

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
                  <th class="text-center" rowspan="3">ຊື່ພາກສ່ວນຕ່າງໆ</th>
                  <th class="text-center" colspan="2" rowspan="2">ຈຳນວນລັດຖະກອນທັງໝົດ</th>
                  <th class="text-center" colspan="14">ຈຳນວນລັດຖະກອນທີ່ອອກໃນຮູບການຕ່າງໆ</th>
                  <th class="text-center" colspan="4">ຍົກຍ້າຍໄປພາກສ່ວນອື່ນໆ</th>
                </tr>
                <tr>
                  <th class="text-center" colspan="2">ບຳນານ</th>
                  <th class="text-center" colspan="2">ບຳເນັດ</th>
                  <th class="text-center" colspan="2">ເສຍຊີວິດ</th>
                  <th class="text-center" colspan="2">ປະລະໜ້າທີ່</th>
                  <th class="text-center" colspan="2">ຖືກວິໄນໄລ່ອອກ</th>
                  <th class="text-center" colspan="2">ລາອອກ</th>
                  <th class="text-center" colspan="2">ເສຍກຳລັງແຮງງານ</th>
                  <th class="text-center" colspan="2">ຍົກຍ້າຍໄປກຳລັງປະກອບອາວຸດ, ລັດວິສາຫະກິດ</th>
                  <th class="text-center" colspan="2">ຍົກຍ້າຍໄປອົງການ, ກະຊວງ, ແຂວງ, ນະຄອນຫຼວງ</th>
                </tr>
                <tr>
                  <?php for ($i = 0; $i < 10; $i++) : ?>
                    <th class="text-center">ລ</th>
                    <th class="text-center">ຍ</th>
                  <?php endfor; ?>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td>ຈຳນວນລັດຖະກອນທັງໝົດ</td>
                  <td style="width: 5%" class="text-center">{{sum('total') | number | dash}}</td>
                  <td style="width: 5%" class="text-center">{{sum('women') | number | dash}}</td>
                  <td style="width: 5%" class="text-center">{{sumcol('retire_total') | number | dash}}</td>
                  <td style="width: 5%" class="text-center">{{sumcol('retire_women') | number | dash}}</td>
                  <td style="width: 5%" class="text-center">{{sumcol('bumnet_total') | number | dash}}</td>
                  <td style="width: 5%" class="text-center">{{sumcol('bumnet_women') | number | dash}}</td>
                  <td style="width: 5%" class="text-center">{{sumcol('die_total') | number | dash}}</td>
                  <td style="width: 5%" class="text-center">{{sumcol('die_women') | number | dash}}</td>
                  <td style="width: 5%" class="text-center">{{sumcol('leave_total') | number | dash}}</td>
                  <td style="width: 5%" class="text-center">{{sumcol('leave_women') | number | dash}}</td>
                  <td style="width: 5%" class="text-center">{{sumcol('fire_total') | number | dash}}</td>
                  <td style="width: 5%" class="text-center">{{sumcol('fire_women') | number | dash}}</td>
                  <td style="width: 5%" class="text-center">{{sumcol('resign_total') | number | dash}}</td>
                  <td style="width: 5%" class="text-center">{{sumcol('resign_women') | number | dash}}</td>
                  <td style="width: 5%" class="text-center">{{sumcol('lose_total') | number | dash}}</td>
                  <td style="width: 5%" class="text-center">{{sumcol('lose_women') | number | dash}}</td>
                  <td style="width: 5%" class="text-center">{{sumcol('move_soe_total') | number | dash}}</td>
                  <td style="width: 5%" class="text-center">{{sumcol('move_soe_women') | number | dash}}</td>
                  <td style="width: 5%" class="text-center">{{sumcol('moveto_ministry_total') | number | dash}}</td>
                  <td style="width: 5%" class="text-center">{{sumcol('moveto_ministry_women') | number | dash}}</td>
                </tr>
                <tr ng-repeat="m in models">
                  <td>{{m.name}}</td>
                  <td style="width: 5%" class="text-center">{{sumrow(m, 'total') | number | dash}}</td>
                  <td style="width: 5%" class="text-center">{{sumrow(m, 'women') | number | dash}}</td>
                  <td style="width: 5%" class="text-center">{{m.retire_total | number | dash}}</td>
                  <td style="width: 5%" class="text-center">{{m.retire_women | number | dash}}</td>
                  <td style="width: 5%" class="text-center">{{m.bumnet_total | number | dash}}</td>
                  <td style="width: 5%" class="text-center">{{m.bumnet_women | number | dash}}</td>
                  <td style="width: 5%" class="text-center">{{m.die_total | number | dash}}</td>
                  <td style="width: 5%" class="text-center">{{m.die_women | number | dash}}</td>
                  <td style="width: 5%" class="text-center">{{m.leave_total | number | dash}}</td>
                  <td style="width: 5%" class="text-center">{{m.leave_women | number | dash}}</td>
                  <td style="width: 5%" class="text-center">{{m.fire_total | number | dash}}</td>
                  <td style="width: 5%" class="text-center">{{m.fire_women | number | dash}}</td>
                  <td style="width: 5%" class="text-center">{{m.resign_total | number | dash}}</td>
                  <td style="width: 5%" class="text-center">{{m.resign_women | number | dash}}</td>
                  <td style="width: 5%" class="text-center">{{m.lose_total | number | dash}}</td>
                  <td style="width: 5%" class="text-center">{{m.lose_women | number | dash}}</td>
                  <td style="width: 5%" class="text-center">{{m.move_soe_total | number | dash}}</td>
                  <td style="width: 5%" class="text-center">{{m.move_soe_women | number | dash}}</td>
                  <td style="width: 5%" class="text-center">{{m.moveto_ministry_total | number | dash}}</td>
                  <td style="width: 5%" class="text-center">{{m.moveto_ministry_women | number | dash}}</td>
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
  app.controller('officerResignController', function($scope, $http, $sce, $timeout) {
    $scope.url = 'index.php?r=stat-officer-resign/';
    $scope.mode = 'read';
    $scope.group = null;
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

    $scope.enquiry = function() {
      $scope.model = null;
      if ($scope.year)
        $http.get($scope.url + 'enquiry&year=' + $scope.year.id)
        .then(function(r) {
          $scope.models = r.data.models;
          if ($scope.models)
            $scope.models.forEach(function(model) {
              model.retire_total = parseInt(model.retire_total);
              model.bumnet_total = parseInt(model.bumnet_total);
              model.die_total = parseInt(model.die_total);
              model.leave_total = parseInt(model.leave_total);
              model.fire_total = parseInt(model.fire_total);
              model.resign_total = parseInt(model.resign_total);
              model.lose_total = parseInt(model.lose_total);
              model.move_soe_total = parseInt(model.move_soe_total);
              model.moveto_ministry_total = parseInt(model.moveto_ministry_total);
              model.retire_women = parseInt(model.retire_women);
              model.bumnet_women = parseInt(model.bumnet_women);
              model.die_women = parseInt(model.die_women);
              model.leave_women = parseInt(model.leave_women);
              model.fire_women = parseInt(model.fire_women);
              model.resign_women = parseInt(model.resign_women);
              model.lose_women = parseInt(model.lose_women);
              model.move_soe_women = parseInt(model.move_soe_women);
              model.move_soe_women = parseInt(model.move_soe_women);
              model.moveto_ministry_women = parseInt(model.moveto_ministry_women);
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
            $scope.model.retire_total = parseInt($scope.model.retire_total);
            $scope.model.bumnet_total = parseInt($scope.model.bumnet_total);
            $scope.model.die_total = parseInt($scope.model.die_total);
            $scope.model.leave_total = parseInt($scope.model.leave_total);
            $scope.model.fire_total = parseInt($scope.model.fire_total);
            $scope.model.resign_total = parseInt($scope.model.resign_total);
            $scope.model.lose_total = parseInt($scope.model.lose_total);
            $scope.model.move_soe_total = parseInt($scope.model.move_soe_total);
            $scope.model.move_soe_total = parseInt($scope.model.move_soe_total);
            $scope.model.moveto_ministry_total = parseInt($scope.model.moveto_ministry_total);

            $scope.model.retire_women = parseInt($scope.model.retire_women);
            $scope.model.bumnet_women = parseInt($scope.model.bumnet_women);
            $scope.model.die_women = parseInt($scope.model.die_women);
            $scope.model.leave_women = parseInt($scope.model.leave_women);
            $scope.model.fire_women = parseInt($scope.model.fire_women);
            $scope.model.resign_women = parseInt($scope.model.resign_women);
            $scope.model.lose_women = parseInt($scope.model.lose_women);
            $scope.model.move_soe_women = parseInt($scope.model.move_soe_women);
            $scope.model.move_soe_women = parseInt($scope.model.move_soe_women);
            $scope.model.moveto_ministry_women = parseInt($scope.model.moveto_ministry_women);
          }
          $scope.getreferences();
        }, function(r) {
          $scope.response = r;
          $timeout(function() {
            $scope.response = null;
          }, 15000);
        });
    };

    $scope.sum = function(key) {
      var sum = 0;
      if ($scope.models)
        $scope.models.forEach(function(model) {
          if (key == 'total') {
            sum += parseInt(model.retire_total);
            sum += parseInt(model.bumnet_total);
            sum += parseInt(model.die_total);
            sum += parseInt(model.leave_total);
            sum += parseInt(model.fire_total);
            sum += parseInt(model.resign_total);
            sum += parseInt(model.lose_total);
            sum += parseInt(model.move_soe_total);
            sum += parseInt(model.moveto_ministry_total);
          } else {
            sum += parseInt(model.retire_women);
            sum += parseInt(model.bumnet_women);
            sum += parseInt(model.die_women);
            sum += parseInt(model.leave_women);
            sum += parseInt(model.fire_women);
            sum += parseInt(model.resign_women);
            sum += parseInt(model.lose_women);
            sum += parseInt(model.move_soe_women);
            sum += parseInt(model.moveto_ministry_women);
          }
        })
      return sum;
    };

    $scope.sumcol = function(key) {
      var sum = 0;
      if ($scope.models)
        $scope.models.forEach(function(m) {
          sum += parseInt(m[key]);
        })
      return sum;
    };

    $scope.sumrow = function(model, key) {
      var sum = 0;
      if (key == 'total') {
        sum += parseInt(model.retire_total);
        sum += parseInt(model.bumnet_total);
        sum += parseInt(model.die_total);
        sum += parseInt(model.leave_total);
        sum += parseInt(model.fire_total);
        sum += parseInt(model.resign_total);
        sum += parseInt(model.lose_total);
        sum += parseInt(model.move_soe_total);
        sum += parseInt(model.moveto_ministry_total);
      } else {
        sum += parseInt(model.retire_women);
        sum += parseInt(model.bumnet_women);
        sum += parseInt(model.die_women);
        sum += parseInt(model.leave_women);
        sum += parseInt(model.fire_women);
        sum += parseInt(model.resign_women);
        sum += parseInt(model.lose_women);
        sum += parseInt(model.move_soe_women);
        sum += parseInt(model.moveto_ministry_women);
      }
      return sum;
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