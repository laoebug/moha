<?php $_GET['menu'] = 1; ?>
<?php

/* @var $this yii\web\View */
/* @var $searchModel app\models\Stat3createSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */
$this->title = "ສັງລວມຈຳນວນບ້ານເປົ້າໝາຍ 3 ສ້າງໃນການສ້າງເປັນບ້ານພັດທະນາ, ເປົ້າໝາຍເມືອງເຂັ້ມແຂງຮອບດ້ານ ແລະ ເປົ້າໝາຍສ້າງບ້ານໃຫ່ຍເປັນຕົວເມືອງໃນຊົນນະບົດ ທົ່ວປະເທດ ປະຈໍາປີ";
$titles = [
    'ບ້ານເປົ້າໝາຍ 3 ສ້າງໃນການສ້າງເປັນເບ້ານພັດທະນາ' => ['ຈ/ນ ບ້ານ', 'ບ້ານສືບຕໍ່', 'ບ້ານກໍານົດ ໃໝ່',],
    'ເປົ້າໝາຍເມືອງເຂັ້ມແຂງຮອບດ້ານ' => ['ຈ/ນ ເມືອງ', 'ເມືອງສືບຕໍ່', 'ເມືອງກໍານົດໃໝ່',],
    'ເປົ້າໝາຍສ້າງບ້ານໃຫຍ່ເປັນຕົວເມືອງໃນຊົນນະບົດ' => ['ຈ/ນ ບ້ານ/ກຸ່ມບ້ານ'],
];
?>

<style rel="stylesheet" href="css/angular-datepicker.css"></style>
<div class="row" ng-app="mohaApp" ng-controller="stat3CreateController">
    <div class="col-sm-12">
        <label class="col-sm-12"><?= Yii::t('app', 'Phiscal Year') ?></label>
        <div class="col-sm-4">
            <select class="form-control" ng-model="year" ng-change="enquiry()" ng-options="y.year for y in years"></select>
        </div>
        <!-- <div class="col-sm-8">
            <div ng-show="response" class="alert alert-{{response.status == 200? 'success':'danger'}}">
                {{response.statusText}}
            </div>
        </div> -->
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
                            <?php foreach ($titles as $i => $title) : ?>
                                <td class="text-center" colspan="<?= count($title) ?>"><?= $i ?></td>
                            <?php endforeach; ?>
                        </tr>
                        <tr>
                            <?php foreach ($titles as $i => $title) : ?>
                                <?php foreach ($title as $j => $t) : ?>
                                    <td class="text-center" style="width: 10%">
                                        <?= $t ?>
                                    </td>
                                <?php endforeach; ?>
                            <?php endforeach; ?>
                        </tr>
                        <tr>
                            <td class="text-center" ng-repeat-start="c in cols">
                                <input min="0" type="number" class="form-control" ng-model="model[c.first]">
                            </td>
                            <td class="text-center" ng-if="c.second">
                                <input ng-blur="model[c.second]=model[c.first] < model[c.second]?null:model[c.second]" min="0" max="{{model[c.first]}}" type="number" class="form-control" ng-model="model[c.second]">
                            </td>
                            <td class="text-center" ng-if="c.third" ng-repeat-end>
                                <input ng-blur="model[c.third]=model[c.first] < model[c.third]?null:model[c.third]" min="0" max="{{model[c.first]}}" type="number" class="form-control" ng-model="model[c.third]">
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
                            <h3><?= $this->title ?> {{year.year}}</h3>
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
                                    <?php foreach ($titles as $i => $title) : ?>
                                        <th class="text-center" colspan="<?= count($title) ?>"><?= $i ?></th>
                                    <?php endforeach; ?>
                                </tr>
                                <tr>
                                    <?php foreach ($titles as $i => $title) : ?>
                                        <?php foreach ($title as $j => $t) : ?>
                                            <th style="width: 10%" class="text-center"><?= $t ?></th>
                                        <?php endforeach; ?>
                                    <?php endforeach; ?>
                                </tr>
                            </thead>
                            <tbody>
                                <tr ng-repeat="m in models">
                                    <td class="text-center">{{$index + 1}}</td>
                                    <td>{{m.province_name}}</td>
                                    <td class="text-center" ng-repeat-start="c in cols">{{m[c.first] | number | dash}}</td>
                                    <td class="text-center" ng-if="c.second">{{m[c.second] | number | dash}}</td>
                                    <td class="text-center" ng-if="c.third" ng-repeat-end>{{m[c.third] | number | dash}}
                                    </td>
                                </tr>
                            </tbody>
                            <tfoot>
                                <tr>
                                    <th class="text-center" colspan="2"><?= Yii::t('app', 'Total') ?></th>
                                    <th class="text-center" ng-repeat-start="c in cols">{{sum(c.first) | number | dash}}
                                    </th>
                                    <th class="text-center" ng-if="c.second">{{sum(c.second) | number | dash}}</th>
                                    <th class="text-center" ng-if="c.third" ng-repeat-end>{{sum(c.third) | number | dash}}
                                    </th>
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
    app.controller('stat3CreateController', function($scope, $http, $sce, $timeout) {
        $scope.url = 'index.php?r=stat3create/';
        $scope.mode = 'read';
        $scope.changemode = function() {
            $scope.mode = $scope.mode == 'read' ? 'input' : 'read';
        };
        $scope.cols = [{
                first: 'dev_total',
                second: 'dev_continue',
                third: 'dev_new'
            },
            {
                first: 'strong_total',
                second: 'strong_continue',
                third: 'strong_new'
            },
            {
                first: 'big'
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
                            $scope.model[n.third] = parseInt(r.data.model[n.third]);
                        });
                    } else {
                        $scope.cols.forEach(function(n) {
                            $scope.model[n.first] = null;
                            $scope.model[n.second] = null;
                            $scope.model[n.third] = null;
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
                    'Stat3createDetail': $scope.model,
                    '_csrf': $('meta[name="csrf-token"]').attr("content")
                }).then(function(r) {

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