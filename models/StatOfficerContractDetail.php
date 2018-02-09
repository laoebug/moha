<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "stat_officer_contract_detail".
 *
 * @property integer $id
 * @property integer $stat_officer_contract_id
 * @property integer $admin_approve_total
 * @property integer $admin_approve_women
 * @property integer $admin_non_total
 * @property integer $admin_non_women
 * @property integer $officer_approve_total
 * @property integer $officer_approve_women
 * @property integer $officer_non_total
 * @property integer $officer_non_women
 *
 * @property StatOfficerContract $statOfficerContract
 */
class StatOfficerContractDetail extends \yii\db\ActiveRecord
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
            [['stat_officer_contract_id'], 'required', 'required','message'=>Yii::t('app','Please enter a value for') .Yii::t('app','{attribute}')],
            [['stat_officer_contract_id', 'admin_approve_total', 'admin_approve_women', 'admin_non_total', 'admin_non_women', 'officer_approve_total', 'officer_approve_women', 'officer_non_total', 'officer_non_women'], 'integer'],
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
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getStatOfficerContract()
    {
        return $this->hasOne(StatOfficerContract::className(), ['id' => 'stat_officer_contract_id']);
    }

    /**
     * @inheritdoc
     * @return StatOfficerContractDetailQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new StatOfficerContractDetailQuery(get_called_class());
    }
}
