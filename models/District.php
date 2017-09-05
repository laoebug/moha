<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "district".
 *
 * @property integer $id
 * @property string $district_code
 * @property string $district_name
 * @property integer $province_id
 * @property string $record_status
 * @property integer $input_id
 * @property string $input_dt_stamp
 * @property integer $deleted
 *
 * @property Province $province
 */
class District extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'district';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['district_code', 'district_name', 'province_id'], 'required'],
            [['province_id', 'input_id', 'deleted'], 'integer'],
            [['input_dt_stamp'], 'safe'],
            [['district_code'], 'string', 'max' => 20],
            [['district_name'], 'string', 'max' => 255],
            [['record_status'], 'string', 'max' => 1],
            [['province_id'], 'exist', 'skipOnError' => true, 'targetClass' => Province::className(), 'targetAttribute' => ['province_id' => 'id']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'district_code' => Yii::t('app', 'District Code'),
            'district_name' => Yii::t('app', 'District Name'),
            'province_id' => Yii::t('app', 'Province ID'),
            'record_status' => Yii::t('app', 'Record Status'),
            'input_id' => Yii::t('app', 'Input ID'),
            'input_dt_stamp' => Yii::t('app', 'Input Dt Stamp'),
            'deleted' => Yii::t('app', 'Deleted'),
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
     * @inheritdoc
     * @return DistrictQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new DistrictQuery(get_called_class());
    }
}
