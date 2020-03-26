<?php $_GET['menu'] = 1; ?>
<?php

/* @var $this yii\web\View */
/* @var $searchModel app\models\StatLocalAdminSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */
$this->title = "ສະຖິຕິການປົກຄອງທ້ອງຖິ່ນ";
$titles = [
    'ເຈົ້າຄອງ ນະຄອນຫຼວງ',
    'ຮອງເຈົ້າຄອງ ນະຄອນຫຼວງ',
    'ເຈົ້າແຂວງ',
    'ຮອງເຈົ້າແຂວງ',
    'ເຈົ້ານະຄອນ',
    'ຮອງເຈົ້ານະຄອນ',
    'ເຈົ້າເມືອງ',
    'ຮອງເຈົ້າເມືອງ',
    'ນາຍບ້ານ',
    'ຮອງນາຍບ້ານ',
    'ບ້ານທີ່ໄດ້ປັບປຸງ ເປັນ 5 ໜ່ວຍງານ',
];
?>
<style rel="stylesheet" href="css/angular-datepicker.css"></style>
<div class="row" ng-app="mohaApp" ng-controller="statLocalAdminController">
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
                <div class="col-sm-2">
                    <label for=""><?= Yii::t('app', 'Province') ?></label>
                    <select class="form-control" ng-model="model.province" ng-options="b.province_name for b in provinces" ng-change="inquiry()">
                    </select>
                </div>
                <div class="col-sm-10">
                    <table class="table table-bordered">
                        <tr>
                            <?php foreach ($titles as $i => $title) : if ($i === 6) break; ?>
                                <td class="text-center" colspan="2"><?= $title ?></td>
                            <?php endforeach; ?>
                        </tr>
                        <tr>
                            <?php foreach ($titles as $i => $title) : if ($i === 6) break; ?>
                                <td class="text-center" style="width: 8%"><?= Yii::t('app', 'Total') ?></td>
                                <td class="text-center" style="width: 8%"><?= Yii::t('app', 'Women') ?></td>
                            <? endforeach; ?>
                        </tr>
                        <tr>
                            <td class="text-center" ng-repeat-start="c in cols | limitTo: 6">
                                <input min="0" type="number" class="form-control" ng-model="model[c.first]">
                            </td>
                            <td class="text-center" ng-repeat-end>
                                <input ng-blur="model[c.second]=model[c.first] < model[c.second]?null:model[c.second]" min="0" max="{{model[c.first]}}" type="number" class="form-control" ng-model="model[c.second]">
                            </td>
                        </tr>
                    </table>
                </div>

                <div class="col-sm-12">
                    <table class="table table-bordered">
                        <tr>
                            <?php foreach ($titles as $i => $title) : if ($i >= 6) { ?>
                                    <td class="text-center" colspan="2"><?= $title ?></td>
                            <?php }
                            endforeach; ?>
                        </tr>
                        <tr>
                            <?php foreach ($titles as $i => $title) : if ($i >= 7) { ?>
                                    <td class="text-center" style="width: 8%"><?= Yii::t('app', 'Total') ?></td>
                                    <td class="text-center" style="width: 8%"><?= Yii::t('app', 'Women') ?></td>
                            <? }
                            endforeach; ?>
                            <td class="text-center" style="width: 8%">ປັບປຸງແລ້ວ</td>
                            <td class="text-center" style="width: 8%">ຍັງບໍ່ປັບປຸງ</td>
                        </tr>
                        <tr>
                            <td class="text-center" ng-repeat-start="c in cols | limitTo:(6 - cols.length)">
                                <input min="0" type="number" class="form-control" ng-model="model[c.first]">
                            </td>
                            <td class="text-center" ng-repeat-end>
                                <input ng-blur="model[c.second]=model[c.first] < model[c.second]?null:model[c.second]" min="0" max="{{model[c.first]}}" type="number" class="form-control" ng-model="model[c.second]">
                            </td>
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
                                    <th class="text-center" rowspan="2"><?= Yii::t('app', 'No.') ?></th>
                                    <th class="text-center" rowspan="2"><?= Yii::t('app', 'Province') ?></th>
                                    <?php foreach ($titles as $title) : ?>
                                        <th class="text-center" colspan="2"><?= $title ?></th>
                                    <?php endforeach; ?>
                                </tr>
                                <tr>
                                    <?php for ($i = 0; $i < 10; $i++) : ?>
                                        <th class="text-center"><?= Yii::t('app', 'Total') ?></th>
                                        <th class="text-center"><?= Yii::t('app', 'Women') ?></th>
                                    <?php endfor; ?>
                                    <td class="text-center">ປັບປຸງແລ້ວ</td>
                                    <td class="text-center">ຍັງບໍ່ປັບປຸງ</td>
                                </tr>
                                <tr>
                                    <th class="text-center" colspan="2"><?= Yii::t('app', 'Total') ?></th>
                                    <th class="text-center" ng-repeat-start="c in cols">{{sum(c.first) | number | dash}}
                                    </th>
                                    <th class="text-center" ng-repeat-end>{{sum(c.second) | number | dash}}</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr ng-repeat="m in models">
                                    <td class="text-center">{{$index + 1}}</td>
                                    <td>{{m.province_name}}</td>
                                    <td class="text-center" ng-repeat-start="c in cols">{{m[c.first] | number | dash}}</td>
                                    <td class="text-center" ng-repeat-end>{{m[c.second] | number | dash}}</td>
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
                                            <td class="text-center">{{(f.issued_by=='undefined')?'':f.issued_by}}</td>
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
        $scope.cols = [{
                first: 'capital_head_total',
                second: 'capital_head_women'
            },
            {
                first: 'capital_vice_total',
                second: 'capital_vice_women'
            },
            {
                first: 'province_head_total',
                second: 'province_head_women'
            },
            {
                first: 'province_vice_total',
                second: 'province_vice_women'
            },
            {
                first: 'city_head_total',
                second: 'city_head_women'
            },
            {
                first: 'city_vice_total',
                second: 'city_vice_women'
            },
            {
                first: 'district_head_total',
                second: 'district_head_women'
            },
            {
                first: 'district_vice_total',
                second: 'district_vice_women'
            },
            {
                first: 'village_head_total',
                second: 'village_head_women'
            },
            {
                first: 'village_vice_total',
                second: 'village_vice_women'
            },
            {
                first: 'village_approved',
                second: 'village_pending'
            }
        ];
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
                $http.get($scope.url + 'inquiry&province=' + $scope.model.province.id + '&year=' + $scope.year.id)
                .then(function(r) {
                    if (r.data.model) {
                        $scope.cols.forEach(function(n) {
                            $scope.model[n.first] = parseInt(r.data.model[n.first]);
                            $scope.model[n.second] = parseInt(r.data.model[n.second]);
                        });
                    } else {
                        $scope.cols.forEach(function(n) {
                            $scope.model[n.first] = null;
                            $scope.model[n.second] = null;
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
            return total === 0 ? 0 : total;
        };


        $scope.uploadedFile = function(element) {
            if (!$scope.issued_no) {
                $scope.files = null;
                Swal.fire({
                    title: 'ອັບໂຫຼດຟາຍ',
                    type: 'warning',
                    text: 'ກະລຸນາປ້ອນເລກທີ',
                });
                return;
            }
            $scope.issued_date = $('#issued_date').val();
            if (!$scope.issued_date) {
                $scope.files = null;
                Swal.fire({
                    title: 'ອັບໂຫຼດຟາຍ',
                    type: 'warning',
                    text: 'ກະລຸນາປ້ອນວັນທີ',

                });
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