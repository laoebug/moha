<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "stat_officer_technical_detail".
 *
 * @property integer $id
 * @property integer $stat_officer_technical_id
 * @property integer $officer_level_id
 * @property integer $doctor_total
 * @property integer $doctor_women
 * @property integer $post_master_total
 * @property integer $post_master_women
 * @property integer $master_total
 * @property integer $master_women
 * @property integer $post_bachelor_total
 * @property integer $post_bachelor_women
 * @property integer $bachelor_total
 * @property integer $bachelor_women
 * @property integer $high_total
 * @property integer $high_women
 * @property integer $middle_total
 * @property integer $middle_women
 * @property integer $begin_total
 * @property integer $begin_women
 * @property integer $hischool_total
 * @property integer $hischool_women
 * @property integer $second_total
 * @property integer $second_women
 * @property integer $primary_total
 * @property integer $primary_women
 *
 * @property OfficerLevel $officerLevel
 * @property StatOfficerTechnical $statOfficerTechnical
 */
class StatOfficerTechnicalDetail extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'stat_officer_technical_detail';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['stat_officer_technical_id', 'officer_level_id'], 'required'],
            [['stat_officer_technical_id', 'officer_level_id', 'doctor_total', 'doctor_women', 'post_master_total', 'post_master_women', 'master_total', 'master_women', 'post_bachelor_total', 'post_bachelor_women', 'bachelor_total', 'bachelor_women', 'high_total', 'high_women', 'middle_total', 'middle_women', 'begin_total', 'begin_women', 'hischool_total', 'hischool_women', 'second_total', 'second_women', 'primary_total', 'primary_women'], 'integer'],
            [['officer_level_id'], 'exist', 'skipOnError' => true, 'targetClass' => OfficerLevel::className(), 'targetAttribute' => ['officer_level_id' => 'id']],
            [['stat_officer_technical_id'], 'exist', 'skipOnError' => true, 'targetClass' => StatOfficerTechnical::className(), 'targetAttribute' => ['stat_officer_technical_id' => 'id']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'stat_officer_technical_id' => Yii::t('app', 'Stat Officer Technical ID'),
            'officer_level_id' => Yii::t('app', 'Officer Level ID'),
            'doctor_total' => Yii::t('app', 'Doctor Total'),
            'doctor_women' => Yii::t('app', 'Doctor Women'),
            'post_master_total' => Yii::t('app', 'Post Master Total'),
            'post_master_women' => Yii::t('app', 'Post Master Women'),
            'master_total' => Yii::t('app', 'Master Total'),
            'master_women' => Yii::t('app', 'Master Women'),
            'post_bachelor_total' => Yii::t('app', 'Post Bachelor Total'),
            'post_bachelor_women' => Yii::t('app', 'Post Bachelor Women'),
            'bachelor_total' => Yii::t('app', 'Bachelor Total'),
            'bachelor_women' => Yii::t('app', 'Bachelor Women'),
            'high_total' => Yii::t('app', 'High Total'),
            'high_women' => Yii::t('app', 'High Women'),
            'middle_total' => Yii::t('app', 'Middle Total'),
            'middle_women' => Yii::t('app', 'Middle Women'),
            'begin_total' => Yii::t('app', 'Begin Total'),
            'begin_women' => Yii::t('app', 'Begin Women'),
            'hischool_total' => Yii::t('app', 'Hischool Total'),
            'hischool_women' => Yii::t('app', 'Hischool Women'),
            'second_total' => Yii::t('app', 'Second Total'),
            'second_women' => Yii::t('app', 'Second Women'),
            'primary_total' => Yii::t('app', 'Primary Total'),
            'primary_women' => Yii::t('app', 'Primary Women'),
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
    public function getStatOfficerTechnical()
    {
        return $this->hasOne(StatOfficerTechnical::className(), ['id' => 'stat_officer_technical_id']);
    }

    /**
     * @inheritdoc
     * @return StatOfficerTechnicalDetailQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new StatOfficerTechnicalDetailQuery(get_called_class());
    }
}
