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
 * @property StatGovcoinMinistry[] $statGovcoinMinistries
 * @property StatGovermentUnit[] $statGovermentUnits
 * @property StatHighcoinMinistry[] $statHighcoinMinistries
 * @property StatHighoverseaMinistry[] $statHighoverseaMinistries
 * @property StatHornorcoinProvince[] $statHornorcoinProvinces
 * @property StatInstituteMeeting[] $statInstituteMeetings
 * @property StatInstituteTrain[] $statInstituteTrains
 * @property StatLegal[] $statLegals
 * @property StatLocalAdmin[] $statLocalAdmins
 * @property StatOfficer[] $statOfficers
 * @property StatOfficerAdd[] $statOfficerAdds
 * @property StatOfficerAge[] $statOfficerAges
 * @property StatOfficerContract[] $statOfficerContracts
 * @property StatOfficerDegree[] $statOfficerDegrees
 * @property StatOfficerMinistry[] $statOfficerMinistries
 * @property StatOfficerMinistryAdd[] $statOfficerMinistryAdds
 * @property StatOfficerMinistryTrain[] $statOfficerMinistryTrains
 * @property StatOfficerMinistryUpgrade[] $statOfficerMinistryUpgrades
 * @property StatOfficerNeed[] $statOfficerNeeds
 * @property StatOfficerOrg[] $statOfficerOrgs
 * @property StatOfficerOrganisationAdd[] $statOfficerOrganisationAdds
 * @property StatOfficerOrganisationTrain[] $statOfficerOrganisationTrains
 * @property StatOfficerOrganisationUpgrade[] $statOfficerOrganisationUpgrades
 * @property StatOfficerPosition[] $statOfficerPositions
 * @property StatOfficerProvince[] $statOfficerProvinces
 * @property StatOfficerProvinceAdd[] $statOfficerProvinceAdds
 * @property StatOfficerProvinceTrain[] $statOfficerProvinceTrains
 * @property StatOfficerProvinceUpgrade[] $statOfficerProvinceUpgrades
 * @property StatOfficerResign[] $statOfficerResigns
 * @property StatPopulationMovement[] $statPopulationMovements
 * @property StatReligion[] $statReligions
 * @property StatReligionPlace[] $statReligionPlaces
 * @property StatReligionTeacher[] $statReligionTeachers
 * @property StatResearch[] $statResearches
 * @property StatSingleGatewayImplementation[] $statSingleGatewayImplementations
 * @property StatVictorycoinMinistry[] $statVictorycoinMinistries
 * @property StatVictorycoinProvince[] $statVictorycoinProvinces
 * @property StatVictoryoverseaMinistry[] $statVictoryoverseaMinistries
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
    public function getStatGovcoinMinistries()
    {
        return $this->hasMany(StatGovcoinMinistry::className(), ['phiscal_year_id' => 'id']);
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
    public function getStatHighcoinMinistries()
    {
        return $this->hasMany(StatHighcoinMinistry::className(), ['phiscal_year_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getStatHighoverseaMinistries()
    {
        return $this->hasMany(StatHighoverseaMinistry::className(), ['phiscal_year_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getStatHornorcoinProvinces()
    {
        return $this->hasMany(StatHornorcoinProvince::className(), ['phiscal_year_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getStatInstituteMeetings()
    {
        return $this->hasMany(StatInstituteMeeting::className(), ['phiscal_year_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getStatInstituteTrains()
    {
        return $this->hasMany(StatInstituteTrain::className(), ['phiscal_year_id' => 'id']);
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
    public function getStatOfficerMinistryAdds()
    {
        return $this->hasMany(StatOfficerMinistryAdd::className(), ['phiscal_year_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getStatOfficerMinistryTrains()
    {
        return $this->hasMany(StatOfficerMinistryTrain::className(), ['phiscal_year_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getStatOfficerMinistryUpgrades()
    {
        return $this->hasMany(StatOfficerMinistryUpgrade::className(), ['phiscal_year_id' => 'id']);
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
    public function getStatOfficerOrganisationAdds()
    {
        return $this->hasMany(StatOfficerOrganisationAdd::className(), ['phiscal_year_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getStatOfficerOrganisationTrains()
    {
        return $this->hasMany(StatOfficerOrganisationTrain::className(), ['phiscal_year_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getStatOfficerOrganisationUpgrades()
    {
        return $this->hasMany(StatOfficerOrganisationUpgrade::className(), ['phiscal_year_id' => 'id']);
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
    public function getStatOfficerProvinceAdds()
    {
        return $this->hasMany(StatOfficerProvinceAdd::className(), ['phiscal_year_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getStatOfficerProvinceTrains()
    {
        return $this->hasMany(StatOfficerProvinceTrain::className(), ['phiscal_year_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getStatOfficerProvinceUpgrades()
    {
        return $this->hasMany(StatOfficerProvinceUpgrade::className(), ['phiscal_year_id' => 'id']);
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
    public function getStatResearches()
    {
        return $this->hasMany(StatResearch::className(), ['phiscal_year_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getStatSingleGatewayImplementations()
    {
        return $this->hasMany(StatSingleGatewayImplementation::className(), ['phiscal_year_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getStatVictorycoinMinistries()
    {
        return $this->hasMany(StatVictorycoinMinistry::className(), ['phiscal_year_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getStatVictorycoinProvinces()
    {
        return $this->hasMany(StatVictorycoinProvince::className(), ['phiscal_year_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getStatVictoryoverseaMinistries()
    {
        return $this->hasMany(StatVictoryoverseaMinistry::className(), ['phiscal_year_id' => 'id']);
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
