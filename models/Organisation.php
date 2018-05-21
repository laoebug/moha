<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "organisation".
 *
 * @property integer $id
 * @property string $name
 * @property integer $deleted
 * @property integer $position
 *
 * @property StatDocumentDetail[] $statDocumentDetails
 * @property StatOfficerOrgDetail[] $statOfficerOrgDetails
 * @property StatOfficerOrganisationAddDetail[] $statOfficerOrganisationAddDetails
 * @property StatOfficerOrganisationTrainDetail[] $statOfficerOrganisationTrainDetails
 * @property StatOfficerOrganisationUpgradeDetail[] $statOfficerOrganisationUpgradeDetails
 */
class Organisation extends \yii\db\ActiveRecord
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
            [['name'], 'required','message'=>Yii::t('app','Please enter a value for') .Yii::t('app','{attribute}')],
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
     * @return \yii\db\ActiveQuery
     */
    public function getStatDocumentDetails()
    {
        return $this->hasMany(StatDocumentDetail::className(), ['organisation_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getStatOfficerOrgDetails()
    {
        return $this->hasMany(StatOfficerOrgDetail::className(), ['organisation_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getStatOfficerOrganisationAddDetails()
    {
        return $this->hasMany(StatOfficerOrganisationAddDetail::className(), ['organisation_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getStatOfficerOrganisationTrainDetails()
    {
        return $this->hasMany(StatOfficerOrganisationTrainDetail::className(), ['organisation_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getStatOfficerOrganisationUpgradeDetails()
    {
        return $this->hasMany(StatOfficerOrganisationUpgradeDetail::className(), ['organisation_id' => 'id']);
    }

    /**
     * @inheritdoc
     * @return OrganisationQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new OrganisationQuery(get_called_class());
    }
}
