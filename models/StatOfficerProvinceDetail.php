<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "stat_officer_province_detail".
 *
 * @property integer $id
 * @property integer $total
 * @property integer $women
 * @property integer $stat_officer_province_id
 * @property integer $province_id
 *
 * @property Province $province
 * @property StatOfficerProvince $statOfficerProvince
 */
class StatOfficerProvinceDetail extends \yii\db\ActiveRecord
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
            [['stat_officer_province_id', 'province_id'], 'required','message'=>Yii::t('app','Please enter a value for') .Yii::t('app','{attribute}')],
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
     * @return \yii\db\ActiveQuery
     */
    public function getProvince()
    {
        return $this->hasOne(Province::className(), ['id' => 'province_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getStatOfficerProvince()
    {
        return $this->hasOne(StatOfficerProvince::className(), ['id' => 'stat_officer_province_id']);
    }

    /**
     * @inheritdoc
     * @return StatOfficerProvinceDetailQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new StatOfficerProvinceDetailQuery(get_called_class());
    }
}
