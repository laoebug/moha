<?php

namespace app\models;

use Yii;
use yii\db\ActiveQuery;
use yii\db\ActiveRecord;

/**
 * This is the model class for table "organisation".
 *
 * @property int $id
 * @property string $name
 * @property int $deleted
 * @property int $position
 *
 * @property StatDocumentDetail[] $statDocumentDetails
 * @property StatOfficerOrgDetail[] $statOfficerOrgDetails
 * @property StatOfficerOrganisationAddDetail[] $statOfficerOrganisationAddDetails
 * @property StatOfficerOrganisationTrainDetail[] $statOfficerOrganisationTrainDetails
 * @property StatOfficerOrganisationUpgradeDetail[] $statOfficerOrganisationUpgradeDetails
 */
class Organisation extends ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'organisation';
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
    public function getStatDocumentDetails()
    {
        return $this->hasMany(StatDocumentDetail::className(), ['organisation_id' => 'id']);
    }

    /**
     * @return ActiveQuery
     */
    public function getStatOfficerOrgDetails()
    {
        return $this->hasMany(StatOfficerOrgDetail::className(), ['organisation_id' => 'id']);
    }

    /**
     * @return ActiveQuery
     */
    public function getStatOfficerOrganisationAddDetails()
    {
        return $this->hasMany(StatOfficerOrganisationAddDetail::className(), ['organisation_id' => 'id']);
    }

    /**
     * @return ActiveQuery
     */
    public function getStatOfficerOrganisationTrainDetails()
    {
        return $this->hasMany(StatOfficerOrganisationTrainDetail::className(), ['organisation_id' => 'id']);
    }

    /**
     * @return ActiveQuery
     */
    public function getStatOfficerOrganisationUpgradeDetails()
    {
        return $this->hasMany(StatOfficerOrganisationUpgradeDetail::className(), ['organisation_id' => 'id']);
    }
}
