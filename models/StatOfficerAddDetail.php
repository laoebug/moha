<?php

namespace app\models;

use Yii;
use yii\db\ActiveQuery;
use yii\db\ActiveRecord;

/**
 * This is the model class for table "stat_officer_add_detail".
 *
 * @property int $id
 * @property int $quota_total
 * @property int $quota_women
 * @property int $army_total
 * @property int $army_women
 * @property int $soe_total
 * @property int $soe_women
 * @property int $stat_officer_add_id
 * @property int $organisation_group_id
 *
 * @property OrganisationGroup $organisationGroup
 * @property StatOfficerAdd $statOfficerAdd
 */
class StatOfficerAddDetail extends ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'stat_officer_add_detail';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['quota_total', 'quota_women', 'army_total', 'army_women', 'soe_total', 'soe_women', 'stat_officer_add_id', 'organisation_group_id'], 'integer'],
            [['stat_officer_add_id', 'organisation_group_id'], 'required'],
            [['organisation_group_id'], 'exist', 'skipOnError' => true, 'targetClass' => OrganisationGroup::className(), 'targetAttribute' => ['organisation_group_id' => 'id']],
            [['stat_officer_add_id'], 'exist', 'skipOnError' => true, 'targetClass' => StatOfficerAdd::className(), 'targetAttribute' => ['stat_officer_add_id' => 'id']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'quota_total' => Yii::t('app', 'Quota Total'),
            'quota_women' => Yii::t('app', 'Quota Women'),
            'army_total' => Yii::t('app', 'Army Total'),
            'army_women' => Yii::t('app', 'Army Women'),
            'soe_total' => Yii::t('app', 'Soe Total'),
            'soe_women' => Yii::t('app', 'Soe Women'),
            'stat_officer_add_id' => Yii::t('app', 'Stat Officer Add ID'),
            'organisation_group_id' => Yii::t('app', 'Organisation Group ID'),
        ];
    }

    /**
     * @return ActiveQuery
     */
    public function getOrganisationGroup()
    {
        return $this->hasOne(OrganisationGroup::className(), ['id' => 'organisation_group_id']);
    }

    /**
     * @return ActiveQuery
     */
    public function getStatOfficerAdd()
    {
        return $this->hasOne(StatOfficerAdd::className(), ['id' => 'stat_officer_add_id']);
    }
}
