<?php

namespace app\models;

use Yii;
use yii\db\ActiveQuery;
use yii\db\ActiveRecord;

/**
 * This is the model class for table "stat_officer_contract_detail".
 *
 * @property int $id
 * @property int $stat_officer_contract_id
 * @property int $admin_approve_total
 * @property int $admin_approve_women
 * @property int $admin_non_total
 * @property int $admin_non_women
 * @property int $officer_approve_total
 * @property int $officer_approve_women
 * @property int $officer_non_total
 * @property int $officer_non_women
 * @property int $organisation_group_id
 *
 * @property OrganisationGroup $organisationGroup
 * @property StatOfficerContract $statOfficerContract
 */
class StatOfficerContractDetail extends ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'stat_officer_contract_detail';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['stat_officer_contract_id', 'organisation_group_id'], 'required'],
            [['stat_officer_contract_id', 'admin_approve_total', 'admin_approve_women', 'admin_non_total', 'admin_non_women', 'officer_approve_total', 'officer_approve_women', 'officer_non_total', 'officer_non_women', 'organisation_group_id'], 'integer'],
            [['organisation_group_id'], 'exist', 'skipOnError' => true, 'targetClass' => OrganisationGroup::className(), 'targetAttribute' => ['organisation_group_id' => 'id']],
            [['stat_officer_contract_id'], 'exist', 'skipOnError' => true, 'targetClass' => StatOfficerContract::className(), 'targetAttribute' => ['stat_officer_contract_id' => 'id']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'stat_officer_contract_id' => Yii::t('app', 'Stat Officer Contract ID'),
            'admin_approve_total' => Yii::t('app', 'Admin Approve Total'),
            'admin_approve_women' => Yii::t('app', 'Admin Approve Women'),
            'admin_non_total' => Yii::t('app', 'Admin Non Total'),
            'admin_non_women' => Yii::t('app', 'Admin Non Women'),
            'officer_approve_total' => Yii::t('app', 'Officer Approve Total'),
            'officer_approve_women' => Yii::t('app', 'Officer Approve Women'),
            'officer_non_total' => Yii::t('app', 'Officer Non Total'),
            'officer_non_women' => Yii::t('app', 'Officer Non Women'),
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
    public function getStatOfficerContract()
    {
        return $this->hasOne(StatOfficerContract::className(), ['id' => 'stat_officer_contract_id']);
    }
}
