<?php

namespace app\models;

use Yii;
use yii\db\ActiveQuery;
use yii\db\ActiveRecord;

/**
 * This is the model class for table "stat_officer_new_detail".
 *
 * @property int $id
 * @property int $stat_officer_new_id
 * @property int $officer_level_id
 * @property int $new_total
 * @property int $ministry_total
 * @property int $army_total
 * @property int $soe_total
 * @property int $quota
 * @property int $need
 * @property int $new_women
 * @property int $ministry_women
 * @property int $army_women
 * @property int $soe_women
 *
 * @property StatOfficerNew $statOfficerNew
 */
class StatOfficerNewDetail extends ActiveRecord
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
            [['stat_officer_new_id', 'officer_level_id'], 'required'],
            [['stat_officer_new_id', 'officer_level_id', 'new_total', 'ministry_total', 'army_total', 'soe_total', 'quota', 'need', 'new_women', 'ministry_women', 'army_women', 'soe_women'], 'integer'],
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
     * @return ActiveQuery
     */
    public function getStatOfficerNew()
    {
        return $this->hasOne(StatOfficerNew::className(), ['id' => 'stat_officer_new_id']);
    }
}
