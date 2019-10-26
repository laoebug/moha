<?php $_GET['menu'] = 1; ?>
<?php

/* @var $this yii\web\View */
/* @var $searchModel app\models\StatOfficerSalarySearch */
/* @var $dataProvider yii\data\ActiveDataProvider */
// $this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'ກົມຈັດຕັ້ງ ແລະ ພະນັກງານ'), 'url' => ['index']];
$this->title = "ຕາຕະລາງສັງລວມຈຳນວນລັດຖະກອນ ແຍກຕາມຊັ້ນ-ຂັ້ນເງິນເດືອນ (ແຕ່ຊັ້ນ I ເຖິງຊັ້ນ V)";
// $this->params['breadcrumbs'][] = $this->title;
?>
<style rel="stylesheet" href="css/angular-datepicker.css"></style>
<div ng-app="mohaApp" ng-controller="statOfficerSalary">
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
        <div class="col-sm-4">
          <label>ພາກສ່ວນ</label>
          <select class="form-control" ng-model="model.level" ng-change="inquiry()" ng-options="l.name for l in levels"></select>
          <label>ຊັ້ນ</label>
          <select class="form-control" ng-model="model.step" ng-change="inquiry()" ng-options="l.name for l in steps"></select>
        </div>
        <div class="col-sm-8" ng-show="model.level && model.step">
          <table class="table table-bordered table-hover">
            <thead>
              <tr>
                <?php for ($i = 1; $i < 4; $i++) : ?>
                  <th colspan="2" class="text-center">ຂັ້ນ <?= $i ?></th>
                <?php endfor; ?>
              </tr>
              <tr>
                <?php for ($i = 1; $i < 7; $i++) : ?>
                  <th class="text-center"><?= $i % 2 == 1 ? 'ລ' : 'ຍ' ?></th>
                <?php endfor; ?>
              </tr>
            </thead>
            <tbody>
              <tr>
                <?php for ($i = 1; $i < 4; $i++) : ?>
                  <td><input class="form-control" ng-model="model.level<?= $i ?>_total" type="number" min="0"></td>
                  <td><input class="form-control" ng-model="model.level<?= $i ?>_women" type="number" max="{{model.level<?= $i ?>_total}}"></td>
                <?php endfor; ?>
              </tr>
            </tbody>
          </table>
        </div>
        <div class="col-sm-12" ng-show="model.level && model.step">
          <table class="table table-bordered table-hover">
            <thead>
              <tr>
                <?php for ($i = 4; $i < 10; $i++) : ?>
                  <th colspan="2" class="text-center">ຂັ້ນ <?= $i ?></th>
                <?php endfor; ?>
              </tr>
              <tr>
                <?php for ($i = 1; $i < 13; $i++) : ?>
                  <th class="text-center"><?= $i % 2 == 1 ? 'ລ' : 'ຍ' ?></th>
                <?php endfor; ?>
              </tr>
            </thead>
            <tbody>
              <tr>
                <?php for ($i = 4; $i < 10; $i++) : ?>
                  <td><input class="form-control" ng-model="model.level<?= $i ?>_total" type="number" min="0"></td>
                  <td><input class="form-control" ng-model="model.level<?= $i ?>_women" type="number" max="{{model.level<?= $i ?>_total}}"></td>
                <?php endfor; ?>
              </tr>
            </tbody>
          </table>
        </div>
        <div class="col-sm-12" ng-if="model.level && model.step">
          <table class="table table-bordered table-hover">
            <thead>
              <tr>
                <?php for ($i = 10; $i < 16; $i++) : ?>
                  <th colspan="2" class="text-center">ຂັ້ນ <?= $i ?></th>
                <?php endfor; ?>
              </tr>
              <tr>
                <?php for ($i = 1; $i < 13; $i++) : ?>
                  <th class="text-center"><?= $i % 2 == 1 ? 'ລ' : 'ຍ' ?></th>
                <?php endfor; ?>
              </tr>
            </thead>
            <tbody>
              <tr>
                <?php for ($i = 10; $i < 16; $i++) : ?>
                  <td><input class="form-control" ng-model="model.level<?= $i ?>_total" type="number" min="0"></td>
                  <td><input class="form-control" ng-model="model.level<?= $i ?>_women" type="number" max="{{model.level<?= $i ?>_total}}"></td>
                <?php endfor; ?>
              </tr>
            </tbody>
          </table>
        </div>

        <div class="col-sm-3" style="margin-top: 1em" ng-if="model.level && model.step">
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
          <div class="card" style="overflow-x: scroll">
            <div class="card-title-w-btn ">
              <h3><?= $this->title ?> {{year.year}}</h3>
              <p>
                <a class="btn btn-default" target="_blank" href="{{url}}print&year={{year.id}}"><i class="fa fa-print fa-2x"></i></a>
                <a class="btn btn-info" target="_blank" href="{{url}}download&year={{year.id}}"><i class="fa fa-download fa-2x"></i></a>
              </p>
            </div>
            <div ng-repeat="model in models">
              <table class="table table-bordered table-hover">
                <thead>
                  <tr>
                    <th class="text-center" rowspan="4">ລ/ດ</th>
                    <th class="text-center" rowspan="4">ພາກສ່ວນຕ່າງໆ</th>
                    <th class="text-center" rowspan="4" colspan="2">ຈ/ນ ລັດຖະກອນ ທັງໝົດ</th>
                    <th class="text-center" colspan="30">ຈຳນວນລັດຖະກອນທີ່ບັນຈຸຕາມຊັ້ນເງິນເດືອນ</th>
                  </tr>
                  <tr>
                    <th class="text-center" colspan="30">ຊັ້ນ {{model[0].step}}</th>
                  </tr>
                  <tr>
                    <?php for ($i = 1; $i < 16; $i++) : ?>
                      <th class="text-center" colspan="2">ຂັ້ນ <?= $i ?></th>
                    <?php endfor; ?>
                  </tr>
                  <tr>
                    <?php for ($i = 1; $i < 31; $i++) : ?>
                      <th class="text-center"><?= $i % 2 == 1 ? 'ລ' : 'ຍ' ?></th>
                    <?php endfor; ?>
                  </tr>
                  <tr>
                    <th class="text-center" colspan="2">1. ກະຊວງພາຍໃນ ລວມທັງໝົດ</th>
                    <th class="text-center">{{sumtotal(model, 'total') | number | dash}}</th>
                    <th class="text-center">{{sumtotal(model, 'women') | number | dash}}</th>
                    <?php for ($i = 1; $i < 16; $i++) : ?>
                      <th class="text-center">{{sumcolumn(model, 'level<?= $i ?>_total') | number |
                                            dash}}
                      </th>
                      <th class="text-center">{{sumcolumn(model, 'level<?= $i ?>_women') | number |
                                            dash}}
                      </th>
                    <?php endfor; ?>
                  </tr>
                </thead>
                <tbody>
                  <tr ng-repeat="m in model">
                    <td colspan="2">{{m.name}}</td>
                    <td class="text-center">{{sumrow(m, 'total') | number | dash}}</td>
                    <td class="text-center">{{sumrow(m, 'women') | number | dash}}</td>
                    <?php for ($i = 1; $i < 16; $i++) : ?>
                      <td class="text-center">{{m.level<?= $i ?>_total | number | dash}}</td>
                      <td class="text-center">{{m.level<?= $i ?>_women | number | dash}}</td>
                    <?php endfor; ?>
                  </tr>
                </tbody>
              </table>
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
  app.controller('statOfficerSalary', function($scope, $http, $sce, $timeout) {
    $scope.url = 'index.php?r=stat-officer-salary/';
    $scope.mode = 'read';
    $scope.changemode = function() {
      $scope.mode = $scope.mode == 'read' ? 'input' : 'read';
    };
    $http.get($scope.url + 'get')
      .then(function(r) {
        $scope.years = r.data.years;
        $scope.levels = r.data.levels;
        $scope.steps = r.data.steps;
      }, function(r) {
        $scope.response = r;
        $timeout(function() {
          $scope.response = null;
        }, 15000);
      });

    $scope.inquiry = function() {
      if ($scope.year && $scope.model.level && $scope.model.step)
        $http.get($scope.url + 'inquiry&year=' + $scope.year.id + '&level=' + $scope.model.level.id + '&step=' + $scope.model.step.id)
        .then(function(r) {
          if (r.data.model) {
            <?php for ($i = 0; $i < 16; $i++) : ?>
              $scope.model.level<?= $i ?>_total = parseInt(r.data.model.level<?= $i ?>_total);
              $scope.model.level<?= $i ?>_women = parseInt(r.data.model.level<?= $i ?>_women);
            <?php endfor; ?>
          } else {
            <?php for ($i = 0; $i < 16; $i++) : ?>
              $scope.model.level<?= $i ?>_total = null;
              $scope.model.level<?= $i ?>_women = null;
            <?php endfor; ?>
          }
        }, function(r) {
          $scope.response = r;
          $timeout(function() {
            $scope.response = null;
          }, 15000);
        });
    };

    $scope.enquiry = function() {
      $scope.model = null;
      $scope.models = null;
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

    $scope.save = function() {
      if ($scope.year && $scope.model) {
        $http.post($scope.url + 'save&year=' + $scope.year.id, {
          'Model': $scope.model,
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

    $scope.sumcolumn = function(model, key) {
      var s = 0;
      if (model)
        for (var i = 0; i < model.length; i++)
          if (model[i][key])
            s += parseInt(model[i][key]);
      return s;
    };

    $scope.sumrow = function(m, key) {
      var s = 0;
      if (key == 'total') {
        <?php for ($i = 1; $i < 16; $i++) : ?>
          if (m.level<?= $i ?>_total)
            s += parseInt(m.level<?= $i ?>_total);
        <?php endfor; ?>
      } else if (key == 'women') {
        <?php for ($i = 1; $i < 16; $i++) : ?>
          if (m.level<?= $i ?>_women)
            s += parseInt(m.level<?= $i ?>_women);
        <?php endfor; ?>
      }
      return s;
    };

    $scope.sumtotal = function(model, key) {
      var s = 0;
      if (key == 'total') {
        <?php for ($i = 1; $i < 16; $i++) : ?>
          s += $scope.sumcolumn(model, 'level<?= $i ?>_total');
        <?php endfor; ?>
      } else if (key == 'women') {
        <?php for ($i = 1; $i < 16; $i++) : ?>
          s += $scope.sumcolumn(model, 'level<?= $i ?>_women');
        <?php endfor; ?>
      }
      return s;
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