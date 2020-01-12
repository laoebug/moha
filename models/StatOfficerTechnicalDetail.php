<?php

namespace app\models;

use Yii;
use yii\db\ActiveQuery;
use yii\db\ActiveRecord;

/**
 * This is the model class for table "stat_officer_technical_detail".
 *
 * @property int $id
 * @property int $stat_officer_technical_id
 * @property int $officer_level_id
 * @property int $doctor_total
 * @property int $doctor_women
 * @property int $post_master_total
 * @property int $post_master_women
 * @property int $master_total
 * @property int $master_women
 * @property int $post_bachelor_total
 * @property int $post_bachelor_women
 * @property int $bachelor_total
 * @property int $bachelor_women
 * @property int $high_total
 * @property int $high_women
 * @property int $middle_total
 * @property int $middle_women
 * @property int $begin_total
 * @property int $begin_women
 * @property int $hischool_total
 * @property int $hischool_women
 * @property int $second_total
 * @property int $second_women
 * @property int $primary_total
 * @property int $primary_women
 *
 * @property StatOfficerTechnical $statOfficerTechnical
 */
class StatOfficerTechnicalDetail extends ActiveRecord
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
     * @return ActiveQuery
     */
    public function getStatOfficerTechnical()
    {
        return $this->hasOne(StatOfficerTechnical::className(), ['id' => 'stat_officer_technical_id']);
    }
}
