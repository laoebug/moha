<?php

namespace app\models;

use Yii;
use yii\db\ActiveQuery;
use yii\db\ActiveRecord;

/**
 * This is the model class for table "organisation_group".
 *
 * @property int $id
 * @property string $name
 * @property int $deleted
 * @property int $position
 *
 * @property StatOfficerAddDetail[] $statOfficerAddDetails
 * @property StatOfficerAgeDetail[] $statOfficerAgeDetails
 * @property StatOfficerContractDetail[] $statOfficerContractDetails
 * @property StatOfficerDegreeDetail[] $statOfficerDegreeDetails
 * @property StatOfficerPositionDetail[] $statOfficerPositionDetails
 * @property StatOfficerResignDetail[] $statOfficerResignDetails
 */
class OrganisationGroup extends ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'organisation_group';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['name'], 'required'],
            [['deleted', 'position'], 'integer'],
            [['name'], 'string', 'max' => 255],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'name' => Yii::t('app', 'Name'),
            'deleted' => Yii::t('app', 'Deleted'),
            'position' => Yii::t('app', 'Position'),
        ];
    }

    /**
     * @return ActiveQuery
     */
    public function getStatOfficerAddDetails()
    {
        return $this->hasMany(StatOfficerAddDetail::className(), ['organisation_group_id' => 'id']);
    }

    /**
     * @return ActiveQuery
     */
    public function getStatOfficerAgeDetails()
    {
        return $this->hasMany(StatOfficerAgeDetail::className(), ['organisation_group_id' => 'id']);
    }

    /**
     * @return ActiveQuery
     */
    public function getStatOfficerContractDetails()
    {
        return $this->hasMany(StatOfficerContractDetail::className(), ['organisation_group_id' => 'id']);
    }

    /**
     * @return ActiveQuery
     */
    public function getStatOfficerDegreeDetails()
    {
        return $this->hasMany(StatOfficerDegreeDetail::className(), ['organisation_group_id' => 'id']);
    }

    /**
     * @return ActiveQuery
     */
    public function getStatOfficerPositionDetails()
    {
        return $this->hasMany(StatOfficerPositionDetail::className(), ['organisation_group_id' => 'id']);
    }

    /**
     * @return ActiveQuery
     */
    public function getStatOfficerResignDetails()
    {
        return $this->hasMany(StatOfficerResignDetail::className(), ['organisation_group_id' => 'id']);
    }
}
