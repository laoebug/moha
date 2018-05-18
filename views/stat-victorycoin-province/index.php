<?php $_GET['menu'] = 1; ?>
<?php

/* @var $this yii\web\View */
/* @var $searchModel app\models\StatVictorycoinProvinceSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */
// $this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'ກົມແຂ່ງຂັນ ແລະ ຍ້ອງຍໍ'), 'url' => ['index']];
$this->title = "ປະເພດຫຼຽນໄຊຕ່າງໆ ສຳລັບການຍ້ອງຍໍພາຍໃນຂອງບັນດາແຂວງ, ນະຄອນຫຼວງວຽງຈັນ";
// $this->params['breadcrumbs'][] = $this->title;
?>
<style rel="stylesheet" href="css/angular-datepicker.css"></style>
<div ng-app="mohaApp" ng-controller="statVictorycoinProvince">
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
            <div class="panel-heading" ng-click="changemode()"><i class="fa fa-{{mode=='input'?'minus':'plus'}}"></i>
                ປ້ອນຂໍ້ມູນ
            </div>
            <div class="panel-body {{mode=='input'?'':'hidden'}}">
                <div class="col-sm-3">
                    <label><?= Yii::t('app', 'Province') ?></label>
                    <select class="form-control" ng-model="model.province" ng-change="inquiry()"
                            ng-options="m.province_name for m in provinces"></select>
                </div>
                <div class="col-sm-3">
                    <label><?= Yii::t('app', 'Award') ?></label>
                    <select class="form-control" ng-model="model.award" ng-change="inquiry()"
                            ng-options="a.name for a in awards"></select>
                </div>
                <div class="col-sm-6">
                    <label><?= Yii::t('app', 'Remark') ?></label>
                    <input type="text" class="form-control" ng-model="model.remark">
                </div>
                <div class="col-sm-12" style="margin-top: 1em">
                    <table class="table table-bordered">
                        <thead>
                        <tr>
                            <?php for ($i = 0; $i < 2; $i++): ?>
                                <th class="text-center" colspan="6"><?= $labels[$i] ?></th>
                            <?php endfor; ?>
                        </tr>
                        <tr>
                            <?php
                            for ($i = 0; $i < 2; $i++)
                                foreach ($levels as $level): ?>
                                    <th class="text-center" colspan="2"><?= $level ?></th>
                                <?php endforeach; ?>
                        </tr>
                        <tr>
                            <?php for ($i = 0; $i < 12; $i++): ?>
                                <th class="text-center"><?= $i % 2 == 0 ? 'ບຸກຄົນ' : 'ກົມກອງ' ?></th>
                            <?php endfor; ?>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td><input type="number" class="form-control" ng-model="model.free1_personal" min="0"></td>
                            <td><input type="number" class="form-control" ng-model="model.free1_team" min="0"></td>
                            <td><input type="number" class="form-control" ng-model="model.free2_personal" min="0"></td>
                            <td><input type="number" class="form-control" ng-model="model.free2_team" min="0"></td>
                            <td><input type="number" class="form-control" ng-model="model.free3_personal" min="0"></td>
                            <td><input type="number" class="form-control" ng-model="model.free3_team" min="0"></td>

                            <td><input type="number" class="form-control" ng-model="model.revo1_personal" min="0"></td>
                            <td><input type="number" class="form-control" ng-model="model.revo1_team" min="0"></td>
                            <td><input type="number" class="form-control" ng-model="model.revo2_personal" min="0"></td>
                            <td><input type="number" class="form-control" ng-model="model.revo2_team" min="0"></td>
                            <td><input type="number" class="form-control" ng-model="model.revo3_personal" min="0"></td>
                            <td><input type="number" class="form-control" ng-model="model.revo3_team" min="0"></td>
                        </tr>
                        </tbody>
                    </table>
                </div>
                <div class="col-sm-12">
                    <table class="table table-bordered">
                        <thead>
                        <tr>
                            <?php for ($i = 2; $i < 4; $i++): ?>
                                <th class="text-center" colspan="6"><?= $labels[$i] ?></th>
                            <?php endfor; ?>
                        </tr>
                        <tr>
                            <?php
                            for ($i = 0; $i < 2; $i++)
                                foreach ($levels as $level): ?>
                                    <th class="text-center" colspan="2"><?= $level ?></th>
                                <?php endforeach; ?>
                        </tr>
                        <tr>
                            <?php for ($i = 0; $i < 12; $i++): ?>
                                <th class="text-center"><?= $i % 2 == 0 ? 'ບຸກຄົນ' : 'ກົມກອງ' ?></th>
                            <?php endfor; ?>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td><input type="number" class="form-control" ng-model="model.labo1_personal" min="0"></td>
                            <td><input type="number" class="form-control" ng-model="model.labo1_team" min="0"></td>
                            <td><input type="number" class="form-control" ng-model="model.labo2_personal" min="0"></td>
                            <td><input type="number" class="form-control" ng-model="model.labo2_team" min="0"></td>
                            <td><input type="number" class="form-control" ng-model="model.labo3_personal" min="0"></td>
                            <td><input type="number" class="form-control" ng-model="model.labo3_team" min="0"></td>

                            <td><input type="number" class="form-control" ng-model="model.deve1_personal" min="0"></td>
                            <td><input type="number" class="form-control" ng-model="model.deve1_team" min="0"></td>
                            <td><input type="number" class="form-control" ng-model="model.deve2_personal" min="0"></td>
                            <td><input type="number" class="form-control" ng-model="model.deve2_team" min="0"></td>
                            <td><input type="number" class="form-control" ng-model="model.deve3_personal" min="0"></td>
                            <td><input type="number" class="form-control" ng-model="model.deve3_team" min="0"></td>
                        </tr>
                        </tbody>
                    </table>
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
                                <a class="btn btn-default" target="_blank" href="{{url}}print&year={{year.id}}"><i
                                            class="fa fa-print fa-2x"></i></a>
                                <a class="btn btn-info" target="_blank" href="{{url}}download&year={{year.id}}"><i
                                            class="fa fa-download fa-2x"></i></a>
                            </p>
                        </div>
                        <table class="table table-bordered table-hover">
                            <thead>
                            <tr>
                                <th class="text-center" rowspan="4"><?= Yii::t('app', 'No.') ?></th>
                                <th class="text-center" rowspan="4" rowspan="2">ຊື່ແຂວງ</th>
                                <th class="text-center" rowspan="4" rowspan="2">ຍ້ອງຍໍຜົນງານ</th>
                                <th class="text-center" colspan="24">ປະເພດຫຼຽນໄຊ</th>
                                <th class="text-center" colspan="2" rowspan="3">ລວມ</th>
                                <th class="text-center" rowspan="4">ໝາຍເຫດ</th>
                            </tr>
                            <tr>
                                <?php foreach ($labels as $label): ?>
                                    <th class="text-center" colspan="6"><?= $label ?></th>
                                <?php endforeach; ?>
                            </tr>
                            <tr>
                                <?php
                                for ($i = 0; $i < count($labels); $i++)
                                    foreach ($levels as $level): ?>
                                        <th class="text-center" colspan="2"><?= $level ?></th>
                                    <?php endforeach; ?>
                            </tr>
                            <tr>
                                <?php for ($i = 0; $i < count($labels) * count($levels) * 2 + 2; $i++): ?>
                                    <th class="text-center"><?= $i % 2 == 0 ? 'ບຸກຄົນ' : 'ກົມກອງ' ?></th>
                                <?php endfor; ?>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <th class="text-center" colspan="3">ລວມ</th>
                                <td class="text-center">{{sumcolumn('free1_personal') | number | dash }}</td>
                                <td class="text-center">{{sumcolumn('free1_team') | number | dash }}</td>
                                <td class="text-center">{{sumcolumn('free2_personal') | number | dash }}</td>
                                <td class="text-center">{{sumcolumn('free2_team') | number | dash }}</td>
                                <td class="text-center">{{sumcolumn('free3_personal') | number | dash }}</td>
                                <td class="text-center">{{sumcolumn('free3_team') | number | dash }}</td>

                                <td class="text-center">{{sumcolumn('revo1_personal') | number | dash }}</td>
                                <td class="text-center">{{sumcolumn('revo1_team') | number | dash }}</td>
                                <td class="text-center">{{sumcolumn('revo2_personal') | number | dash }}</td>
                                <td class="text-center">{{sumcolumn('revo2_team') | number | dash }}</td>
                                <td class="text-center">{{sumcolumn('revo3_personal') | number | dash }}</td>
                                <td class="text-center">{{sumcolumn('revo3_team') | number | dash }}</td>

                                <td class="text-center">{{sumcolumn('labo1_personal') | number | dash }}</td>
                                <td class="text-center">{{sumcolumn('labo1_team') | number | dash }}</td>
                                <td class="text-center">{{sumcolumn('labo2_personal') | number | dash }}</td>
                                <td class="text-center">{{sumcolumn('labo2_team') | number | dash }}</td>
                                <td class="text-center">{{sumcolumn('labo3_personal') | number | dash }}</td>
                                <td class="text-center">{{sumcolumn('labo3_team') | number | dash }}</td>

                                <td class="text-center">{{sumcolumn('deve1_personal') | number | dash }}</td>
                                <td class="text-center">{{sumcolumn('deve1_team') | number | dash }}</td>
                                <td class="text-center">{{sumcolumn('deve2_personal') | number | dash }}</td>
                                <td class="text-center">{{sumcolumn('deve2_team') | number | dash }}</td>
                                <td class="text-center">{{sumcolumn('deve3_personal') | number | dash }}</td>
                                <td class="text-center">{{sumcolumn('deve3_team') | number | dash }}</td>

                                <td class="text-center">{{sumtotal('personal') | number | dash }}</td>
                                <td class="text-center">{{sumtotal('team') | number | dash }}</td>

                                <td class="text-center"></td>
                            </tr>
                            <tr ng-repeat="model in models" style="cursor: pointer;" ng-click="select(model)">
                                <td class="text-center">{{$index + 1}}</td>
                                <td>{{model.province.province_name?model.province.province_name:model.province}}</td>
                                <td>{{model.award.name?model.award.name:model.award}}</td>
                                <td class="text-center">{{model.free1_personal | number | dash }}</td>
                                <td class="text-center">{{model.free1_team | number | dash }}</td>
                                <td class="text-center">{{model.free2_personal | number | dash }}</td>
                                <td class="text-center">{{model.free2_team | number | dash }}</td>
                                <td class="text-center">{{model.free3_personal | number | dash }}</td>
                                <td class="text-center">{{model.free3_team | number | dash }}</td>

                                <td class="text-center">{{model.revo1_personal | number | dash }}</td>
                                <td class="text-center">{{model.revo1_team | number | dash }}</td>
                                <td class="text-center">{{model.revo2_personal | number | dash }}</td>
                                <td class="text-center">{{model.revo2_team | number | dash }}</td>
                                <td class="text-center">{{model.revo3_personal | number | dash }}</td>
                                <td class="text-center">{{model.revo3_team | number | dash }}</td>

                                <td class="text-center">{{model.labo1_personal | number | dash }}</td>
                                <td class="text-center">{{model.labo1_team | number | dash }}</td>
                                <td class="text-center">{{model.labo2_personal | number | dash }}</td>
                                <td class="text-center">{{model.labo2_team | number | dash }}</td>
                                <td class="text-center">{{model.labo3_personal | number | dash }}</td>
                                <td class="text-center">{{model.labo3_team | number | dash }}</td>

                                <td class="text-center">{{model.deve1_personal | number | dash }}</td>
                                <td class="text-center">{{model.deve1_team | number | dash }}</td>
                                <td class="text-center">{{model.deve2_personal | number | dash }}</td>
                                <td class="text-center">{{model.deve2_team | number | dash }}</td>
                                <td class="text-center">{{model.deve3_personal | number | dash }}</td>
                                <td class="text-center">{{model.deve3_team | number | dash }}</td>

                                <td class="text-center">{{sumrow(model, 'personal') | number | dash }}</td>
                                <td class="text-center">{{sumrow(model, 'team') | number | dash }}</td>

                                <td>{{model.remark}}</td>
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
  app.filter('dash', function () {
    return function (input) {
      return input ? input : '-';
    };
  });
  app.controller('statVictorycoinProvince', function ($scope, $http, $sce, $timeout) {
    $scope.url = 'index.php?r=stat-victorycoin-province/';
    $scope.mode = 'read';
    $scope.changemode = function () {
      $scope.mode = $scope.mode == 'read' ? 'input' : 'read';
    };
    $http.get($scope.url + 'get')
      .then(function (r) {
        $scope.years = r.data.years;
        $scope.provinces = r.data.provinces;
        $scope.awards = r.data.awards;
      }, function (r) {
        $scope.response = r;
        $timeout(function () {
          $scope.response = null;
        }, 15000);
      });

    $scope.enquiry = function () {
      $scope.models = null;
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
      if ($scope.model.province && $scope.model.award) {
        $http.get($scope.url + 'inquiry&year=' + $scope.year.id + '&province=' + $scope.model.province.id + '&award=' + $scope.model.award.id)
          .then(function (r) {
            if (r.data.model) {
              $scope.model.free1_personal = parseInt(r.data.model.free1_personal);
              $scope.model.free1_team = parseInt(r.data.model.free1_team);
              $scope.model.free2_personal = parseInt(r.data.model.free2_personal);
              $scope.model.free2_team = parseInt(r.data.model.free2_team);
              $scope.model.free3_personal = parseInt(r.data.model.free3_personal);
              $scope.model.free3_team = parseInt(r.data.model.free3_team);

              $scope.model.revo1_personal = parseInt(r.data.model.revo1_personal);
              $scope.model.revo1_team = parseInt(r.data.model.revo1_team);
              $scope.model.revo2_personal = parseInt(r.data.model.revo2_personal);
              $scope.model.revo2_team = parseInt(r.data.model.revo2_team);
              $scope.model.revo3_personal = parseInt(r.data.model.revo3_personal);
              $scope.model.revo3_team = parseInt(r.data.model.revo3_team);

              $scope.model.labo1_personal = parseInt(r.data.model.labo1_personal);
              $scope.model.labo1_team = parseInt(r.data.model.labo1_team);
              $scope.model.labo2_personal = parseInt(r.data.model.labo2_personal);
              $scope.model.labo2_team = parseInt(r.data.model.labo2_team);
              $scope.model.labo3_personal = parseInt(r.data.model.labo3_personal);
              $scope.model.labo3_team = parseInt(r.data.model.labo3_team);

              $scope.model.deve1_personal = parseInt(r.data.model.deve1_personal);
              $scope.model.deve1_team = parseInt(r.data.model.deve1_team);
              $scope.model.deve2_personal = parseInt(r.data.model.deve2_personal);
              $scope.model.deve2_team = parseInt(r.data.model.deve2_team);
              $scope.model.deve3_personal = parseInt(r.data.model.deve3_personal);
              $scope.model.deve3_team = parseInt(r.data.model.deve3_team);

              $scope.model.remark = r.data.model.remark;
            } else {
              $scope.model.free1_personal = null;
              $scope.model.free1_team = null;
              $scope.model.free2_personal = null;
              $scope.model.free2_team = null;
              $scope.model.free3_personal = null;
              $scope.model.free3_team = null;

              $scope.model.revo1_personal = null;
              $scope.model.revo1_team = null;
              $scope.model.revo2_personal = null;
              $scope.model.revo2_team = null;
              $scope.model.revo3_personal = null;
              $scope.model.revo3_team = null;

              $scope.model.labo1_personal = null;
              $scope.model.labo1_team = null;
              $scope.model.labo2_personal = null;
              $scope.model.labo2_team = null;
              $scope.model.labo3_personal = null;
              $scope.model.labo3_team = null;

              $scope.model.deve1_personal = null;
              $scope.model.deve1_team = null;
              $scope.model.deve2_personal = null;
              $scope.model.deve2_team = null;
              $scope.model.deve3_personal = null;
              $scope.model.deve3_team = null;

              $scope.model.remark = null;
            }
          }, function (r) {
            $scope.response = r;
            $timeout(function () {
              $scope.response = null;
            }, 15000);
          });
      }
    };

    $scope.select = function (m) {
      $scope.model = m;
      $scope.model.free1_personal = parseInt(m.free1_personal);
      $scope.model.free1_team = parseInt(m.free1_team);
      $scope.model.free2_personal = parseInt(m.free2_personal);
      $scope.model.free2_team = parseInt(m.free2_team);
      $scope.model.free3_personal = parseInt(m.free3_personal);
      $scope.model.free3_team = parseInt(m.free3_team);

      $scope.model.revo1_personal = parseInt(m.revo1_personal);
      $scope.model.revo1_team = parseInt(m.revo1_team);
      $scope.model.revo2_personal = parseInt(m.revo2_personal);
      $scope.model.revo2_team = parseInt(m.revo2_team);
      $scope.model.revo3_personal = parseInt(m.revo3_personal);
      $scope.model.revo3_team = parseInt(m.revo3_team);

      $scope.model.labo1_personal = parseInt(m.labo1_personal);
      $scope.model.labo1_team = parseInt(m.labo1_team);
      $scope.model.labo2_personal = parseInt(m.labo2_personal);
      $scope.model.labo2_team = parseInt(m.labo2_team);
      $scope.model.labo3_personal = parseInt(m.labo3_personal);
      $scope.model.labo3_team = parseInt(m.labo3_team);

      $scope.model.deve1_personal = parseInt(m.deve1_personal);
      $scope.model.deve1_team = parseInt(m.deve1_team);
      $scope.model.deve2_personal = parseInt(m.deve2_personal);
      $scope.model.deve2_team = parseInt(m.deve2_team);
      $scope.model.deve3_personal = parseInt(m.deve3_personal);
      $scope.model.deve3_team = parseInt(m.deve3_team);

      for (var i in $scope.provinces) {
        var province = $scope.provinces[i];
        if (m.province_id === province.id) {
          $scope.model.province = province;
          break;
        }
      }
      for (var i in $scope.awards) {
        var award = $scope.awards[i];
        if (m.award_id === award.id) {
          $scope.model.award = award;
          break;
        }
      }
    };

    $scope.delete = function () {
      if ($scope.model) {
        swal({
          title: "ໝັ້ນໃຈບໍ່?",
          text: "ເມື່ອລຶບແລ້ວຈະບໍ່ສາມາດເອົາຄືນມາໄດ້",
          type: "warning",
          showCancelButton: true,
          confirmButtonText: "ແມ່ນ, ລຶບ",
          cancelButtonText: "ບໍ່, ບໍ່ລຶບ",
          closeOnConfirm: true,
          closeOnCancel: true
        }, function (isConfirm) {
          if (isConfirm) {
            $http.post($scope.url + 'delete', {
              'Model': $scope.model,
              '_csrf': $('meta[name="csrf-token"]').attr("content")
            }).then(function (r) {
              $scope.model = null;
              $scope.enquiry();
            }, function (r) {
              $scope.response = r;
              $timeout(function () {
                $scope.response = null;
              }, 15000);
            });
          }
        });
      }
    };

    $scope.save = function () {
      if ($scope.year && $scope.model) {
        $http.post($scope.url + 'save&year=' + $scope.year.id, {
          'Model': $scope.model,
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
          $timeout(function () {
            $scope.response = null;
          }, 15000);
        });
      }
    };

    $scope.sumcolumn = function (key) {
      var s = 0;
      if ($scope.models)
        for (var i = 0; i < $scope.models.length; i++) {
          if ($scope.models[i][key])
            s += parseInt($scope.models[i][key]);
        }
      return s;
    };

    $scope.sumrow = function (model, key) {
      var s = 0;
//      angular.forEach(model, function(value, key))
      if (key == 'personal') {
        s += parseInt(model.free1_personal) + parseInt(model.free2_personal) + parseInt(model.free3_personal);
        s += parseInt(model.revo1_personal) + parseInt(model.revo2_personal) + parseInt(model.revo3_personal);
        s += parseInt(model.labo1_personal) + parseInt(model.labo2_personal) + parseInt(model.labo3_personal);
        s += parseInt(model.deve1_personal) + parseInt(model.deve2_personal) + parseInt(model.deve3_personal);
      }
      if (key == 'team') {
        s += parseInt(model.free1_team) + parseInt(model.free2_team) + parseInt(model.free3_team);
        s += parseInt(model.revo1_team) + parseInt(model.revo2_team) + parseInt(model.revo3_team);
        s += parseInt(model.labo1_team) + parseInt(model.labo2_team) + parseInt(model.labo3_team);
        s += parseInt(model.deve1_team) + parseInt(model.deve2_team) + parseInt(model.deve3_team);
      }
      return s;
    };

    $scope.sumtotal = function (key) {
      var s = 0;
      if (key == 'personal') {
        s += $scope.sumcolumn('free1_personal') + $scope.sumcolumn('free2_personal') + $scope.sumcolumn('free3_personal');
        s += $scope.sumcolumn('revo1_personal') + $scope.sumcolumn('revo2_personal') + $scope.sumcolumn('revo3_personal');
        s += $scope.sumcolumn('labo1_personal') + $scope.sumcolumn('labo2_personal') + $scope.sumcolumn('labo3_personal');
        s += $scope.sumcolumn('deve1_personal') + $scope.sumcolumn('deve2_personal') + $scope.sumcolumn('deve3_personal');
      }

      if (key == 'team') {
        s += $scope.sumcolumn('free1_team') + $scope.sumcolumn('free2_team') + $scope.sumcolumn('free3_team');
        s += $scope.sumcolumn('revo1_team') + $scope.sumcolumn('revo2_team') + $scope.sumcolumn('revo3_team');
        s += $scope.sumcolumn('labo1_team') + $scope.sumcolumn('labo2_team') + $scope.sumcolumn('labo3_team');
        s += $scope.sumcolumn('deve1_team') + $scope.sumcolumn('deve2_team') + $scope.sumcolumn('deve3_team');
      }
      return s;
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
        swal({
          title: "ໝັ້ນໃຈບໍ່?",
          text: "ເມື່ອລຶບແລ້ວຈະບໍ່ສາມາດເອົາຄືນມາໄດ້",
          type: "warning",
          showCancelButton: true,
          confirmButtonText: "ແມ່ນ, ລຶບ",
          cancelButtonText: "ບໍ່, ບໍ່ລຶບ",
          closeOnConfirm: true,
          closeOnCancel: true
        }, function (isConfirm) {
          if (isConfirm) {
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
        });
      }
    };
  });
</script>
