<?php

namespace app\models;

use Yii;
use yii\db\ActiveQuery;
use yii\db\ActiveRecord;

/**
 * This is the model class for table "stat_officer_province_add_detail".
 *
 * @property int $id
 * @property int $add
 * @property int $resign
 * @property int $stat_officer_province_add_id
 * @property int $province_id
 *
 * @property Province $province
 * @property StatOfficerProvinceAdd $statOfficerProvinceAdd
 */
class StatOfficerProvinceAddDetail extends ActiveRecord
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
            [['stat_officer_province_add_id', 'province_id'], 'required'],
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
     * @return ActiveQuery
     */
    public function getProvince()
    {
        return $this->hasOne(Province::className(), ['id' => 'province_id']);
    }

    /**
     * @return ActiveQuery
     */
    public function getStatOfficerProvinceAdd()
    {
        return $this->hasOne(StatOfficerProvinceAdd::className(), ['id' => 'stat_officer_province_add_id']);
    }
}
