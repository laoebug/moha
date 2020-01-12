<?php

namespace app\models;

use Yii;
use yii\db\ActiveQuery;
use yii\db\ActiveRecord;

/**
 * This is the model class for table "stat_officer_province_train_detail".
 *
 * @property int $id
 * @property int $tech_in_total
 * @property int $tech_in_women
 * @property int $tech_out_total
 * @property int $tech_out_women
 * @property int $theo_in_total
 * @property int $theo_in_women
 * @property int $stat_officer_province_train_id
 * @property int $province_id
 * @property int $theo_out_total
 * @property int $theo_out_women
 *
 * @property Province $province
 * @property StatOfficerProvinceTrain $statOfficerProvinceTrain
 */
class StatOfficerProvinceTrainDetail extends ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'stat_officer_province_train_detail';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['tech_in_total', 'tech_in_women', 'tech_out_total', 'tech_out_women', 'theo_in_total', 'theo_in_women', 'stat_officer_province_train_id', 'province_id', 'theo_out_total', 'theo_out_women'], 'integer'],
            [['stat_officer_province_train_id', 'province_id'], 'required'],
            [['province_id'], 'exist', 'skipOnError' => true, 'targetClass' => Province::className(), 'targetAttribute' => ['province_id' => 'id']],
            [['stat_officer_province_train_id'], 'exist', 'skipOnError' => true, 'targetClass' => StatOfficerProvinceTrain::className(), 'targetAttribute' => ['stat_officer_province_train_id' => 'id']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'tech_in_total' => Yii::t('app', 'Tech In Total'),
            'tech_in_women' => Yii::t('app', 'Tech In Women'),
            'tech_out_total' => Yii::t('app', 'Tech Out Total'),
            'tech_out_women' => Yii::t('app', 'Tech Out Women'),
            'theo_in_total' => Yii::t('app', 'Theo In Total'),
            'theo_in_women' => Yii::t('app', 'Theo In Women'),
            'stat_officer_province_train_id' => Yii::t('app', 'Stat Officer Province Train ID'),
            'province_id' => Yii::t('app', 'Province ID'),
            'theo_out_total' => Yii::t('app', 'Theo Out Total'),
            'theo_out_women' => Yii::t('app', 'Theo Out Women'),
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
    public function getStatOfficerProvinceTrain()
    {
        return $this->hasOne(StatOfficerProvinceTrain::className(), ['id' => 'stat_officer_province_train_id']);
    }
}
