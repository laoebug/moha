<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "stat_officer_agelevel_detail".
 *
 * @property integer $id
 * @property integer $stat_officer_agelevel_id
 * @property integer $officer_level_id
 * @property integer $total_18
 * @property integer $women_18
 * @property integer $total_20
 * @property integer $women_20
 * @property integer $total_25
 * @property integer $women_25
 * @property integer $total_30
 * @property integer $women_30
 * @property integer $total_35
 * @property integer $women_35
 * @property integer $total_40
 * @property integer $women_40
 * @property integer $total_45
 * @property integer $women_45
 * @property integer $total_50
 * @property integer $women_50
 * @property integer $total_55
 * @property integer $women_55
 * @property integer $total_60
 * @property integer $women_60
 * @property integer $total_60p
 * @property integer $women_60p
 *
 * @property OfficerLevel $officerLevel
 * @property StatOfficerAgelevel $statOfficerAgelevel
 */
class StatOfficerAgelevelDetail extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'stat_officer_agelevel_detail';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['stat_officer_agelevel_id', 'officer_level_id'], 'required','message'=>Yii::t('app','Please enter a value for') .Yii::t('app','{attribute}')],
            [['stat_officer_agelevel_id', 'officer_level_id', 'total_18', 'women_18', 'total_20', 'women_20', 'total_25', 'women_25', 'total_30', 'women_30', 'total_35', 'women_35', 'total_40', 'women_40', 'total_45', 'women_45', 'total_50', 'women_50', 'total_55', 'women_55', 'total_60', 'women_60', 'total_60p', 'women_60p'], 'integer'],
            [['officer_level_id'], 'exist', 'skipOnError' => true, 'targetClass' => OfficerLevel::className(), 'targetAttribute' => ['officer_level_id' => 'id']],
            [['stat_officer_agelevel_id'], 'exist', 'skipOnError' => true, 'targetClass' => StatOfficerAgelevel::className(), 'targetAttribute' => ['stat_officer_agelevel_id' => 'id']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'stat_officer_agelevel_id' => Yii::t('app', 'Stat Officer Agelevel ID'),
            'officer_level_id' => Yii::t('app', 'Officer Level ID'),
            'total_18' => Yii::t('app', 'Total 18'),
            'women_18' => Yii::t('app', 'Women 18'),
            'total_20' => Yii::t('app', 'Total 20'),
            'women_20' => Yii::t('app', 'Women 20'),
            'total_25' => Yii::t('app', 'Total 25'),
            'women_25' => Yii::t('app', 'Women 25'),
            'total_30' => Yii::t('app', 'Total 30'),
            'women_30' => Yii::t('app', 'Women 30'),
            'total_35' => Yii::t('app', 'Total 35'),
            'women_35' => Yii::t('app', 'Women 35'),
            'total_40' => Yii::t('app', 'Total 40'),
            'women_40' => Yii::t('app', 'Women 40'),
            'total_45' => Yii::t('app', 'Total 45'),
            'women_45' => Yii::t('app', 'Women 45'),
            'total_50' => Yii::t('app', 'Total 50'),
            'women_50' => Yii::t('app', 'Women 50'),
            'total_55' => Yii::t('app', 'Total 55'),
            'women_55' => Yii::t('app', 'Women 55'),
            'total_60' => Yii::t('app', 'Total 60'),
            'women_60' => Yii::t('app', 'Women 60'),
            'total_60p' => Yii::t('app', 'Total 60p'),
            'women_60p' => Yii::t('app', 'Women 60p'),
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
    public function getStatOfficerAgelevel()
    {
        return $this->hasOne(StatOfficerAgelevel::className(), ['id' => 'stat_officer_agelevel_id']);
    }

    /**
     * @inheritdoc
     * @return StatOfficerAgelevelDetailQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new StatOfficerAgelevelDetailQuery(get_called_class());
    }
}
