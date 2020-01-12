<?php

namespace app\models;

use Yii;
use yii\db\ActiveQuery;
use yii\db\ActiveRecord;

/**
 * This is the model class for table "province".
 *
 * @property int $id
 * @property string $province_code
 * @property string $province_name
 * @property string $record_status
 * @property int $input_id
 * @property string $input_dt_stamp
 * @property int $deleted
 * @property int $position
 *
 * @property Accociation[] $accociations
 * @property Approver[] $approvers
 * @property District[] $districts
 * @property Foundation[] $foundations
 * @property Stat3createDetail[] $stat3createDetails
 * @property StatDocumentDetail[] $statDocumentDetails
 * @property StatEthnicDetail[] $statEthnicDetails
 * @property StatExploreDetail[] $statExploreDetails
 * @property StatGovcoinProvinceDetail[] $statGovcoinProvinceDetails
 * @property StatGovoverseaProvinceDetail[] $statGovoverseaProvinceDetails
 * @property StatHornorcoinProvinceDetail[] $statHornorcoinProvinceDetails
 * @property StatLocalAdminDetail[] $statLocalAdminDetails
 * @property StatOfficerProvinceAddDetail[] $statOfficerProvinceAddDetails
 * @property StatOfficerProvinceDetail[] $statOfficerProvinceDetails
 * @property StatOfficerProvinceTrainDetail[] $statOfficerProvinceTrainDetails
 * @property StatOfficerProvinceUpgradeDetail[] $statOfficerProvinceUpgradeDetails
 * @property StatPopulationMovementDetail[] $statPopulationMovementDetails
 * @property StatReligionDetail[] $statReligionDetails
 * @property StatReligionPlaceDetail[] $statReligionPlaceDetails
 * @property StatReligionTeacherDetail[] $statReligionTeacherDetails
 * @property StatVictorycoinProvinceDetail[] $statVictorycoinProvinceDetails
 * @property StatVictoryoverseaProvinceDetail[] $statVictoryoverseaProvinceDetails
 * @property UserHasProvince[] $userHasProvinces
 * @property User[] $users
 */
