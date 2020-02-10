<?php $_GET['menu'] = 1; ?>
<?php

/* @var $this yii\web\View */
/* @var $searchModel app\models\StatOfficerResignSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */
// $this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'ກົມຄຸ້ມຄອງລັດຖະກອນ'), 'url' => ['index']];
$this->title = "ຈຳນວນລັດຖະກອນທີ່ອອກໃນຮູບການຕ່າງໆ";
// $this->params['breadcrumbs'][] = $this->title;
?>
<style rel="stylesheet" href="css/angular-datepicker.css"></style>
<div ng-app="mohaApp" ng-controller="officerResignController">
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
    <div class="panel panel-primary" style="margin-top: 2em" ng-show="year != null">
      <div class="panel-heading" ng-click="changemode()"><i class="fa fa-{{mode=='input'?'minus':'plus'}}"></i> ປ້ອນຂໍ້ມູນ
      </div>
      <div class="panel-body {{mode=='input'?'':'hidden'}}">
        <div class="col-sm-12">
          <table class="table table-bordered table-hover">
            <thead>
              <tr>
                <th class="text-center"><?= Yii::t('app', 'Description') ?></th>
                <th class="text-center"><?= Yii::t('app', 'Total') ?></th>
                <th class="text-center"><?= Yii::t('app', 'Women') ?></th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td>ຮັບເບ້ຍບຳນານ</td>
                <td><input type="number" min="0" ng-model="model.retire_total" class="form-control"></td>
                <td><input type="number" min="0" ng-model="model.retire_women" max="{{model.retire_total}}" class="form-control"></td>
              </tr>
              <tr>
                <td>ອຸດໜູນເທື່ອດຽວ (ບໍາເນັດ)</td>
                <td><input type="number" min="0" ng-model="model.bumnet_total" class="form-control"></td>
                <td><input type="number" min="0" ng-model="model.bumnet_women" max="{{model.bumnet_total}}" class="form-control"></td>
              </tr>
              <tr>
                <td>ເສຍຊີວິດ</td>
                <td><input type="number" min="0" ng-model="model.die_total" class="form-control"></td>
                <td><input type="number" min="0" ng-model="model.die_women" max="{{model.die_total}}" class="form-control"></td>
              </tr>
              <tr>
                <td>ປະລະໜ້າທີ່</td>
                <td><input type="number" min="0" ng-model="model.leave_total" class="form-control"></td>
                <td><input type="number" min="0" ng-model="model.leave_women" max="{{model.leave_total}}" class="form-control"></td>
              </tr>
              <tr>
                <td>ຖືກປະຕິບັດວິໄນ (ໄລ່ອອກຈາກການເປັນລັດຖະກອນ)</td>
                <td><input type="number" min="0" ng-model="model.fire_total" class="form-control"></td>
                <td><input type="number" min="0" ng-model="model.fire_women" max="{{model.fire_total}}" class="form-control"></td>
              </tr>
              <tr>
                <td>ລາອອກ (ບໍ່ເອົາບຳເນັດ)</td>
                <td><input type="number" min="0" ng-model="model.resign_total" class="form-control"></td>
                <td><input type="number" min="0" ng-model="model.resign_women" max="{{model.resign_total}}" class="form-control"></td>
              </tr>
              <tr>
                <td>ເສຍກຳລັງແຮງງານ</td>
                <td><input type="number" min="0" ng-model="model.lose_total" class="form-control"></td>
                <td><input type="number" min="0" ng-model="model.lose_women" max="{{model.lose_total}}" class="form-control"></td>
              </tr>
              <tr>
                <td>ຍົກຍ້າຍໄປຢູ່ລັດວິສາຫະກິດ, ກຳລັງປະກອບອາວຸດ (ທະຫານ, ຕຳຫຼວດ)</td>
                <td><input type="number" min="0" ng-model="model.move_soe_total" class="form-control"></td>
                <td><input type="number" min="0" ng-model="model.move_soe_women" max="{{model.move_ministry_total}}" class="form-control"></td>
              </tr>
              <tr>
                <td>ຍົກຍ້າຍໄປກະຊວງ, ອົງການ, ແຂວງ, ນະຄອນຫຼວງ</td>
                <td><input type="number" min="0" ng-model="model.moveto_ministry_total" class="form-control"></td>
                <td><input type="number" min="0" ng-model="model.moveto_ministry_women" max="{{model.moveto_ministry_total}}" class="form-control"></td>
              </tr>
              <!--                        <tr>-->
              <!--                            <td>ຍົກຍ້າຍມາຈາກພາກສ່ວນອື່ນໆ (ກະຊວງ, ອົງການ, ແຂວງ, ນະຄອນຫຼວງ)</td>-->
              <!--                            <td><input type="number" min="0" ng-model="model.movein_ministry_total"-->
              <!--                                       class="form-control"></td>-->
              <!--                            <td><input type="number" min="0" ng-model="model.movein_ministry_women"-->
              <!--                                       max="{{model.movein_ministry_total}}" class="form-control"></td>-->
              <!--                        </tr>-->
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
  <div ng-show="model" class="col-sm-12" style="margin-top: 2em;overflow-x: scroll">
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
                  <th class="text-center" rowspan="2"><?= Yii::t('app', 'No.') ?></th>
                  <th class="text-center" rowspan="2"><?= Yii::t('app', 'Description') ?></th>
                  <th class="text-center" colspan="3">ຈຳນວນລັດຖະກອນ</th>
                </tr>
                <tr>
                  <th class="text-center"><?= Yii::t('app', 'Total') ?></th>
                  <th class="text-center"><?= Yii::t('app', 'Women') ?></th>
                  <th class="text-center"><?= Yii::t('app', 'Men') ?></th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <th class="text-center" rowspan="12">V</th>
                  <th>ຈຳນວນລັດຖະກອນທີ່ອອກໃນຮູບການຕ່າງໆ</th>
                  <th class="text-center">{{formatNumber(model.retire_total + model.bumnet_total +
                                    model.die_total + model.leave_total + model.fire_total + model.resign_total +
                                    model.lose_total)}}
                  </th>
                  <th class="text-center">{{formatNumber(model.retire_women + model.bumnet_women +
                                    model.die_women + model.leave_women + model.fire_women + model.resign_women +
                                    model.lose_women)}}
                  </th>
                  <th class="text-center">{{formatNumber(model.retire_total + model.bumnet_total +
                                    model.die_total + model.leave_total + model.fire_total + model.resign_total +
                                    model.lose_total - (model.retire_women + model.bumnet_women + model.die_women +
                                    model.leave_women + model.fire_women + model.resign_women + model.lose_women))}}
                  </th>
                </tr>
                <tr>
                  <td>1. ຮັບເບ້ຍບຳນານ</td>
                  <td class='text-center'>{{formatNumber(model.retire_total)}}</td>
                  <td class='text-center'>{{formatNumber(model.retire_women)}}</td>
                  <td class='text-center'>{{formatNumber(model.retire_total - model.retire_women)}}</td>
                </tr>
                <tr>
                  <td>2. ອຸດໜຸນເທື່ອດຽວ (ບຳເນັດ)</td>
                  <td class='text-center'>{{formatNumber(model.bumnet_total)}}</td>
                  <td class='text-center'>{{formatNumber(model.bumnet_women)}}</td>
                  <td class='text-center'>{{formatNumber(model.bumnet_total - model.bumnet_women)}}</td>
                </tr>
                <tr>
                  <td>3. ເສຍຊີວິດ</td>
                  <td class='text-center'>{{formatNumber(model.die_total)}}</td>
                  <td class='text-center'>{{formatNumber(model.die_women)}}</td>
                  <td class='text-center'>{{formatNumber(model.die_total - model.die_women)}}</td>
                </tr>
                <tr>
                  <td>4. ປະລະໜ້າທີ່</td>
                  <td class='text-center'>{{formatNumber(model.leave_total)}}</td>
                  <td class='text-center'>{{formatNumber(model.leave_women)}}</td>
                  <td class='text-center'>{{formatNumber(model.leave_total - model.leave_women)}}</td>
                </tr>
                <tr>
                  <td>5. ຖືກປະຕິບັດວິໄນ (ໄລ່ອອກຈາກການເປັນລັດຖະກອນ)</td>
                  <td class='text-center'>{{formatNumber(model.fire_total)}}</td>
                  <td class='text-center'>{{formatNumber(model.fire_women)}}</td>
                  <td class='text-center'>{{formatNumber(model.fire_total - model.fire_women)}}</td>
                </tr>
                <tr>
                  <td>6. ລາອອກ (ບໍ່ເອົາບຳເນັດ)</td>
                  <td class='text-center'>{{formatNumber(model.resign_total)}}</td>
                  <td class='text-center'>{{formatNumber(model.resign_women)}}</td>
                  <td class='text-center'>{{formatNumber(model.resign_total - model.resign_women)}}</td>
                </tr>
                <tr>
                  <td>7. ເສຍກຳລັງງານ</td>
                  <td class='text-center'>{{formatNumber(model.lose_total)}}</td>
                  <td class='text-center'>{{formatNumber(model.lose_women)}}</td>
                  <td class='text-center'>{{formatNumber(model.lose_total - model.lose_women)}}</td>
                </tr>
                <tr>
                  <td>8. ຍົກຍ້າຍໄປຢູ່ລັດວິສາຫະກິດ, ກຳລັງປະກອບອາວຸດ (ທະຫານ, ຕຳຫຼວດ)</td>
                  <td class='text-center'>{{formatNumber(model.move_soe_total)}}</td>
                  <td class='text-center'>{{formatNumber(model.move_soe_women)}}</td>
                  <td class='text-center'>{{formatNumber(model.move_soe_total - model.move_soe_women)}}
                  </td>
                </tr>
                <tr>
                  <th>ຍົກຍ້າຍໄປກະຊວງ, ອົງການ, ແຂວງ, ນະຄອນຫຼວງ</th>
                  <th class="text-center">{{formatNumber(model.moveto_ministry_total +
                                    model.movein_ministry_total)}}
                  </th>
                  <th class="text-center">{{formatNumber(model.moveto_ministry_women +
                                    model.movein_ministry_women)}}
                  </th>
                  <th class="text-center">{{formatNumber(model.moveto_ministry_total +
                                    model.movein_ministry_total - (model.moveto_ministry_women +
                                    model.movein_ministry_women))}}
                  </th>
                </tr>
                <!--                            <tr>-->
                <!--                                <td>1. ຍົກຍ້າຍໄປກະຊວງ, ອົງການ, ແຂວງ, ນະຄອນຫຼວງ</td>-->
                <!--                                <td class='text-center'>{{formatNumber(model.moveto_ministry_total)}}</td>-->
                <!--                                <td class='text-center'>{{formatNumber(model.moveto_ministry_women)}}</td>-->
                <!--                                <td class='text-center'>{{formatNumber(model.moveto_ministry_total --->
                <!--                                    model.moveto_ministry_women)}}-->
                <!--                                </td>-->
                <!--                            </tr>-->
                <!--                            <tr>-->
                <!--                                <td>2. ຍົກຍ້າຍມາຈາກພາກສ່ວນອື່ນໆ (ກະຊວງ, ອົງການ, ແຂວງ, ນະຄອນຫຼວງ)</td>-->
                <!--                                <td class='text-center'>{{formatNumber(model.movein_ministry_total)}}</td>-->
                <!--                                <td class='text-center'>{{formatNumber(model.movein_ministry_women)}}</td>-->
                <!--                                <td class='text-center'>{{formatNumber(model.movein_ministry_total --->
                <!--                                    model.movein_ministry_women)}}-->
                <!--                                </td>-->
                <!--                            </tr>-->
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
    $scope.changemode = function() {
      $scope.mode = $scope.mode == 'read' ? 'input' : 'read';
    };
    $http.get($scope.url + 'get')
      .then(function(r) {
        $scope.years = r.data.years;
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
            //              $scope.model.movein_ministry_total = parseInt($scope.model.movein_ministry_total);
            $scope.model.movein_ministry_total = 0;

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
            //              $scope.model.movein_ministry_women = parseInt($scope.model.movein_ministry_women);
            $scope.model.movein_ministry_women = 0;
          } else {
            $scope.model.retire_total = null;
            $scope.model.bumnet_total = null;
            $scope.model.die_total = null;
            $scope.model.leave_total = null;
            $scope.model.fire_total = null;
            $scope.model.resign_total = null;
            $scope.model.lose_total = null;
            $scope.model.move_soe_total = null;
            $scope.model.move_soe_total = null;
            $scope.model.moveto_ministry_total = null;
            $scope.model.movein_ministry_total = null;

            $scope.model.retire_women = null;
            $scope.model.bumnet_women = null;
            $scope.model.die_women = null;
            $scope.model.leave_women = null;
            $scope.model.fire_women = null;
            $scope.model.resign_women = null;
            $scope.model.lose_women = null;
            $scope.model.move_soe_women = null;
            $scope.model.move_soe_women = null;
            $scope.model.moveto_ministry_women = null;
            $scope.model.movein_ministry_women = null;
          }
          $scope.getreferences();
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

    $scope.formatNumber = function(num, dec) {
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