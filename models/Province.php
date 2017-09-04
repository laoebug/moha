<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "province".
 *
 * @property integer $id
 * @property string $province_code
 * @property string $province_name
 * @property string $record_status
 * @property integer $input_id
 * @property string $input_dt_stamp
 * @property integer $deleted
 *
 * @property Accociation[] $accociations
 * @property District[] $districts
 * @property Foundation[] $foundations
 * @property User $input
 */
class Province extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'province';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['province_code', 'province_name'], 'required'],
            [['input_id', 'deleted'], 'integer'],
            [['input_dt_stamp'], 'safe'],
            [['province_code'], 'string', 'max' => 20],
            [['province_name'], 'string', 'max' => 255],
            [['record_status'], 'string', 'max' => 1],
            [['province_name'], 'unique'],
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
            'province_code' => Yii::t('app', 'Province Code'),
            'province_name' => Yii::t('app', 'Province Name'),
            'record_status' => Yii::t('app', 'Record Status'),
            'input_id' => Yii::t('app', 'Input ID'),
            'input_dt_stamp' => Yii::t('app', 'Input Dt Stamp'),
            'deleted' => Yii::t('app', 'Deleted'),
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getAccociations()
    {
        return $this->hasMany(Accociation::className(), ['province_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getDistricts()
    {
        return $this->hasMany(District::className(), ['province_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getFoundations()
    {
        return $this->hasMany(Foundation::className(), ['province_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getInput()
    {
        return $this->hasOne(User::className(), ['id' => 'input_id']);
    }
}
