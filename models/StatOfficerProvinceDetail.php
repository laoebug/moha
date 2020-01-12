<?php

namespace app\models;

use Yii;
use yii\db\ActiveQuery;
use yii\db\ActiveRecord;

/**
 * This is the model class for table "stat_officer_province_detail".
 *
 * @property int $id
 * @property int $total
 * @property int $women
 * @property int $stat_officer_province_id
 * @property int $province_id
 *
 * @property Province $province
 * @property StatOfficerProvince $statOfficerProvince
 */
class StatOfficerProvinceDetail extends ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'stat_officer_province_detail';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['total', 'women', 'stat_officer_province_id', 'province_id'], 'integer'],
            [['stat_officer_province_id', 'province_id'], 'required'],
            [['province_id'], 'exist', 'skipOnError' => true, 'targetClass' => Province::className(), 'targetAttribute' => ['province_id' => 'id']],
            [['stat_officer_province_id'], 'exist', 'skipOnError' => true, 'targetClass' => StatOfficerProvince::className(), 'targetAttribute' => ['stat_officer_province_id' => 'id']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'total' => Yii::t('app', 'Total'),
            'women' => Yii::t('app', 'Women'),
            'stat_officer_province_id' => Yii::t('app', 'Stat Officer Province ID'),
            'province_id' => Yii::t('app', 'Province ID'),
        ];
    }

    /**
     * @return ActiveQuery
     */
    public function getProvince()
    {
        return $this->hasOne(Province::className(), ['id' => 'province_id']);
    }

    /**
     * @return ActiveQuery
     */
    public function getStatOfficerProvince()
    {
        return $this->hasOne(StatOfficerProvince::className(), ['id' => 'stat_officer_province_id']);
    }
}
