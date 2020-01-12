<?php

namespace app\models;

use Yii;
use yii\db\ActiveQuery;
use yii\db\ActiveRecord;

/**
 * This is the model class for table "stat_officer_agelevel_detail".
 *
 * @property int $id
 * @property int $stat_officer_agelevel_id
 * @property int $officer_level_id
 * @property int $total_18
 * @property int $women_18
 * @property int $total_20
 * @property int $women_20
 * @property int $total_25
 * @property int $women_25
 * @property int $total_30
 * @property int $women_30
 * @property int $total_35
 * @property int $women_35
 * @property int $total_40
 * @property int $women_40
 * @property int $total_45
 * @property int $women_45
 * @property int $total_50
 * @property int $women_50
 * @property int $total_55
 * @property int $women_55
 * @property int $total_60
 * @property int $women_60
 * @property int $total_60p
 * @property int $women_60p
 *
 * @property StatOfficerAgelevel $statOfficerAgelevel
 */
class StatOfficerAgelevelDetail extends ActiveRecord
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
            [['stat_officer_agelevel_id', 'officer_level_id'], 'required'],
            [['stat_officer_agelevel_id', 'officer_level_id', 'total_18', 'women_18', 'total_20', 'women_20', 'total_25', 'women_25', 'total_30', 'women_30', 'total_35', 'women_35', 'total_40', 'women_40', 'total_45', 'women_45', 'total_50', 'women_50', 'total_55', 'women_55', 'total_60', 'women_60', 'total_60p', 'women_60p'], 'integer'],
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
     * @return ActiveQuery
     */
    public function getStatOfficerAgelevel()
    {
        return $this->hasOne(StatOfficerAgelevel::className(), ['id' => 'stat_officer_agelevel_id']);
    }
}
