<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "stat_contract_detail".
 *
 * @property integer $id
 * @property integer $stat_contract_id
 * @property integer $officer_level_id
 * @property integer $quota_manage_total
 * @property integer $quota_manage_women
 * @property integer $quota_technic_total
 * @property integer $quota_technic_women
 * @property integer $nonquota_manage_total
 * @property integer $nonquota_manage_women
 * @property integer $nonquota_technic_total
 * @property integer $nonquota_technic_women
 *
 * @property OfficerLevel $officerLevel
 * @property StatContract $statContract
 */
class StatContractDetail extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'stat_contract_detail';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['stat_contract_id', 'officer_level_id'], 'required'],
            [['stat_contract_id', 'officer_level_id', 'quota_manage_total', 'quota_manage_women', 'quota_technic_total', 'quota_technic_women', 'nonquota_manage_total', 'nonquota_manage_women', 'nonquota_technic_total', 'nonquota_technic_women'], 'integer'],
            [['officer_level_id'], 'exist', 'skipOnError' => true, 'targetClass' => OfficerLevel::className(), 'targetAttribute' => ['officer_level_id' => 'id']],
            [['stat_contract_id'], 'exist', 'skipOnError' => true, 'targetClass' => StatContract::className(), 'targetAttribute' => ['stat_contract_id' => 'id']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'stat_contract_id' => Yii::t('app', 'Stat Contract ID'),
            'officer_level_id' => Yii::t('app', 'Officer Level ID'),
            'quota_manage_total' => Yii::t('app', 'Quota Manage Total'),
            'quota_manage_women' => Yii::t('app', 'Quota Manage Women'),
            'quota_technic_total' => Yii::t('app', 'Quota Technic Total'),
            'quota_technic_women' => Yii::t('app', 'Quota Technic Women'),
            'nonquota_manage_total' => Yii::t('app', 'Nonquota Manage Total'),
            'nonquota_manage_women' => Yii::t('app', 'Nonquota Manage Women'),
            'nonquota_technic_total' => Yii::t('app', 'Nonquota Technic Total'),
            'nonquota_technic_women' => Yii::t('app', 'Nonquota Technic Women'),
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getOfficerLevel()
    {
        return $this->hasOne(OfficerLevel::className(), ['id' => 'officer_level_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getStatContract()
    {
        return $this->hasOne(StatContract::className(), ['id' => 'stat_contract_id']);
    }

    /**
     * @inheritdoc
     * @return StatContractDetailQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new StatContractDetailQuery(get_called_class());
    }
}
