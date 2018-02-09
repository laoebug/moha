<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "stat_officer_new_detail".
 *
 * @property integer $id
 * @property integer $stat_officer_new_id
 * @property integer $officer_level_id
 * @property integer $new_total
 * @property integer $ministry_total
 * @property integer $army_total
 * @property integer $soe_total
 * @property integer $quota
 * @property integer $need
 * @property integer $new_women
 * @property integer $ministry_women
 * @property integer $army_women
 * @property integer $soe_women
 *
 * @property OfficerLevel $officerLevel
 * @property StatOfficerNew $statOfficerNew
 */
class StatOfficerNewDetail extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'stat_officer_new_detail';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['stat_officer_new_id', 'officer_level_id'], 'required', 'required','message'=>Yii::t('app','Please enter a value for') .Yii::t('app','{attribute}')],
            [['stat_officer_new_id', 'officer_level_id', 'new_total', 'ministry_total', 'army_total', 'soe_total', 'quota', 'need', 'new_women', 'ministry_women', 'army_women', 'soe_women'], 'integer'],
            [['officer_level_id'], 'exist', 'skipOnError' => true, 'targetClass' => OfficerLevel::className(), 'targetAttribute' => ['officer_level_id' => 'id']],
            [['stat_officer_new_id'], 'exist', 'skipOnError' => true, 'targetClass' => StatOfficerNew::className(), 'targetAttribute' => ['stat_officer_new_id' => 'id']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'stat_officer_new_id' => Yii::t('app', 'Stat Officer New ID'),
            'officer_level_id' => Yii::t('app', 'Officer Level ID'),
            'new_total' => Yii::t('app', 'New Total'),
            'ministry_total' => Yii::t('app', 'Ministry Total'),
            'army_total' => Yii::t('app', 'Army Total'),
            'soe_total' => Yii::t('app', 'Soe Total'),
            'quota' => Yii::t('app', 'Quota'),
            'need' => Yii::t('app', 'Need'),
            'new_women' => Yii::t('app', 'New Women'),
            'ministry_women' => Yii::t('app', 'Ministry Women'),
            'army_women' => Yii::t('app', 'Army Women'),
            'soe_women' => Yii::t('app', 'Soe Women'),
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
    public function getStatOfficerNew()
    {
        return $this->hasOne(StatOfficerNew::className(), ['id' => 'stat_officer_new_id']);
    }

    /**
     * @inheritdoc
     * @return StatOfficerNewDetailQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new StatOfficerNewDetailQuery(get_called_class());
    }
}
