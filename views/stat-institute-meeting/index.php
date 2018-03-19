<?php $_GET['menu']=1;?>
<?php

/* @var $this yii\web\View */
/* @var $searchModel app\models\StatInstituteMeetingSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */
// $this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'ສະຖາບັນຄົ້ນຄວ້າວິທະຍາສາດການປົກຄອງ ແລະ ຝຶກອົບຮົມ'), 'url' => ['index']];
$this->title = "ສະຖິຕິສັງລວມສະຖາບັນຈັດກອງປະຊຸມ ແລະ ຝຶກອົບຮົມໃຫ້ບັນດາກະຊວງ ອົງການຂັ້ນສູນກາງ ແລະ ທ້ອງຖິ່ນ";
// $this->params['breadcrumbs'][] = $this->title;
?>
<style rel="stylesheet" href="css/angular-datepicker.css"></style>
<div class="row" ng-app="mohaApp" ng-controller="statInstituteMeetingController">
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
        <div class="panel panel-primary" style="margin-top: 2em" ng-show="year">
            <div class="panel-heading" ng-click="changemode()"><i class="fa fa-{{mode=='input'?'minus':'plus'}}"></i> ປ້ອນຂໍ້ມູນ
            </div>
            <div class="panel-body {{mode=='input'?'':'hidden'}}">
                <div class="col-sm-12">
                    <label for="">ຫົວຂໍ້ຈັດຝຶກອົບຮົມ</label>
                    <input type="text" class="form-control" ng-model="model.title">
                </div>
                <div class="col-sm-2">
                    <label for=""><?= Yii::t('app', 'Total') ?></label>
                    <input type="number" min="0" class="form-control" ng-model="model.total">
                </div>
                <div class="col-sm-2">
                    <label for=""><?= Yii::t('app', 'Women') ?></label>
                    <input type="number" min="0" max="{{model.total}}" class="form-control" ng-model="model.women">
                </div>
                <div class="col-sm-3">
                    <label for=""><?= Yii::t('app', 'Start Date') ?></label>
                    <input id="start_date" class="form-control datepicker" data-ng-model="$parent.model.start_date"
                           type="text">
                </div>
                <div class="col-sm-3">
                    <label for=""><?= Yii::t('app', 'End Date') ?></label>
                    <input id="end_date" class="form-control datepicker" data-ng-model="$parent.model.end_date"
                           type="text">
                </div>
                <div class="col-sm-2">
                    <label for="">ຈຳນວນຄັ້ງ</label>
                    <input type="number" min="0" class="form-control" ng-model="model.times">
                </div>
                <div class="col-sm-12">
                    <label for="">ສະຖານທີ່</label>
                    <input type="text" class="form-control" ng-model="model.place">
                </div>
                <div class="col-sm-2" style="margin-top: 1em">
                    <button type="button" class="btn btn-info col-sm-12" ng-click="create()">
                        <i class="fa fa-plus"></i> <?= Yii::t('app', 'New') ?>
                    </button>
                </div>
                <div class="col-sm-2" style="margin-top: 1em">
                    <button type="button" class="btn btn-primary col-sm-12" ng-click="save()">
                        <i class="fa fa-save"></i> <?= Yii::t('app', 'Save') ?>
                    </button>
                </div>
                <div class="col-sm-2" style="margin-top: 1em" ng-if="model">
                    <button type="button" class="btn btn-danger col-sm-12" ng-click="delete()">
                        <i class="fa fa-trash"></i> <?= Yii::t('app', 'Delete') ?>
                    </button>
                </div>
            </div>
        </div>
    </div>
    <div ng-show="models" class="col-sm-12" style="margin-top: 2em">
        <div class="bs-component card">
            <ul class="nav nav-tabs">
                <li class="active"><a href="#table" data-toggle="tab">ຕາຕະລາງ</a></li>
                <li><a href="#reference" data-toggle="tab">ເອກະສານອ້າງອີງ</a></li>
            </ul>
            <div class="tab-content" id="myTabContent">
                <div class="tab-pane fade active in" id="table">
                    <div class="card">
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
                                <th class="text-center" rowspan="2">ຫົວຂໍ້ຈັດເຝຶກອົບຮົມ</th>
                                <th class="text-center" colspan="2">ຈຳນວນ ຜູ້ເຂົ້າຮວມ</th>
                                <th class="text-center" rowspan="2">ວັນ ເດືອນ ປີ</th>
                                <th class="text-center" rowspan="2">ຈຳນວນຄັ້ງ</th>
                                <th class="text-center" rowspan="2">ສະຖານທີ່</th>
                            </tr>
                            <tr>
                                <th class="text-center"><?= Yii::t('app', 'T') ?></th>
                                <th class="text-center"><?= Yii::t('app', 'W') ?></th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr ng-repeat="m in models" ng-click="select(m)">
                                <td class="text-center">{{$index + 1}}</td>
                                <td>{{m.title}}</td>
                                <td class="text-center">{{m.total | number | dash}}</td>
                                <td class="text-center">{{m.women | number | dash}}</td>
                                <td class="text-center">{{m.start_date}} - {{m.end_date}}</td>
                                <td class="text-center">{{m.times | number | dash}}</td>
                                <td class="text-center">{{m.place}}</td>
                            </tr>
                            </tbody>
                            <tfoot>
                            <tr>
                                <th class="text-center" colspan="2"><?= Yii::t('app', 'Total') ?></th>
                                <th class="text-center">{{sum('total')}}</th>
                                <th class="text-center">{{sum('women')}}</th>
                                <td></td>
                                <td class="text-center">{{sum('times')}}</td>
                                <td></td>
                            </tr>
                            </tfoot>
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
  app.controller('statInstituteMeetingController', function ($scope, $http, $sce, $timeout) {
    $scope.url = 'index.php?r=stat-institute-meeting/';
    $scope.mode = 'read';
    $scope.changemode = function () {
      $scope.mode = $scope.mode == 'read' ? 'input' : 'read';
    };
    $http.get($scope.url + 'get')
      .then(function (r) {
        $scope.years = r.data.years;
      }, function (r) {
        $scope.response = r;
        $timeout(function () {
          $scope.response = null;
        }, 15000);
      });

    $scope.enquiry = function () {
      if ($scope.year)
        $http.get($scope.url + 'enquiry&year=' + $scope.year.id)
          .then(function (r) {
            $scope.models = r.data.models;
            $scope.getreferences();
          }, function (r) {
            $scope.response = r;
            $timeout(function () {
              $scope.response = null;
            }, 15000);
          });
    };

    $scope.create = function () {
      if ($scope.model)
        if ($scope.model.id)
          $scope.model.id = null;

      $scope.save();
    };

    $scope.select = function (m) {
      $scope.model = m;
      if ($scope.model.total)
        $scope.model.total = parseInt($scope.model.total);
      if ($scope.model.women)
        $scope.model.women = parseInt($scope.model.women);
      if ($scope.model.times)
        $scope.model.times = parseInt($scope.model.times);

      $('#start_date').val($scope.model.start_date);
      $('#end_date').val($scope.model.end_date);
    };

    $scope.save = function () {
      if ($scope.model && $scope.year) {
        $scope.model.start_date = $('#start_date').val();
        $scope.model.end_date = $('#end_date').val();
        $http.post($scope.url + 'save&year=' + $scope.year.id, {
          'Model': $scope.model,
          '_csrf': $('meta[name="csrf-token"]').attr("content")
        }).then(function (r) {
          $scope.model = null;
          $('#start_date').val(null);
          $('#end_date').val(null);
          $scope.response = r;
          $scope.enquiry();
          $timeout(function () {
            $scope.response = null;
          }, 15000);
        }, function (r) {
          $scope.model = null;
          $('#start_date').val(null);
          $('#end_date').val(null);
          $scope.response = r;
          $timeout(function () {
            $scope.response = null;
          }, 15000);
        });
      }
    };

    $scope.delete = function () {
      if ($scope.model && confirm('ທ່ານຕ້ອງການລຶບແທ້ບໍ່?')) {
        $http.post($scope.url + 'delete', {
          'Model': $scope.model,
          '_csrf': $('meta[name="csrf-token"]').attr("content")
        }).then(function (r) {
          $scope.model = null;
          $('#start_date').val(null);
          $('#end_date').val(null);
          $scope.enquiry();
        }, function (r) {
          $scope.model = null;
          $('#start_date').val(null);
          $('#end_date').val(null);
          $scope.response = r;
          $timeout(function () {
            $scope.response = null;
          }, 15000);
        });
      }
    };

    $scope.sum = function (key) {
      var s = 0;
      if ($scope.models)
        for (var i = 0; i < $scope.models.length; i++)
          if ($scope.models[i][key])
            s += parseInt($scope.models[i][key]);
      return $scope.formatNumber(s);
    };

    $scope.formatNumber = function (num, dec) {
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