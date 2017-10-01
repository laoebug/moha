<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "stat_officer_add_detail".
 *
 * @property integer $id
 * @property integer $quota_total
 * @property integer $quota_women
 * @property integer $army_total
 * @property integer $army_women
 * @property integer $soe_total
 * @property integer $soe_women
 * @property integer $stat_officer_add_id
 *
 * @property StatOfficerAdd $statOfficerAdd
 */
class StatOfficerAddDetail extends \yii\db\ActiveRecord
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
            [['quota_total', 'quota_women', 'army_total', 'army_women', 'soe_total', 'soe_women', 'stat_officer_add_id'], 'integer'],
            [['stat_officer_add_id'], 'required'],
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
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getStatOfficerAdd()
    {
        return $this->hasOne(StatOfficerAdd::className(), ['id' => 'stat_officer_add_id']);
    }

    /**
     * @inheritdoc
     * @return StatOfficerAddDetailQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new StatOfficerAddDetailQuery(get_called_class());
    }
}
