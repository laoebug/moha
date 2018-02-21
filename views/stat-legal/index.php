<?php $_GET['menu'] = 1; ?>
<?php

/* @var $this yii\web\View */
/* @var $searchModel app\models\GovermentlevelSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */
// $this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'ກົມພັດທະນາ ແລະ ການບໍລິຫານລັດ'), 'url' => ['index']];
$this->title = "ສະຖິຕິບັນດານິຕິກຳ ຂະແໜງພາຍໃນທີ່ກຳລັງປັບປຸງ ແລະ ຮ່າງຂຶ້ນໃໝ່";
// $this->params['breadcrumbs'][] = $this->title;
?>
<style rel="stylesheet" href="css/angular-datepicker.css"></style>
<div class="row" ng-app="mohaApp" ng-controller="statLegalController">
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
        <div class="panel panel-primary" style="margin-top: 2em" ng-show="year != null">
            <div class="panel-heading" ng-click="changemode()"><i class="fa fa-{{mode=='input'?'minus':'plus'}}"></i>
                ປ້ອນຂໍ້ມູນ
            </div>
            <div class="panel-body {{mode=='input'?'':'hidden'}}">
                <div class="col-sm-4">
                    <label for="">ປະເພດນິິຕິກຳ</label>
                    <select class="form-control" ng-model="model.legalType" ng-options="b.name for b in legalTypes">
                    </select>
                </div>
                <div class="col-sm-4">
                    <label for="">ຊື່ນິຕິກຳ</label>
                    <select class="form-control" ng-model="model.legal"
                            ng-options="b.name for b in model.legalType.legals"
                            ng-change="inquiry()">
                    </select>
                </div>
                <div class="col-sm-2">
                    <label for="">&nbsp;</label>
                    <div class="animated-radio">
                        <label>
                            <input ng-model="model.new" type="radio" value="1" name="legaltype"><span
                                    class="label-text">
                                ຮ່າງຂຶ້ນໃໝ່
                            </span>
                        </label>
                    </div>
                </div>
                <div class="col-sm-2">
                    <label for="">&nbsp;</label>
                    <div class="animated-radio">
                        <label>
                            <input ng-model="model.improve" type="radio" value="1" name="legaltype"><span
                                    class="label-text">
                                ປັບປຸງ
                            </span>
                        </label>
                    </div>
                </div>
                <div class="col-sm-5">
                    <label for="">ປະກາດໃຊ້</label>
                    <input type="text" class="form-control" ng-model="model.publish">
                </div>
                <div class="col-sm-7">
                    <label for=""><?= Yii::t('app', 'Remark') ?></label>
                    <input type="text" class="form-control" ng-model="model.remark">
                </div>
                <div class="col-sm-2 col-sm-offset-5" style="margin-top: 1em">
                    <button type="button" class="btn btn-primary col-sm-12" ng-click="save()">
                        <i class="fa fa-save"></i> <?= Yii::t('app', 'Save') ?>
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
                                <a class="btn btn-default" target="_blank"
                                   href="index.php?r=stat-legal/print&year={{year.id}}"><i
                                            class="fa fa-print fa-2x"></i></a>
                                <a class="btn btn-info" target="_blank"
                                   href="index.php?r=stat-legal/download&year={{year.id}}"><i
                                            class="fa fa-download fa-2x"></i></a>
                            </p>
                        </div>
                        <table class="table table-bordered table-hover">
                            <thead>
                            <tr>
                                <th class="text-center"><?= Yii::t('app', 'No.') ?></th>
                                <th class="text-center">ຊື່ນິຕິກຳ</th>
                                <th class="text-center" style="width: 10%">ຮ່າງຂຶ້ນໃໝ່</th>
                                <th class="text-center" style="width: 10%">ປັບປຸງ</th>
                                <th class="text-center">ປະກາດໃຊ້</th>
                                <th class="text-center"><?= Yii::t('app', 'Remark') ?></th>
                            </tr>
                            </thead>
                            <tbody ng-repeat="t in models" ng-show="t.legals.length > 0">
                            <tr>
                                <th colspan="6" class="text-center">{{t.name}}</th>
                            </tr>
                            <tr ng-repeat="l in t.legals">
                                <td class="text-center">{{$index + 1}}</td>
                                <td>{{l.name}}</td>
                                <td class="text-center">{{l.new == '1' ? '1':''}}</td>
                                <td class="text-center">{{l.improve == '1' ? '1':''}}</td>
                                <td class="text-center">{{l.publish}}</td>
                                <td class="text-center">{{l.remark}}</td>
                            </tr>
                            <tr ng-show="t.legals.length > 0">
                                <th class="text-center" colspan="2"><?= Yii::t('app', 'Total') ?></th>
                                <th class="text-center">{{sum(t, 'new')}}</th>
                                <th class="text-center">{{sum(t, 'improve')}}</th>
                                <th></th>
                                <th></th>
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
                            <input id="issued_date" class="form-control datepicker" data-ng-model="$parent.issued_date"
                                   type="text">
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
  app.controller('statLegalController', function ($scope, $http, $sce, $timeout) {
    $scope.url = 'index.php?r=stat-legal/';
    $scope.sum = [];
    $scope.mode = 'read';
    $scope.changemode = function () {
      $scope.mode = $scope.mode == 'read' ? 'input' : 'read';
    };
    $http.get($scope.url + 'get')
      .then(function (r) {
        $scope.years = r.data.years;
        $scope.legalTypes = r.data.legalTypes;
      }, function (r) {
        $scope.response = r;
        $timeout(function () {
          $scope.response = null;
        }, 15000);
      });

    $scope.enquiry = function () {
      $scope.model = null;
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

    $scope.inquiry = function () {
      if ($scope.year && $scope.model.legal)
        $http.get($scope.url + 'inquiry&legal=' + $scope.model.legal.id + '&year=' + $scope.year.id)
          .then(function (r) {
            if (r.data.model) {
              $scope.model.new = r.data.model.new == "1" ? true : false;
              $scope.model.improve = r.data.model.improve == "1" ? true : false;
              $scope.model.publish = r.data.model.publish;
              $scope.model.remark = r.data.model.remark;
            } else {
              $scope.model.new = null;
              $scope.model.improve = null;
              $scope.model.publish = null;
              $scope.model.remark = null;
            }
          }, function (r) {
            $scope.response = r;
            $timeout(function () {
              $scope.response = null;
            }, 15000);
          });
    };

    $scope.save = function () {
      if ($scope.year && $scope.model) {
        $scope.model.new = $scope.model.new ? 1 : 0;
        $scope.model.improve = $scope.model.improve ? 1 : 0;
        $http.post($scope.url + 'save&year=' + $scope.year.id, {
          'StatLegalDetail': $scope.model,
          '_csrf': $('meta[name="csrf-token"]').attr("content")
        }).then(function (r) {
          $scope.model = null;
          $scope.response = r;
          $scope.enquiry();
          $timeout(function () {
            $scope.response = null;
          }, 15000);
        }, function (r) {
          $scope.response = r;
          console.log($scope.response);
          $timeout(function () {
            $scope.response = null;
          }, 15000);
        });
      }
    };

    $scope.sum = function (t, key) {
      var total = 0;
      for (var n = 0; n < t.legals.length; n++) {
        if (t.legals[n][key])
          total += parseInt(t.legals[n][key]);
      }
      return total;
    };

    $scope.getIcon = function (value) {
      if (value == '1') return '<i class="fa fa-check"></i>';
      return '';
    };

    $scope.uploadedFile = function (element) {
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

    $scope.getreferences = function () {
      if ($scope.year) {
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

    $scope.deletefile = function (f) {
      if ($scope.year && f) {
        if (confirm('ທ່ານຕ້ອງການລຶບແທ້ບໍ?'))
          $http.post($scope.url + 'deletefile&year=' + $scope.year.id, {
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