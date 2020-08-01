<?php $_GET['menu'] = 1; ?>
<?php

/* @var $this yii\web\View */
$this->title = "ການເກັບກຳສະຖິຕິເໜັງຕີງຂອງພົນລະເມືອງທົ່ວປະເທດ ປະຈຳປີ";
?>
<style rel="stylesheet" href="css/angular-datepicker.css"></style>
<div class="row" ng-app="mohaApp" ng-controller="statPeopleMoveController">

    <label class="col-sm-12"><?= Yii::t('app', 'Phiscal Year') ?></label>
    <div class="col-sm-4">
        <select class="form-control" ng-model="year" ng-change="enquiry()" ng-options="y.year for y in years"></select>
    </div>
    <div class="col-sm-12">
        <div class="panel panel-primary" style="margin-top: 2em" ng-show="year != null">
            <div class="panel-heading" ng-click="changemode()"><i class="fa fa-{{mode=='input'?'minus':'plus'}}"></i>
                ປ້ອນຂໍ້ມູນ
            </div>
            <div class="panel-body {{mode=='input'?'':'hidden'}}">
                <div class="col-sm-12">
                    <table class="table table-bordered" style="width: 100%">
                        <tr>
                            <td class="text-center" rowspan="2">ແຂວງ</td>
                            <td class="text-center" rowspan="2">ຈຳນວນເມືອງ</td>
                            <td class="text-center" rowspan="2">ຈຳນວນບ້ານ</td>
                            <td class="text-center" rowspan="2">ຈຳນວນຄອບຄົວ</td>
                            <td class="text-center" colspan="2">ຈຳນວນພົນລະເມືອງ ຍົກມາ</td>
                            <td class="text-center" colspan="2">ຈຳນວນເກີດ</td>
                            <td class="text-center" rowspan="2">ແຕ່ງດອງ ລາວ-ລາວ</td>
                            <td class="text-center" rowspan="2">ແຕ່ງດອງ ລາວ-ຕ່າງປະເທດ</td>
                            <td class="text-center" rowspan="2">ຢ່າຮ້າງ ລາວ-ລາວ</td>
                            <td class="text-center" rowspan="2">ຢ່າຮ້າງ ລາວ-ຕ່າງປະເທດ</td>
                        </tr>
                        <tr>
                            <?php for ($i = 0; $i < 2; $i++) : ?>
                                <td class="text-center">ລ</td>
                                <td class="text-center">ຍ</td>
                            <?php endfor; ?>
                        </tr>
                        <tr>
                            <td>
                                <select class="form-control" ng-model="model.province" ng-change="inquiry()" ng-options="y.province_name for y in provinces"></select>
                            </td>
                            <td class="text-center" style="width: 8%"><input ng-model="model.total_district" min="0" type="number" class="form-control"></td>
                            <td class="text-center" style="width: 8%"><input ng-model="model.total_village" min="{{model.total_district}}" type="number" class="form-control"></td>
                            <td class="text-center" style="width: 8%"><input ng-model="model.total_family" min="{{model.total_village}}" type="number" class="form-control"></td>
                            <td class="text-center" style="width: 8%"><input ng-model="model.movein_total" min="0" type="number" class="form-control"></td>
                            <td class="text-center" style="width: 8%"><input ng-model="model.movein_women" max="{{model.movein_total}}" type="number" class="form-control"></td>
                            <td class="text-center" style="width: 8%"><input ng-model="model.born_total" min="0" type="number" class="form-control"></td>
                            <td class="text-center" style="width: 8%"><input ng-model="model.born_women" max="{{model.born_total}}" type="number" class="form-control"></td>
                            <td class="text-center" style="width: 8%"><input ng-model="model.wedding_laolao" min="0" type="number" class="form-control"></td>
                            <td class="text-center" style="width: 8%"><input ng-model="model.wedding_laofor" min="0" type="number" class="form-control"></td>
                            <td class="text-center" style="width: 8%"><input ng-model="model.divorce_laolao" type="number" class="form-control"></td>
                            <td class="text-center" style="width: 8%"><input ng-model="model.divorce_laofor" type="number" class="form-control"></td>
                        </tr>
                    </table>
                </div>
                <div class="col-sm-12">
                    <table class="table table-bordered">
                        <tr>
                            <td class="text-center" colspan="4">ການຈົດທະບຽນສັນຊາດລາວ</td>
                            <td class="text-center" colspan="4">ການປ່ຽນຊື່ ຫຼື ນາມສະກຸນ</td>
                            <td class="text-center" colspan="6">ການຍົກຍ້າຍມາ</td>
                        </tr>
                        <tr>
                            <td class="text-center" colspan="2">ການໄດ້ສັນຊາດລາວ</td>
                            <td class="text-center" colspan="2">ການປະສັນຊາດລາວ</td>
                            <td class="text-center" colspan="2">ຊື່</td>
                            <td class="text-center" colspan="2">ນາມສະກຸນ</td>
                            <th class="text-center" colspan="2">ບ້ານ-ບ້ານ</th>
                            <th class="text-center" colspan="2">ເມືອງ-ເມືອງ</th>
                            <th class="text-center" colspan="2">ແຂວງ-ແຂວງ</th>
                        </tr>
                        <tr>
                            <?php for ($i = 0; $i < 7; $i++) : ?>
                                <td class="text-center">ລ</td>
                                <td class="text-center">ຍ</td>
                            <?php endfor; ?>
                        </tr>
                        <tr>
                            <td class="text-center" style="width: 2%"><input ng-model="model.sign_total" min="0" type="number" class="form-control"></td>
                            <td class="text-center" style="width: 2%"><input ng-model="model.sign_women" max="{{model.sign_total}}" type="number" class="form-control"></td>
                            <td class="text-center" style="width: 2%"><input ng-model="model.resign_total" min="0" type="number" class="form-control"></td>
                            <td class="text-center" style="width: 2%"><input ng-model="model.resign_women" max="{{model.resign_total}}" type="number" class="form-control"></td>

                            <td class="text-center" style="width: 2%"><input ng-model="model.changename_total" min="0" type="number" class="form-control"></td>
                            <td class="text-center" style="width: 2%"><input ng-model="model.changename_women" max="{{model.changename_total}}" type="number" class="form-control"></td>
                            <td class="text-center" style="width: 2%"><input ng-model="model.changesurname_total" min="0" type="number" class="form-control"></td>
                            <td class="text-center" style="width: 2%"><input ng-model="model.changesurname_women" max="{{model.changesurname_total}}" type="number" class="form-control"></td>

                            <td class="text-center" style="width: 2%"><input ng-model="model.movein_village_total" min="0" type="number" class="form-control"></td>
                            <td class="text-center" style="width: 2%"><input ng-model="model.movein_village_women" max="{{model.movein_village_total}}" type="number" class="form-control"></td>
                            <td class="text-center" style="width: 2%"><input ng-model="model.movein_district_total" min="0" type="number" class="form-control"></td>
                            <td class="text-center" style="width: 2%"><input ng-model="model.movein_district_women" max="{{model.movein_district_total}}" type="number" class="form-control"></td>
                            <td class="text-center" style="width: 2%"><input ng-model="model.movein_province_total" min="0" type="number" class="form-control"></td>
                            <td class="text-center" style="width: 2%"><input ng-model="model.movein_province_women" max="{{model.movein_province_women}}" type="number" class="form-control"></td>
                        </tr>
                    </table>
                </div>
                <div>
                    <table class="table table-bordered">
                        <tr>
                            <td class="text-center" colspan="6">ການຍົກຍ້າຍໄປ</td>
                            <th class="text-center" colspan="2" rowspan="2">ຈຳນວນ ເສຍຊີວິດ</th>
                            <th class="text-center" colspan="2" rowspan="2">ຈຳນວນພົນລະເມືອງ ຕົວຈິງ</th>
                        </tr>
                        <tr>
                            <th class="text-center" colspan="2">ບ້ານ-ບ້ານ</th>
                            <th class="text-center" colspan="2">ເມືອງ-ເມືອງ</th>
                            <th class="text-center" colspan="2">ແຂວງ-ແຂວງ</th>
                        </tr>
                        <tr>
                            <?php for ($i = 0; $i < 5; $i++) : ?>
                                <td class="text-center">ລ</td>
                                <td class="text-center">ຍ</td>
                            <?php endfor; ?>
                        </tr>
                        <tr>
                            <td class="text-center" style="width: 2%"><input ng-model="model.moveout_village_total" min="0" type="number" class="form-control"></td>
                            <td class="text-center" style="width: 2%"><input ng-model="model.moveout_village_women" max="{{model.moveout_village_total}}" type="number" class="form-control"></td>
                            <td class="text-center" style="width: 2%"><input ng-model="model.moveout_district_total" min="0" type="number" class="form-control"></td>
                            <td class="text-center" style="width: 2%"><input ng-model="model.moveout_district_women" max="{{model.moveout_district_total}}" type="number" class="form-control"></td>
                            <td class="text-center" style="width: 2%"><input ng-model="model.moveout_province_total" min="0" type="number" class="form-control"></td>
                            <td class="text-center" style="width: 2%"><input ng-model="model.moveout_province_women" max="{{model.moveout_province_total}}" type="number" class="form-control"></td>

                            <td class="text-center" style="width: 2%"><input ng-model="model.die_total" min="0" type="number" class="form-control"></td>
                            <td class="text-center" style="width: 2%"><input ng-model="model.die_women" max="{{model.die_total}}" type="number" class="form-control"></td>
                            <td class="text-center" style="width: 2%"><input ng-model="model.real_total" min="0" type="number" class="form-control"></td>
                            <td class="text-center" style="width: 2%"><input ng-model="model.real_women" max="{{model.real_total}}" type="number" class="form-control"></td>
                        </tr>
                    </table>
                </div>
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
                <li><a href="#chart" data-toggle="tab">ເສັ້ນສະແດງ</a></li>
                <li><a href="#reference" data-toggle="tab">ເອກະສານອ້າງອີງ</a></li>
            </ul>
            <div class="tab-content" id="myTabContent">
                <div class="tab-pane fade active in" id="table">
                    <div class="card" style="overflow-x: scroll">
                        <div class="card-title-w-btn ">
                            <h3><?= $this->title ?> {{year ? year.year : ''}}</h3>
                            <p>
                                <a class="btn btn-default" target="_blank" href="{{url}}print&year={{year.id}}"><i class="fa fa-print fa-2x"></i></a>
                                <a class="btn btn-info" target="_blank" href="{{url}}download&year={{year.id}}"><i class="fa fa-download fa-2x"></i></a>
                            </p>
                        </div>
                        <table class="table table-bordered table-hover">
                            <thead>
                                <tr>
                                    <th class="text-center" rowspan="3">ລຳດັບ</th>
                                    <th class="text-center" rowspan="3">ແຂວງ</th>
                                    <th class="text-center" colspan="3" rowspan="2">ຈຳນວນ</th>
                                    <th class="text-center" colspan="2" rowspan="2">ຈຳນວນ ພົນລະເມືອງ ຍົກມາ</th>
                                    <th class="text-center" colspan="2" rowspan="2">ຈຳນວນເກີດ</th>
                                    <th class="text-center" rowspan="3">ແຕ່ງດອງ ລາວ-ລາວ</th>
                                    <th class="text-center" rowspan="3">ແຕ່ງດອງ ລາວ-ຕ່າງປະເທດ</th>
                                    <th class="text-center" rowspan="3">ຢ່າຮ້າງ ລາວ-ລາວ</th>
                                    <th class="text-center" rowspan="3">ຢ່າຮ້າງ ລາວ-ຕ່າງປະເທດ</th>
                                    <th class="text-center" colspan="4">ການຈົດທະບຽນ ສັນຊາດລາວ</th>
                                    <th class="text-center" colspan="4">ການປ່ຽນຊື່ ຫຼື ນາມສະກຸນ</th>
                                    <th class="text-center" colspan="6">ການຍົກຍ້າຍມາ</th>
                                    <th class="text-center" colspan="6">ການຍົກຍ້າຍໄປ</th>
                                    <th class="text-center" colspan="2" rowspan="2">ຈຳນວນ ເສຍຊີວິດ</th>
                                    <th class="text-center" colspan="2" rowspan="2">ຈຳນວນ ພົນລະເມືອງ ຕົວຈິງ</th>
                                </tr>
                                <tr>
                                    <th class="text-center" colspan="2">ການໄດ້ສັນຊາດລາວ</th>
                                    <th class="text-center" colspan="2">ການປະສັນຊາດລາວ</th>
                                    <th class="text-center" colspan="2">ຊື່</th>
                                    <th class="text-center" colspan="2">ນາມສະກຸນ</th>
                                    <th class="text-center" colspan="2">ບ້ານ-ບ້ານ</th>
                                    <th class="text-center" colspan="2">ເມືອງ-ເມືອງ</th>
                                    <th class="text-center" colspan="2">ແຂວງ-ແຂວງ</th>
                                    <th class="text-center" colspan="2">ບ້ານ-ບ້ານ</th>
                                    <th class="text-center" colspan="2">ເມືອງ-ເມືອງ</th>
                                    <th class="text-center" colspan="2">ແຂວງ-ແຂວງ</th>
                                </tr>
                                <tr>
                                    <th class="text-center">ເມືອງ</th>
                                    <th class="text-center">ບ້ານ</th>
                                    <th class="text-center">ຄອບຄົວ</th>
                                    <?php for ($i = 0; $i < 14; $i++) : ?>
                                        <th class="text-center">ລ</th>
                                        <th class="text-center">ຍ</th>
                                    <?php endfor; ?>
                                </tr>
                            </thead>
                            <tbody>
                                <tr ng-repeat="m in models">
                                    <td class="text-center">{{$index + 1}}</td>
                                    <td>{{m.province_name}}</td>
                                    <?php foreach ($columns as $c) : ?>
                                        <td class="text-center">{{m.<?= $c ?> | number | dash}}</td>
                                    <?php endforeach; ?>
                                </tr>
                                <tr>
                                    <th class="text-center" colspan="2"><?= Yii::t('app', 'Total') ?></th>
                                    <?php foreach ($columns as $c) : ?>
                                        <th class="text-center">{{sum('<?= $c ?>') | number | dash}}</th>
                                    <?php endforeach; ?>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="tab-pane fade" id="chart">
                    <div class="row">
                        <div class="col-sm-6">
                            <h3>ເສັ້ນສະແດງສົມທຽບການເພີ່ມຂຶ້ນ-ຫຼຸດລົງ ຂອງພົນລະເມືອງ</h3>
                            <canvas id="real" class="chart chart-bar" chart-data="stats.real.data" chart-labels="stats.real.labels" chart-series="stats.real.series"></canvas>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-sm-6">
                            <h3>ເສັ້ນສະແດງສົມທຽບຈຳນວນການເກີດ ຂອງພົນລະເມືອງ</h3>
                            <canvas id="born" class="chart chart-bar" chart-data="stats.born.data" chart-labels="stats.born.labels" chart-series="stats.born.series"></canvas>
                        </div>
                        <div class="col-sm-6">
                            <h3>ເສັ້ນສະແດງສົມທຽບຈຳນວນການຕາຍ ຂອງພົນລະເມືອງ</h3>
                            <canvas id="die" class="chart chart-bar" chart-data="stats.die.data" chart-labels="stats.die.labels" chart-series="stats.die.series"></canvas>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-sm-6">
                            <h3>ເສັ້ນສະແດງສົມທຽບການຈົດທະບຽນສັນຊາດລາວ ຂອງພົນລະເມືອງ</h3>
                            <canvas id="sign" class="chart chart-bar" chart-data="stats.sign.data" chart-labels="stats.sign.labels" chart-series="stats.sign.series"></canvas>
                        </div>
                        <div class="col-sm-6">
                            <h3>ເສັ້ນສະແດງສົມທຽບການປະສັນຊາດລາວ ຂອງພົນລະເມືອງ</h3>
                            <canvas id="resign" class="chart chart-bar" chart-data="stats.resign.data" chart-labels="stats.resign.labels" chart-series="stats.resign.series"></canvas>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-sm-6">
                            <h3>ເສັ້ນສະແດງສົມທຽບການແຕ່ງດອງ ຂອງພົນລະເມືອງ</h3>
                            <canvas id="wedding" class="chart chart-bar" chart-data="stats.wedding.data" chart-labels="stats.wedding.labels" chart-series="stats.wedding.series"></canvas>
                        </div>
                        <div class="col-sm-6">
                            <h3>ເສັ້ນສະແດງສົມທຽບການຢ່າຮ້າງ ຂອງພົນລະເມືອງ</h3>
                            <canvas id="divorce" class="chart chart-bar" chart-data="stats.divorce.data" chart-labels="stats.divorce.labels" chart-series="stats.divorce.series"></canvas>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-sm-6">
                            <h3>ເສັ້ນສະແດງສົມທຽບການປ່ຽນຊື່ ຂອງພົນລະເມືອງ</h3>
                            <canvas id="changename" class="chart chart-bar" chart-data="stats.changename.data" chart-labels="stats.changename.labels" chart-series="stats.changename.series"></canvas>
                        </div>
                        <div class="col-sm-6">
                            <h3>ເສັ້ນສະແດງສົມທຽບການປ່ຽນນາມສະກຸນ ຂອງພົນລະເມືອງ</h3>
                            <canvas id="divorce" class="chart chart-bar" chart-data="stats.changesurname.data" chart-labels="stats.changesurname.labels" chart-series="stats.changesurname.series"></canvas>
                        </div>
                    </div>

                    <!-- <div class="row">
                        <div class="col-sm-6">
                            <h3>ເສັ້ນສະແດງສົມທຽບການຍ້າຍມາ ຂອງພົນລະເມືອງ</h3>
                            <canvas id="movein" class="chart chart-bar" chart-data="stats.movein.data" chart-labels="stats.movein.labels" chart-series="stats.movein.series"></canvas>
                        </div>
                        <div class="col-sm-6">
                            <h3>ເສັ້ນສະແດງສົມທຽບການຍ້າຍໄປ ຂອງພົນລະເມືອງ</h3>
                            <canvas id="moveout" class="chart chart-bar" chart-data="stats.moveout.data" chart-labels="stats.moveout.labels" chart-series="stats.moveout.series"></canvas>
                        </div>
                    </div> -->


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
    <script type="text/javascript" src="js/sweetalert2.js"></script>
    <script type="text/javascript" src="js/Chart.js"></script>
    <script type="text/javascript" src="js/angular.js"></script>
    <script type="text/javascript" src="js/angular-chart.js"></script>
    <script type="text/javascript" src="js/moment.js"></script>
    <script type="text/javascript" src="js/datetimepicker.js"></script>
    <script type="text/javascript" src="js/datetimepicker.templates.js"></script>
    <script type="text/javascript">
        var app = angular.module('mohaApp', ['chart.js', 'ui.bootstrap.datetimepicker']);
        app.filter('dash', function() {
            return function(input) {
                return input ? input : '-';
            };
        });
        app.controller('statPeopleMoveController', function($scope, $http, $sce, $timeout) {
            $scope.url = 'index.php?r=stat-people-move/';
            $scope.mode = 'read';
            $scope.cols = [{
                    code: 'total_village',
                },
                {
                    code: 'total_family',
                },
                {
                    code: 'total_district',
                },
                {
                    code: 'movein_total',
                },
                {
                    code: 'movein_women',
                },
                {
                    code: 'born_total',
                },
                {
                    code: 'born_women',
                },
                {
                    code: 'wedding_laolao',
                },
                {
                    code: 'wedding_laofor',
                },
                {
                    code: 'divorce_laolao',
                },
                {
                    code: 'divorce_laofor',
                },
                {
                    code: 'sign_total',
                },
                {
                    code: 'sign_women',
                },
                {
                    code: 'resign_total',
                },
                {
                    code: 'resign_women',
                },

                {
                    code: 'changename_total',
                },
                {
                    code: 'changename_women',
                },
                {
                    code: 'changesurname_total',
                },
                {
                    code: 'changesurname_women',
                },

                {
                    code: 'movein_village_total',
                },
                {
                    code: 'movein_village_women',
                },
                {
                    code: 'movein_district_total',
                },
                {
                    code: 'movein_district_women',
                },
                {
                    code: 'movein_province_total',
                },
                {
                    code: 'movein_province_women',
                },
                {
                    code: 'moveout_village_total',
                },
                {
                    code: 'moveout_village_women',
                },
                {
                    code: 'moveout_district_total',
                },
                {
                    code: 'moveout_district_women',
                },
                {
                    code: 'moveout_province_total',
                },
                {
                    code: 'moveout_province_women',
                },
                {
                    code: 'die_total',
                },
                {
                    code: 'die_women',
                },
                {
                    code: 'real_total',
                },
                {
                    code: 'real_women',
                },
            ];
            $scope.provinces = [];
            $scope.changemode = function() {
                $scope.mode = $scope.mode == 'read' ? 'input' : 'read';
            };
            $http.get($scope.url + 'get')
                .then(function(r) {
                    $scope.years = r.data.years;
                    $scope.provinces = r.data.provinces;
                }, function(r) {
                    $scope.response = r;
                    $timeout(function() {
                        $scope.response = null;
                    }, 15000);
                });

            $scope.enquiry = function() {
                $scope.model = null;
                $scope.models = null;
                $scope.stats = null;
                if ($scope.year)
                    $http.get($scope.url + 'enquiry&year=' + $scope.year.id)
                    .then(function(r) {
                        $scope.models = r.data.models;
                        $scope.stats = r.data.stats;
                        $scope.getreferences();
                    }, function(r) {
                        $scope.response = r;
                        $timeout(function() {
                            $scope.response = null;
                        }, 15000);
                    });
            };

            $scope.inquiry = function() {
                if ($scope.year && $scope.model.province)
                    $http.get($scope.url + 'inquiry&province=' + $scope.model.province.id + '&year=' + $scope.year.id)
                    .then(function(r) {
                        if (r.data.model) {
                            $scope.cols.forEach(function(c) {
                                $scope.model[c.code] = parseInt(r.data.model[c.code]);
                            });
                        } else {
                            $scope.cols.forEach(function(c) {
                                $scope.model[c.code] = null;
                            });
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

            $scope.sum = function(key) {
                var total = 0;
                if ($scope.models)
                    for (var n = 0; n < $scope.models.length; n++)
                        if ($scope.models[n][key])
                            total += parseInt($scope.models[n][key]);
                return total == 0 ? 0 : total;
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