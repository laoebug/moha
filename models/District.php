<?php

namespace app\models;

use Yii;
use yii\db\ActiveQuery;
use yii\db\ActiveRecord;

/**
 * This is the model class for table "district".
 *
 * @property int $id
 * @property string $district_code
 * @property string $district_name
 * @property int $province_id
 * @property string $record_status
 * @property int $input_id
 * @property string $input_dt_stamp
 * @property int $deleted
 *
 * @property Province $province
 * @property User $input
 */
class District extends ActiveRecord
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
            [['input_id'], 'exist', 'skipOnError' => true, 'targetClass' => User::className(), 'targetAttribute' => ['input_id' => 'id']],
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
     * @return ActiveQuery
     */
    public function getProvince()
    {
        return $this->hasOne(Province::className(), ['id' => 'province_id']);
    }

    /**
     * @return ActiveQuery
     */
    public function getInput()
    {
        return $this->hasOne(User::className(), ['id' => 'input_id']);
    }
}
