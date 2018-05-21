<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "stat_officer_province_add_detail".
 *
 * @property integer $id
 * @property integer $add
 * @property integer $resign
 * @property integer $stat_officer_province_add_id
 * @property integer $province_id
 *
 * @property Province $province
 * @property StatOfficerProvinceAdd $statOfficerProvinceAdd
 */
class StatOfficerProvinceAddDetail extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'stat_officer_province_add_detail';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['add', 'resign', 'stat_officer_province_add_id', 'province_id'], 'integer'],
            [['stat_officer_province_add_id', 'province_id'], 'required','message'=>Yii::t('app','Please enter a value for') .Yii::t('app','{attribute}')],
            [['province_id'], 'exist', 'skipOnError' => true, 'targetClass' => Province::className(), 'targetAttribute' => ['province_id' => 'id']],
            [['stat_officer_province_add_id'], 'exist', 'skipOnError' => true, 'targetClass' => StatOfficerProvinceAdd::className(), 'targetAttribute' => ['stat_officer_province_add_id' => 'id']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'add' => Yii::t('app', 'Add'),
            'resign' => Yii::t('app', 'Resign'),
            'stat_officer_province_add_id' => Yii::t('app', 'Stat Officer Province Add ID'),
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
    public function getStatOfficerProvinceAdd()
    {
        return $this->hasOne(StatOfficerProvinceAdd::className(), ['id' => 'stat_officer_province_add_id']);
    }

    /**
     * @inheritdoc
     * @return StatOfficerProvinceAddDetailQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new StatOfficerProvinceAddDetailQuery(get_called_class());
    }
}
