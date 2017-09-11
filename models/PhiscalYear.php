<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "phiscal_year".
 *
 * @property integer $id
 * @property string $year
 * @property string $start_date
 * @property string $end_date
 * @property integer $deleted
 * @property string $status
 *
 * @property StatAssociationFoundation[] $statAssociationFoundations
 * @property StatEthnic[] $statEthnics
 * @property StatGovermentUnit[] $statGovermentUnits
 * @property StatLegal[] $statLegals
 * @property StatLocalAdmin[] $statLocalAdmins
 * @property StatOfficer[] $statOfficers
 * @property StatOfficerAdd[] $statOfficerAdds
 * @property StatOfficerAge[] $statOfficerAges
 * @property StatOfficerContract[] $statOfficerContracts
 * @property StatOfficerDegree[] $statOfficerDegrees
 * @property StatOfficerMinistry[] $statOfficerMinistries
 * @property StatOfficerNeed[] $statOfficerNeeds
 * @property StatOfficerOrg[] $statOfficerOrgs
 * @property StatOfficerPosition[] $statOfficerPositions
 * @property StatOfficerProvince[] $statOfficerProvinces
 * @property StatOfficerResign[] $statOfficerResigns
 * @property StatPopulationMovement[] $statPopulationMovements
 * @property StatReligion[] $statReligions
 * @property StatReligionPlace[] $statReligionPlaces
 * @property StatReligionTeacher[] $statReligionTeachers
 * @property StatSingleGatewayImplementation[] $statSingleGatewayImplementations
 */
class PhiscalYear extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'phiscal_year';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['year', 'start_date', 'end_date'], 'required'],
            [['start_date', 'end_date'], 'safe'],
            [['deleted'], 'integer'],
            [['year'], 'string', 'max' => 255],
            [['status'], 'string', 'max' => 1],
            [['year'], 'unique'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'year' => Yii::t('app', 'Year'),
            'start_date' => Yii::t('app', 'Start Date'),
            'end_date' => Yii::t('app', 'End Date'),
            'deleted' => Yii::t('app', 'Deleted'),
            'status' => Yii::t('app', 'Status'),
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getStatAssociationFoundations()
    {
        return $this->hasMany(StatAssociationFoundation::className(), ['phiscal_year_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getStatEthnics()
    {
        return $this->hasMany(StatEthnic::className(), ['phiscal_year_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getStatGovermentUnits()
    {
        return $this->hasMany(StatGovermentUnit::className(), ['phiscal_year_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getStatLegals()
    {
        return $this->hasMany(StatLegal::className(), ['phiscal_year_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getStatLocalAdmins()
    {
        return $this->hasMany(StatLocalAdmin::className(), ['phiscal_year_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getStatOfficers()
    {
        return $this->hasMany(StatOfficer::className(), ['phiscal_year_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getStatOfficerAdds()
    {
        return $this->hasMany(StatOfficerAdd::className(), ['phiscal_year_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getStatOfficerAges()
    {
        return $this->hasMany(StatOfficerAge::className(), ['phiscal_year_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getStatOfficerContracts()
    {
        return $this->hasMany(StatOfficerContract::className(), ['phiscal_year_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getStatOfficerDegrees()
    {
        return $this->hasMany(StatOfficerDegree::className(), ['phiscal_year_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getStatOfficerMinistries()
    {
        return $this->hasMany(StatOfficerMinistry::className(), ['phiscal_year_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getStatOfficerNeeds()
    {
        return $this->hasMany(StatOfficerNeed::className(), ['phiscal_year_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getStatOfficerOrgs()
    {
        return $this->hasMany(StatOfficerOrg::className(), ['phiscal_year_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getStatOfficerPositions()
    {
        return $this->hasMany(StatOfficerPosition::className(), ['phiscal_year_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getStatOfficerProvinces()
    {
        return $this->hasMany(StatOfficerProvince::className(), ['phiscal_year_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getStatOfficerResigns()
    {
        return $this->hasMany(StatOfficerResign::className(), ['phiscal_year_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getStatPopulationMovements()
    {
        return $this->hasMany(StatPopulationMovement::className(), ['phiscal_year_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getStatReligions()
    {
        return $this->hasMany(StatReligion::className(), ['phiscal_year_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getStatReligionPlaces()
    {
        return $this->hasMany(StatReligionPlace::className(), ['phiscal_year_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getStatReligionTeachers()
    {
        return $this->hasMany(StatReligionTeacher::className(), ['phiscal_year_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getStatSingleGatewayImplementations()
    {
        return $this->hasMany(StatSingleGatewayImplementation::className(), ['phiscal_year_id' => 'id']);
    }

    /**
     * @inheritdoc
     * @return PhiscalYearQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new PhiscalYearQuery(get_called_class());
    }
}
