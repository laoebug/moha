<?php $_GET['menu'] = 1; ?>
<?php

/* @var $this yii\web\View */
/* @var $searchModel app\models\StatLocalAdminSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */
// $this->params['breadcrumbs'][] = ['label' => Yii::t('app', 'ກົມການປົກຄອງທ້ອງຖິ່ນ'), 'url' => ['index']];
$this->title = "ສະຖິຕິການປົກຄອງທ້ອງຖິ່ນ";
// $this->params['breadcrumbs'][] = $this->title;
?>
<style rel="stylesheet" href="css/angular-datepicker.css"></style>
<div class="row" ng-app="mohaApp" ng-controller="statLocalAdminController">

    <label class="col-sm-12"><?= Yii::t('app', 'Phiscal Year') ?></label>
    <div class="col-sm-4">
        <select class="form-control" ng-model="year" ng-change="enquiry()" ng-options="y.year for y in years"></select>
    </div>
    <!-- <div class="col-sm-8">
            <div ng-show="response" class="alert alert-{{response.status == 200? 'success':'danger'}}">
                {{response.statusText}}
            </div>
        </div> -->

    <div class="col-sm-12">
        <div class="panel panel-primary" style="margin-top: 2em" ng-show="year != null">
            <div class="panel-heading" ng-click="changemode()"><i class="fa fa-{{mode=='input'?'minus':'plus'}}"></i>
                ປ້ອນຂໍ້ມູນ
            </div>
            <div class="panel-body {{mode=='input'?'':'hidden'}}">

                <div class="col-sm-3">
                    <label for="">ຊື່ແຂວງ ແລະ ນະຄອນຫຼວງ</label>
                    <select class="form-control" ng-model="model.province" ng-options="b.province_name for b in provinces" ng-change="inquiry()">
                    </select>
                </div>
                <div class="col-sm-9">
                    <table class="table table-bordered">
                        <tr>
                            <td class="text-center" colspan="2">ເຈົ້າຄອງນະຄອນຫຼວງ</td>
                            <td class="text-center" colspan="2">ຮອງເຈົ້າຄອງນະຄອນຫຼວງ</td>
                            <td class="text-center" colspan="2">ເຈົ້າແຂວງ</td>
                            <td class="text-center" colspan="2">ຮອງເຈົ້າແຂວງ</td>                                                        
                        </tr>
                        <tr>

                            <td class="text-center" style="width: 12.5%">ລວມ</td>
                            <td class="text-center" style="width: 12.5%">ຍິງ</td>
                            <td class="text-center" style="width: 12.5%">ລວມ</td>
                            <td class="text-center" style="width: 12.5%">ຍິງ</td>
                            <td class="text-center" style="width: 12.5%">ລວມ</td>
                            <td class="text-center" style="width: 12.5%">ຍິງ</td>
                            <td class="text-center" style="width: 12.5%">ລວມ</td>
                            <td class="text-center" style="width: 12.5%">ຍິງ</td>
                            
                        </tr>
                        <tr>

                            <td class="text-center"><input min="0" type="number" class="form-control" ng-model="model.municipality_head_total"></td>
                            <td class="text-center"><input ng-blur="model.municipality_head_women=model.municipality_head_total < model.municipality_head_women?null:model.municipality_head_women" min="0" max="{{model.municipality_head_total}}" type="number" class="form-control" ng-model="model.municipality_head_women"></td>                                
                            <td class="text-center"><input min="0" type="number" class="form-control" ng-model="model.municipality_vice_total"></td>
                            <td class="text-center"><input ng-blur="model.municipality_vice_women=model.municipality_vice_total < model.municipality_vice_women?null:model.municipality_vice_women" min="0" max="{{model.municipality_vice_total}}" type="number" class="form-control" ng-model="model.municipality_vice_women"></td>
                            <td class="text-center"><input min="0" type="number" class="form-control" ng-model="model.province_head_total"></td>
                            <td class="text-center"><input ng-blur="model.province_head_women=model.province_head_total < model.province_head_women?null:model.province_head_women" min="0" max="{{model.province_head_total}}" type="number" class="form-control" ng-model="model.province_head_women"></td>
                            <td class="text-center"><input min="0" type="number" class="form-control" ng-model="model.province_vice_total"></td>
                            <td class="text-center"><input ng-blur="model.province_vice_women=model.province_vice_total < model.province_vice_women? null:model.province_vice_women" min="0" max="{{model.province_vice_total}}" type="number" class="form-control" ng-model="model.province_vice_women"></td>


                        </tr>
                    </table>
                </div>


                <div class="col-sm-12">
                    <table class="table table-bordered">
                        <tr>
                            
                            <td class="text-center" colspan="2">ເຈົ້ານະຄອນ</td>
                            <td class="text-center" colspan="2">ຮອງເຈົ້ານະຄອນ</td>
                            <td class="text-center" colspan="2">ເຈົ້າເມືອງ</td>
                            <td class="text-center" colspan="2">ຮອງເຈົ້າເມືອງ</td>
                        </tr>
                        <tr>
                            

                            <td class="text-center" style="width: 12.5%">ລວມ</td>
                            <td class="text-center" style="width: 12.5%">ຍິງ</td>
                            <td class="text-center" style="width: 12.5%">ລວມ</td>
                            <td class="text-center" style="width: 12.5%">ຍິງ</td>
                            <td class="text-center" style="width: 12.5%">ລວມ</td>
                            <td class="text-center" style="width: 12.5%">ຍິງ</td>
                            <td class="text-center" style="width: 12.5%">ລວມ</td>
                            <td class="text-center" style="width: 12.5%">ຍິງ</td>
                        </tr>
                        <tr>
                            <td class="text-center"><input min="0" type="number" class="form-control" ng-model="model.city_head_total"></td>
                            <td class="text-center"><input ng-blur="model.city_head_women=model.city_head_total < model.city_head_women?null:model.city_head_women" min="0" max="{{model.city_head_total}}" type="number" class="form-control" ng-model="model.city_head_women"></td>
                            <td class="text-center"><input min="0" type="number" class="form-control" ng-model="model.city_vice_total"></td>
                            <td class="text-center"><input ng-blur="model.city_vice_women=model.city_vice_total < model.city_vice_women? null:model.city_vice_women" min="0" max="{{model.city_vice_total}}" type="number" class="form-control" ng-model="model.city_vice_women"></td>
                            <td class="text-center"><input min="0" type="number" class="form-control" ng-model="model.district_head_total"></td>
                            <td class="text-center"><input ng-blur="model.district_head_women=model.district_head_total < model.district_head_women? null:model.district_head_women" min="0" max="{{model.district_head_total}}" type="number" class="form-control" ng-model="model.district_head_women"></td>
                            <td class="text-center"><input min="0" type="number" class="form-control" ng-model="model.district_vice_total"></td>
                            <td class="text-center"><input ng-blur="model.district_vice_women=model.district_vice_total < model.district_vice_women? null:model.district_vice_women" min="0" max="{{model.district_vice_total}}" type="number" class="form-control" ng-model="model.district_vice_women"></td>
                        </tr>
                    </table>
                </div>

                <div class="col-sm-12">
                    <table class="table table-bordered">
                        <tr>
                            <td class="text-center" colspan="2">ນາຍບ້ານ</td>
                            <td class="text-center" colspan="2">ຮອງນາຍບ້ານ</td>
                            <td class="text-center" colspan="2">ພົນລະເມືອງ</td>
                            <td class="text-center">ບ້ານ</td>
                            <td class="text-center" colspan="2">ຄອບຄົວ</td>
                        </tr>
                        <tr>
                            <td class="text-center" style="width: 12%"><?= Yii::t('app', 'Total') ?></td>
                            <td class="text-center" style="width: 12%"><?= Yii::t('app', 'Women') ?></td>
                            <td class="text-center" style="width: 12%"><?= Yii::t('app', 'Total') ?></td>
                            <td class="text-center" style="width: 12%"><?= Yii::t('app', 'Women') ?></td>
                            <td class="text-center" style="width: 12%"><?= Yii::t('app', 'Total') ?></td>
                            <td class="text-center" style="width: 12%"><?= Yii::t('app', 'Women') ?></td>
                            <td class="text-center" style="width: 12%"><?= Yii::t('app', 'Total') ?></td>
                            <td class="text-center" style="width: 8%"><?= Yii::t('app', 'Total') ?></td>
                            <td class="text-center" style="width: 8%">ທຸກຍາກ</td>
                        </tr>
                        <tr>
                            <td class="text-center">
                                <input min="0" type="number" class="form-control" ng-model="model.village_head_total">
                            </td>
                            <td class="text-center"><input ng-blur="model.village_head_women = model.village_head_total < model.village_head_women ? null : model.village_head_women" min="0" max="{{model.village_head_total}}" type="number" class="form-control" ng-model="model.village_head_women"></td>
                            <td class="text-center"><input min="0" type="number" class="form-control" ng-model="model.village_vice_total"></td>
                            <td class="text-center"><input ng-blur="model.village_vice_women = model.village_vice_total < model.village_vice_women ? null : model.village_vice_women" min="0" max="{{model.village_vice_total}}" type="number" class="form-control" ng-model="model.village_vice_women"></td>

                            <td class="text-center"><input min="0" type="number" class="form-control" ng-model="model.population_total"></td>
                            <td class="text-center"><input type="number" class="form-control" ng-model="model.population_women"></td>

                            <td class="text-center"><input min="0" type="number" class="form-control" ng-model="model.village"></td>
                            <td class="text-center"><input min="0" type="number" class="form-control" ng-model="model.family_total"></td>
                            <td class="text-center"><input ng-blur="model.family_poor = model.family_total < model.family_poor ? null : model.family_poor" min="0" max="{{model.family_total}}" type="number" class="form-control" ng-model="model.family_poor"></td>
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
                <li><a href="#reference" data-toggle="tab">ເອກະສານອ້າງອີງ</a></li>
            </ul>
            <div class="tab-content" id="myTabContent">
                <div class="tab-pane fade active in" id="table">
                    <div class="card" style="overflow-x: scroll">
                        <div class="card-title-w-btn ">
                            <h3>ສະຖິຕິການປົກຄອງທ້ອງຖິ່ນປະຈໍາປີ {{year.year}}</h3>
                            <p>
                                <a class="btn btn-default" target="_blank" href="{{url}}print&year={{year.id}}"><i class="fa fa-print fa-2x"></i></a>
                                <a class="btn btn-info" target="_blank" href="{{url}}download&year={{year.id}}"><i class="fa fa-download fa-2x"></i></a>
                            </p>
                        </div>
                        <table class="table table-bordered table-hover" ng-show="models">
                            <thead>
                                <tr>
                                    <th class="text-center" rowspan="2">ລ/ດ</th>
                                    <th class="text-center" rowspan="2">ຊື່ແຂວງ ແລະ ນະຄອນຫຼວງ</th>

                                    <th class="text-center" colspan="2">ເຈົ້າຄອງນະຄອນຫຼວງ</th>
                                    <th class="text-center" colspan="2">ຮອງເຈົ້າຄອງນະຄອນຫຼວງ</th>
                                    <th class="text-center" colspan="2">ເຈົ້າແຂວງ</th>
                                    <th class="text-center" colspan="2">ຮອງເຈົ້າແຂວງ</th>
                                    <th class="text-center" colspan="2">ເຈົ້ານະຄອນ</th>
                                    <th class="text-center" colspan="2">ຮອງເຈົ້ານະຄອນ</th>
                                    <th class="text-center" colspan="2">ເຈົ້າເມືອງ</th>
                                    <th class="text-center" colspan="2">ຮອງເຈົ້າເມືອງ</th>
                                    <th class="text-center" colspan="2">ນາຍບ້ານ</th>
                                    <th class="text-center" colspan="2">ຮອງນາຍບ້ານ</th>
                                    <th class="text-center" colspan="2">ພົນລະເມືອງ</th>
                                    <th class="text-center">ບ້ານ</th>
                                    <th class="text-center" colspan="2">ຄອບຄົວ</th>
                                    <th class="text-center" colspan="2">ບ້ານທີ່ໄດ້ປັບປຸງເປັນ 5 ໜ່ວຍງານ</th>
                                </tr>
                                <tr>
                                    <th class="text-center">ຍິງ</th>
                                    <th class="text-center">ລວມ</th>
                                    <th class="text-center">ຍິງ</th>
                                    <th class="text-center">ລວມ</th>
                                    <th class="text-center">ຍິງ</th>
                                    <th class="text-center">ລວມ</th>
                                    <th class="text-center">ຍິງ</th>
                                    <th class="text-center">ລວມ</th>
                                    <th class="text-center">ຍິງ</th>
                                    <th class="text-center">ລວມ</th>
                                    <th class="text-center">ຍິງ</th>
                                    <th class="text-center">ລວມ</th>
                                    <th class="text-center">ຍິງ</th>
                                    <th class="text-center">ລວມ</th>
                                    <th class="text-center">ຍິງ</th>
                                    <th class="text-center">ລວມ</th>
                                    <th class="text-center">ຍິງ</th>
                                    <th class="text-center">ລວມ</th>
                                    <th class="text-center">ຍິງ</th>
                                    <th class="text-center">ລວມ</th>
                                    <th class="text-center">ຍິງ</th>
                                    <th class="text-center">ລວມ</th>
                                    <th class="text-center">ລວມ</th>
                                    <th class="text-center">ລວມ</th>
                                    <th class="text-center">ທຸກຍາກ</th>
                                    <th class="text-center">ປັບປຸງແລ້ວ</th>
                                    <th class="text-center">ຍັງບໍ່ໄດ້ປັບປຸງ</th>

                                </tr>
                                <tr>
                                    <th class="text-center" colspan="2">ລວມ</th>
                                    <th class="text-center">{{sum('municipality_head_total') | number | dash}}</th>
                                    <th class="text-center">{{sum('municipality_head_women') | number | dash}}</th>
                                    <th class="text-center">{{sum('municipality_vice_total') | number | dash}}</th>
                                    <th class="text-center">{{sum('municipality_vice_women') | number | dash}}</th>


                                    <th class="text-center">{{sum('province_head_total') | number | dash}}</th>
                                    <th class="text-center">{{sum('province_head_women') | number | dash}}</th>
                                    <th class="text-center">{{sum('province_vice_total') | number | dash}}</th>
                                    <th class="text-center">{{sum('province_vice_women') | number | dash}}</th>

                                    <th class="text-center">{{sum('city_head_total') | number | dash}}</th>
                                    <th class="text-center">{{sum('city_head_women') | number | dash}}</th>
                                    <th class="text-center">{{sum('city_vice_total') | number | dash}}</th>
                                    <th class="text-center">{{sum('city_vice_women') | number | dash}}</th>


                                    <th class="text-center">{{sum('district_head_total') | number | dash}}</th>
                                    <th class="text-center">{{sum('district_head_women') | number | dash}}</th>
                                    <th class="text-center">{{sum('district_vice_total') | number | dash}}</th>
                                    <th class="text-center">{{sum('district_vice_women') | number | dash}}</th>
                                    <th class="text-center">{{sum('village_head_total') | number | dash}}</th>
                                    <th class="text-center">{{sum('village_head_women') | number | dash}}</th>
                                    <th class="text-center">{{sum('village_vice_total') | number | dash}}</th>
                                    <th class="text-center">{{sum('village_vice_women') | number | dash}}</th>
                                    <th class="text-center">{{sum('population_total') | number | dash}}</th>
                                    <th class="text-center">{{sum('population_women') | number | dash}}</th>
                                    <th class="text-center">{{sum('village') | number | dash}}</th>
                                    <th class="text-center">{{sum('family_total') | number | dash}}</th>
                                    <th class="text-center">{{sum('family_poor') | number | dash}}</th>

                                    <th class="text-center">&nbsp;</th>
                                    <th class="text-center">&nbsp;</th>

                                </tr>
                            </thead>
                            <tbody>
                                <tr ng-repeat="m in models">
                                    <td class="text-center">{{$index + 1}}</td>
                                    <td>{{m.province_name}}</td>
                                    <td class="text-center">{{m.municipality_head_total | number | dash}}</td>
                                    <td class="text-center">{{m.municipality_head_women | number | dash}}</td>
                                    <td class="text-center">{{m.municipality_vice_total | number | dash}}</td>
                                    <td class="text-center">{{m.municipality_vice_women | number | dash}}</td>
                                    <td class="text-center">{{m.province_head_total | number | dash}}</td>
                                    <td class="text-center">{{m.province_head_women | number | dash}}</td>
                                    <td class="text-center">{{m.province_vice_total | number | dash}}</td>
                                    <td class="text-center">{{m.province_vice_women | number | dash}}</td>

                                    <td class="text-center">{{m.city_head_total | number | dash}}</td>
                                    <td class="text-center">{{m.city_head_women | number | dash}}</td>
                                    <td class="text-center">{{m.city_vice_total | number | dash}}</td>
                                    <td class="text-center">{{m.city_vice_women | number | dash}}</td>

                                    <td class="text-center">{{m.district_head_total | number | dash}}</td>
                                    <td class="text-center">{{m.district_head_women | number | dash}}</td>
                                    <td class="text-center">{{m.district_vice_total | number | dash}}</td>
                                    <td class="text-center">{{m.district_vice_women | number | dash}}</td>
                                    <td class="text-center">{{m.village_head_total | number | dash}}</td>
                                    <td class="text-center">{{m.village_head_women | number | dash}}</td>
                                    <td class="text-center">{{m.village_vice_total | number | dash}}</td>
                                    <td class="text-center">{{m.village_vice_women | number | dash}}</td>
                                    <td class="text-center">{{m.population_total | number | dash}}</td>
                                    <td class="text-center">{{m.population_women | number | dash}}</td>
                                    <td class="text-center">{{m.village | number | dash}}</td>
                                    <td class="text-center">{{m.family_total | number | dash}}</td>
                                    <td class="text-center">{{m.family_poor | number | dash}}</td>
                                    <td class="text-center">&nbsp;</td>
                                    <td class="text-center">&nbsp;</td>
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
    app.controller('statLocalAdminController', function($scope, $http, $sce, $timeout) {
        $scope.url = 'index.php?r=stat-local-admin/';
        $scope.mode = 'read';
        $scope.changemode = function() {
            $scope.mode = $scope.mode == 'read' ? 'input' : 'read';
        };
        $scope.sum = [];
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
            if ($scope.year && $scope.model.province)
                $http.get($scope.url + 'inquiry&province=' + $scope.model.province.id + '&year=' + $scope.year
                    .id)
                .then(function(r) {
                    var p = $scope.model.province;
                    if (r.data.model) {

                        $scope.model.municipality_head_total = parseInt(r.data.model.municipality_head_total);
                        $scope.model.municipality_head_women = parseInt(r.data.model.municipality_head_women);

                        $scope.model.municipality_vice_total = parseInt(r.data.model.municipality_vice_total);
                        $scope.model.municipality_vice_women = parseInt(r.data.model.municipality_vice_women);

                        $scope.model.city_head_total = parseInt(r.data.model.city_head_total);
                        $scope.model.city_head_women = parseInt(r.data.model.city_head_women);

                        $scope.model.city_vice_total = parseInt(r.data.model.city_vice_total);
                        $scope.model.city_vice_women = parseInt(r.data.model.city_vice_women);


                        $scope.model.province_head_total = parseInt(r.data.model.province_head_total);
                        $scope.model.province_head_women = parseInt(r.data.model.province_head_women);
                        $scope.model.province_vice_total = parseInt(r.data.model.province_vice_total);
                        $scope.model.province_vice_women = parseInt(r.data.model.province_vice_women);
                        $scope.model.district_head_total = parseInt(r.data.model.district_head_total);
                        $scope.model.district_head_women = parseInt(r.data.model.district_head_women);
                        $scope.model.district_vice_total = parseInt(r.data.model.district_vice_total);
                        $scope.model.district_vice_women = parseInt(r.data.model.district_vice_women);
                        $scope.model.village_head_total = parseInt(r.data.model.village_head_total);
                        $scope.model.village_head_women = parseInt(r.data.model.village_head_women);
                        $scope.model.village_vice_total = parseInt(r.data.model.village_vice_total);
                        $scope.model.village_vice_women = parseInt(r.data.model.village_vice_women);
                        $scope.model.population_total = parseInt(r.data.model.population_total);
                        $scope.model.population_women = parseInt(r.data.model.population_women);
                        $scope.model.village = parseInt(r.data.model.village);
                        $scope.model.family_total = parseInt(r.data.model.family_total);
                        $scope.model.family_poor = parseInt(r.data.model.family_poor);
                        console.log($scope.model);
                    } else {

                        $scope.model.municipality_head_total = null;
                        $scope.model.municipality_head_women = null;
                        $scope.model.municipality_vice_total = null;
                        $scope.model.municipality_vice_women = null;
                        $scope.model.city_head_total = null;
                        $scope.model.city_head_women = null;
                        $scope.model.city_vice_total = null;
                        $scope.model.city_vice_women = null;

                        $scope.model.province_head_total = null;
                        $scope.model.province_head_women = null;
                        $scope.model.province_vice_total = null;
                        $scope.model.province_vice_women = null;
                        $scope.model.district_head_total = null;
                        $scope.model.district_head_women = null;
                        $scope.model.district_vice_total = null;
                        $scope.model.district_vice_women = null;
                        $scope.model.village_head_total = null;
                        $scope.model.village_head_women = null;
                        $scope.model.village_vice_total = null;
                        $scope.model.village_vice_women = null;
                        $scope.model.population_total = null;
                        $scope.model.population_women = null;
                        $scope.model.village = null;
                        $scope.model.family_total = null;
                        $scope.model.family_poor = null;
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
                console.log($scope.model);
                $http.post($scope.url + 'save&year=' + $scope.year.id, {
                    'StatLocalAdminDetail': $scope.model,
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


                //     .success(function(data, status, headers, config) {


                //         if (data.status == 200) {
                //             Swal.fire({
                //                 position: 'top-end',
                //                 type: 'success',
                //                 title: 'ອັບໂຫລດຟາຍສໍາເລັດ',
                //                 text: r.status,
                //                 showConfirmButton: false,
                //                 timer: 3000
                //             });
                //         }

                //         $scope.getreferences();
                //         $scope.issued_date = null;
                //         $scope.issued_no = null;
                //         $scope.issued_by = null;
                //         $("input[name='image'], #issued_date").val("");
                //         $scope.status = data.status;
                //         $scope.formdata = "";
                //     }).error(function(data, status, headers, config) {

                //         Swal.fire({
                //             position: 'top-end',
                //             type: 'error',
                //             title: 'ອັບໂຫລດຟາຍບໍ່ສໍາເລັດ',
                //             text: status,
                //             showConfirmButton: false,
                //             timer: 3000
                //         });

                //         $scope.response = data;
                //         $timeout(function() {
                //             $scope.response = null;
                //         }, 15000);
                //     });

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

                            Swal.fire({
                                position: 'top-end',
                                type: 'error',
                                title: 'ການລຶບບໍ່ສໍາເລັດ',
                                text: r.status + " " + r.statusText,
                                showConfirmButton: false,
                                timer: 3000
                            });


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