<?php $_GET['menu'] = 1;

/* @var $this yii\web\View */
/* @var $searchModel app\models\Stat3createSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */
$this->title = "ຕະຕະລາງສັງລວມຈຳນວນລັດຖະກອນ ແຍກຕາມຊັ້ນ-ຂັ້ນເງິນດືອນ (ສະເພາະຊັ້ນ VI) ປະຈຳປີ ";
?>
<style rel="stylesheet" href="css/angular-datepicker.css"></style>
<div class="row" ng-app="mohaApp" ng-controller="statOfficerSalary6Controller">
  <div class="col-sm-12">
    <label class="col-sm-12"><?= Yii::t('app', 'Phiscal Year') ?></label>
    <div class="col-sm-4">
      <select class="form-control" ng-model="year" ng-change="enquiry()" ng-options="y.year for y in years"></select>
    </div>
    <div class="col-sm-8">
      <div ng-show="response" class="alert alert-{{response.status == 200? 'success':'danger'}}">
        {{response.statusText}}
      </div>
    </div>
  </div>
  <div class="col-sm-12">
    <div class="panel panel-primary" style="margin-top: 2em" ng-show="year != null">
      <div class="panel-heading" ng-click="changemode()"><i class="fa fa-{{mode=='input'?'minus':'plus'}}"></i>
        ປ້ອນຂໍ້ມູນ
      </div>
      <div class="panel-body {{mode=='input'?'':'hidden'}}">
        <div class="row">
          <div class="col-sm-6">
            <label for="">ຊື່ພາກສ່ວນຕ່າງໆ</label>
            <select class="form-control" ng-model="ministry" ng-options="g.name for g in ministries" ng-change="inquiry()">
            </select>
          </div>
          <div class="col-sm-6">
            <label for="">ຊັ້ນວິຊາສະເພາະ</label>
            <select class="form-control" ng-model="level" ng-options="g.name for g in levels" ng-change="inquiry()">
            </select>
          </div>
        </div>
        <table class="table table-bordered" style="margin-top: 10px">
          <tr>
            <?php for ($i = 1; $i < 7; $i++) : ?>
              <th class="text-center" colspan="2">ຂັ້ນ <?= $i ?></th>
            <?php endfor; ?>
          </tr>
          <tr>
            <?php for ($i = 1; $i < 7; $i++) : ?>
              <th class="text-center">ລ</th>
              <th class="text-center">ຍ</th>
            <?php endfor; ?>
          </tr>
          <tr>
            <td><input type="number" min="0" class="form-control" ng-model="model.step1"></td>
            <td><input type="number" min="0" class="form-control" ng-model="model.step1_women"></td>
            <td><input type="number" min="0" class="form-control" ng-model="model.step2"></td>
            <td><input type="number" min="0" class="form-control" ng-model="model.step2_women"></td>
            <td><input type="number" min="0" class="form-control" ng-model="model.step3"></td>
            <td><input type="number" min="0" class="form-control" ng-model="model.step3_women"></td>
            <td><input type="number" min="0" class="form-control" ng-model="model.step4"></td>
            <td><input type="number" min="0" class="form-control" ng-model="model.step4_women"></td>
            <td><input type="number" min="0" class="form-control" ng-model="model.step5"></td>
            <td><input type="number" min="0" class="form-control" ng-model="model.step5_women"></td>
            <td><input type="number" min="0" class="form-control" ng-model="model.step6"></td>
            <td><input type="number" min="0" class="form-control" ng-model="model.step6_women"></td>
          </tr>
        </table>
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
        <li><a href="#reference" data-toggle="tab">ເອກະສານອ້າງອີງ</a></li>
      </ul>
      <div class="tab-content" id="myTabContent">
        <div class="tab-pane fade active in" id="table">
          <div class="card" style="overflow-x: scroll">
            <div class="card-title-w-btn ">
              <h3><?= $this->title ?></h3>
              <p>
                <a class="btn btn-default" target="_blank" href="{{url}}print&year={{year.id}}"><i class="fa fa-print fa-2x"></i></a>
                <a class="btn btn-info" target="_blank" href="{{url}}download&year={{year.id}}"><i class="fa fa-download fa-2x"></i>
                </a>
              </p>
            </div>
            <table class="table table-bordered table-hover" ng-show="models">
              <thead>
                <tr>
                  <th class="text-center" rowspan="3"><?= Yii::t('app', 'No.') ?></th>
                  <th class="text-center" rowspan="3">ຊື່ພາກສ່ວນຕ່າງໆ</th>
                  <th class="text-center" rowspan="3">ຊັ້ນວິຊາສະເພາະ</th>
                  <th class="text-center" rowspan="2" colspan="2">ຈຳນວນພະນັກງານຊັ້ນ VI ທັງໝົດ</th>
                  <th class="text-center" colspan="12">ຈຳນວນລັດຖະກອນທີ່ບັນຈຸຕາມຊັ້ນ-ຂັ້ນເງິນເດືອນ</th>
                </tr>
                <tr>
                  <?php for ($i = 1; $i < 7; $i++) : ?>
                    <th class="text-center" colspan="2">ຂັ້ນ <?= $i ?></th>
                  <?php endfor; ?>
                </tr>
                <tr>
                  <?php for ($i = 1; $i < 8; $i++) : ?>
                    <th class="text-center">ລ</th>
                    <th class="text-center">ຍ</th>
                  <?php endfor; ?>
                </tr>
              </thead>
              <tbody ng-repeat="m in models">
                <tr style="background-color: #eeffff;">
                  <th class="text-center">{{$index + 1}}</th>
                  <th colspan="2">{{m.name}}</th>
                  <th class="text-center">{{sum(m.items, '') | number | dash}}</th>
                  <th class="text-center">{{sum(m.items, 'women') | number | dash}}</th>
                  <th class="text-center">{{sumcolumn(m.items, 'step1') | number | dash}}</th>
                  <th class="text-center">{{sumcolumn(m.items, 'step1_women') | number | dash}}</th>
                  <th class="text-center">{{sumcolumn(m.items, 'step2') | number | dash}}</th>
                  <th class="text-center">{{sumcolumn(m.items, 'step2_women') | number | dash}}</th>
                  <th class="text-center">{{sumcolumn(m.items, 'step3') | number | dash}}</th>
                  <th class="text-center">{{sumcolumn(m.items, 'step3_women') | number | dash}}</th>
                  <th class="text-center">{{sumcolumn(m.items, 'step4') | number | dash}}</th>
                  <th class="text-center">{{sumcolumn(m.items, 'step4_women') | number | dash}}</th>
                  <th class="text-center">{{sumcolumn(m.items, 'step5') | number | dash}}</th>
                  <th class="text-center">{{sumcolumn(m.items, 'step5_women') | number | dash}}</th>
                  <th class="text-center">{{sumcolumn(m.items, 'step6') | number | dash}}</th>
                  <th class="text-center">{{sumcolumn(m.items, 'step6_women') | number | dash}}</th>
                </tr>

                <tr ng-repeat="item in m.items" ng-click="select(item)">
                  <td></td>
                  <td></td>
                  <td>- {{item.level}}</td>
                  <td class="text-center">{{sumrow(item, '') | number | dash}}</td>
                  <td class="text-center">{{sumrow(item, 'women') | number | dash}}</td>
                  <td class="text-center">{{item.step1 | number | dash}}</td>
                  <td class="text-center">{{item.step1_women | number | dash}}</td>
                  <td class="text-center">{{item.step2 | number | dash}}</td>
                  <td class="text-center">{{item.step2_women | number | dash}}</td>
                  <td class="text-center">{{item.step3 | number | dash}}</td>
                  <td class="text-center">{{item.step3_women | number | dash}}</td>
                  <td class="text-center">{{item.step4 | number | dash}}</td>
                  <td class="text-center">{{item.step4_women | number | dash}}</td>
                  <td class="text-center">{{item.step5 | number | dash}}</td>
                  <td class="text-center">{{item.step5_women | number | dash}}</td>
                  <td class="text-center">{{item.step6 | number | dash}}</td>
                  <td class="text-center">{{item.step6_women | number | dash}}</td>
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
                      <td class="text-center"><a href="upload/{{f.dir}}/{{f.name}}" target="_blank">{{f.original_name}}</a>
                      </td>
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

  app.controller('statOfficerSalary6Controller', function($scope, $http, $sce, $timeout) {
    $scope.url = 'index.php?r=stat-officer-salary6/';
    $scope.mode = 'read';
    $scope.model = {};
    $scope.levels = [];
    $scope.ministry = null;
    $scope.level = null;
    $scope.steps = [{
        id: 1,
        name: 'step1',
        label: 'ຂັ້ນ 1'
      },
      {
        id: 2,
        name: 'step2',
        label: 'ຂັ້ນ 2'
      },
      {
        id: 3,
        name: 'step3',
        label: 'ຂັ້ນ 3'
      },
      {
        id: 4,
        name: 'step4',
        label: 'ຂັ້ນ 4'
      },
      {
        id: 5,
        name: 'step5',
        label: 'ຂັ້ນ 5'
      },
      {
        id: 6,
        name: 'step6',
        label: 'ຂັ້ນ 6'
      },
    ];
    $scope.changemode = function() {
      $scope.mode = $scope.mode == 'read' ? 'input' : 'read';
    };

    $http.get($scope.url + 'get')
      .then(function(r) {
        $scope.years = r.data.years;
        $scope.ministries = r.data.ministries;
        $scope.levels = r.data.levels;
      }, function(r) {
        $scope.response = r;
        $timeout(function() {
          $scope.response = null;
        }, 15000);
      });

    $scope.remove = function(m) {
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
          $http.post($scope.url + 'delete', {
            'id': m.id,
            '_csrf': $('meta[name="csrf-token"]').attr("content")
          }).then(function(r) {
            $scope.enquiry();
          });
        }
      });
    };

    $scope.enquiry = function() {
      $scope.level = null;
      $scope.ministry = null;
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

    $scope.inquiry = function() {
      if ($scope.year && $scope.ministry && $scope.level)
        $http.get($scope.url + 'inquiry&ministry=' + $scope.ministry.id + '&level=' + $scope.level.id + '&year=' + $scope.year.id)
        .then(function(r) {
          $scope.select(r.data.model);
        }, function(r) {
          $scope.response = r;
          $timeout(function() {
            $scope.response = null;
          }, 15000);
        });
    };

    $scope.save = function() {
      if ($scope.year && $scope.model) {
        $scope.model.level = $scope.level.id;
        $scope.model.ministry = $scope.ministry.id;
        $http.post($scope.url + 'save&year=' + $scope.year.id, {
          'model': $scope.model,
          '_csrf': $('meta[name="csrf-token"]').attr("content")
        }).then(function(r) {
          $scope.model = null;
          $scope.response = r;
          $scope.enquiry();
          $timeout(function() {
            $scope.response = null;
          }, 15000);
        }, function(r) {
          $scope.response = r;
          $timeout(function() {
            $scope.response = null;
          }, 15000);
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

    $scope.sum = function(items, key) {
      var s = 0;
      if (key === 'women') {
        s += $scope.sumcolumn(items, 'step1_women');
        s += $scope.sumcolumn(items, 'step2_women');
        s += $scope.sumcolumn(items, 'step3_women');
        s += $scope.sumcolumn(items, 'step4_women');
        s += $scope.sumcolumn(items, 'step5_women');
        s += $scope.sumcolumn(items, 'step6_women');
      } else {
        s += $scope.sumcolumn(items, 'step1');
        s += $scope.sumcolumn(items, 'step2');
        s += $scope.sumcolumn(items, 'step3');
        s += $scope.sumcolumn(items, 'step4');
        s += $scope.sumcolumn(items, 'step5');
        s += $scope.sumcolumn(items, 'step6');
      }
      return s;
    };

    $scope.select = function(item) {
      $scope.model = item;
      $scope.model.step1 = parseInt(item.step1);
      $scope.model.step1_women = parseInt(item.step1_women);
      $scope.model.step2 = parseInt(item.step2);
      $scope.model.step2_women = parseInt(item.step2_women);
      $scope.model.step3 = parseInt(item.step3);
      $scope.model.step3_women = parseInt(item.step3_women);
      $scope.model.step4 = parseInt(item.step4);
      $scope.model.step4_women = parseInt(item.step4_women);
      $scope.model.step5 = parseInt(item.step5);
      $scope.model.step5_women = parseInt(item.step5_women);
      $scope.model.step6 = parseInt(item.step6);
      $scope.model.step6_women = parseInt(item.step6_women);
      $scope.ministry = $scope.ministries.find(function(t) {
        return t.id == item.ministry_id;
      });
      $scope.level = $scope.levels.find(function(t) {
        return t.id == item.study_level_id;
      });
    };

    $scope.sumcolumn = function(items, key) {
      var s = 0;
      if (items)
        for (var i = 0; i < items.length; i++)
          if (items[i][key])
            s += parseInt(items[i][key]);
      return s;
    };

    $scope.sumrow = function(m, key) {
      var s = 0;
      if (key == "women") {
        s += parseInt(m.step1_women);
        s += parseInt(m.step2_women);
        s += parseInt(m.step3_women);
        s += parseInt(m.step4_women);
        s += parseInt(m.step5_women);
        s += parseInt(m.step6_women);
      } else {
        s += parseInt(m.step1);
        s += parseInt(m.step2);
        s += parseInt(m.step3);
        s += parseInt(m.step4);
        s += parseInt(m.step5);
        s += parseInt(m.step6);
      }

      return s;
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
            }, function(r) {
              $scope.response = r;
              $timeout(function() {
                $scope.response = null;
              }, 15000);
            });
          }
        });
      }
    };
  });
</script>