<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "stat_officer_detail".
 *
 * @property integer $id
 * @property integer $stat_officer_id
 * @property integer $center_total
 * @property integer $province_total
 * @property integer $district_total
 * @property integer $center_women
 * @property integer $province_women
 * @property integer $district_women
 *
 * @property StatOfficer $statOfficer
 */
class StatOfficerDetail extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'stat_officer_detail';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['stat_officer_id'], 'required'],
            [['stat_officer_id', 'center_total', 'province_total', 'district_total', 'center_women', 'province_women', 'district_women'], 'integer'],
            [['stat_officer_id'], 'exist', 'skipOnError' => true, 'targetClass' => StatOfficer::className(), 'targetAttribute' => ['stat_officer_id' => 'id']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'stat_officer_id' => Yii::t('app', 'Stat Officer ID'),
            'center_total' => Yii::t('app', 'Center Total'),
            'province_total' => Yii::t('app', 'Province Total'),
            'district_total' => Yii::t('app', 'District Total'),
            'center_women' => Yii::t('app', 'Center Women'),
            'province_women' => Yii::t('app', 'Province Women'),
            'district_women' => Yii::t('app', 'District Women'),
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getStatOfficer()
    {
        return $this->hasOne(StatOfficer::className(), ['id' => 'stat_officer_id']);
    }

    /**
     * @inheritdoc
     * @return StatOfficerDetailQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new StatOfficerDetailQuery(get_called_class());
    }
}