class Province extends ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'province';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['province_code', 'province_name'], 'required'],
            [['input_id', 'deleted', 'position'], 'integer'],
            [['input_dt_stamp'], 'safe'],
            [['province_code'], 'string', 'max' => 20],
            [['province_name'], 'string', 'max' => 255],
            [['record_status'], 'string', 'max' => 1],
            [['province_name'], 'unique'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'province_code' => Yii::t('app', 'Province Code'),
            'province_name' => Yii::t('app', 'Province Name'),
            'record_status' => Yii::t('app', 'Record Status'),
            'input_id' => Yii::t('app', 'Input ID'),
            'input_dt_stamp' => Yii::t('app', 'Input Dt Stamp'),
            'deleted' => Yii::t('app', 'Deleted'),
            'position' => Yii::t('app', 'Position'),
        ];
    }

    /**
     * @return ActiveQuery
     */
    public function getAccociations()
    {
        return $this->hasMany(Accociation::className(), ['province_id' => 'id']);
    }

    /**
     * @return ActiveQuery
     */
    public function getApprovers()
    {
        return $this->hasMany(Approver::className(), ['province_id' => 'id']);
    }

    /**
     * @return ActiveQuery
     */
    public function getDistricts()
    {
        return $this->hasMany(District::className(), ['province_id' => 'id']);
    }

    /**
     * @return ActiveQuery
     */
    public function getFoundations()
    {
        return $this->hasMany(Foundation::className(), ['province_id' => 'id']);
    }

    /**
     * @return ActiveQuery
     */
    public function getStat3createDetails()
    {
        return $this->hasMany(Stat3createDetail::className(), ['province_id' => 'id']);
    }

    /**
     * @return ActiveQuery
     */
    public function getStatDocumentDetails()
    {
        return $this->hasMany(StatDocumentDetail::className(), ['province_id' => 'id']);
    }

    /**
     * @return ActiveQuery
     */
    public function getStatEthnicDetails()
    {
        return $this->hasMany(StatEthnicDetail::className(), ['province_id' => 'id']);
    }

    /**
     * @return ActiveQuery
     */
    public function getStatExploreDetails()
    {
        return $this->hasMany(StatExploreDetail::className(), ['province_id' => 'id']);
    }

    /**
     * @return ActiveQuery
     */
    public function getStatGovcoinProvinceDetails()
    {
        return $this->hasMany(StatGovcoinProvinceDetail::className(), ['province_id' => 'id']);
    }

    /**
     * @return ActiveQuery
     */
    public function getStatGovoverseaProvinceDetails()
    {
        return $this->hasMany(StatGovoverseaProvinceDetail::className(), ['province_id' => 'id']);
    }

    /**
     * @return ActiveQuery
     */
    public function getStatHornorcoinProvinceDetails()
    {
        return $this->hasMany(StatHornorcoinProvinceDetail::className(), ['province_id' => 'id']);
    }

    /**
     * @return ActiveQuery
     */
    public function getStatLocalAdminDetails()
    {
        return $this->hasMany(StatLocalAdminDetail::className(), ['province_id' => 'id']);
    }

    /**
     * @return ActiveQuery
     */
    public function getStatOfficerProvinceAddDetails()
    {
        return $this->hasMany(StatOfficerProvinceAddDetail::className(), ['province_id' => 'id']);
    }

    /**
     * @return ActiveQuery
     */
    public function getStatOfficerProvinceDetails()
    {
        return $this->hasMany(StatOfficerProvinceDetail::className(), ['province_id' => 'id']);
    }

    /**
     * @return ActiveQuery
     */
    public function getStatOfficerProvinceTrainDetails()
    {
        return $this->hasMany(StatOfficerProvinceTrainDetail::className(), ['province_id' => 'id']);
    }

    /**
     * @return ActiveQuery
     */
    public function getStatOfficerProvinceUpgradeDetails()
    {
        return $this->hasMany(StatOfficerProvinceUpgradeDetail::className(), ['province_id' => 'id']);
    }

    /**
     * @return ActiveQuery
     */
    public function getStatPopulationMovementDetails()
    {
        return $this->hasMany(StatPopulationMovementDetail::className(), ['province_id' => 'id']);
    }

    /**
     * @return ActiveQuery
     */
    public function getStatReligionDetails()
    {
        return $this->hasMany(StatReligionDetail::className(), ['province_id' => 'id']);
    }

    /**
     * @return ActiveQuery
     */
    public function getStatReligionPlaceDetails()
    {
        return $this->hasMany(StatReligionPlaceDetail::className(), ['province_id' => 'id']);
    }

    /**
     * @return ActiveQuery
     */
    public function getStatReligionTeacherDetails()
    {
        return $this->hasMany(StatReligionTeacherDetail::className(), ['province_id' => 'id']);
    }

    /**
     * @return ActiveQuery
     */
    public function getStatVictorycoinProvinceDetails()
    {
        return $this->hasMany(StatVictorycoinProvinceDetail::className(), ['province_id' => 'id']);
    }

    /**
     * @return ActiveQuery
     */
    public function getStatVictoryoverseaProvinceDetails()
    {
        return $this->hasMany(StatVictoryoverseaProvinceDetail::className(), ['province_id' => 'id']);
    }

    /**
     * @return ActiveQuery
     */
    public function getUserHasProvinces()
    {
        return $this->hasMany(UserHasProvince::className(), ['province_id' => 'id']);
    }

    /**
     * @return ActiveQuery
     */
    public function getUsers()
    {
        return $this->hasMany(User::className(), ['id' => 'user_id'])->viaTable('user_has_province', ['province_id' => 'id']);
    }
}
