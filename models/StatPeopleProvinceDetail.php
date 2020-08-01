<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "stat_people_province_detail".
 *
 * @property int $id
 * @property int $people
 * @property int $province_id
 * @property int $stat_people_province_id
 *
 * @property Province $province
 * @property StatPeopleProvince $statPeopleProvince
 */
class StatPeopleProvinceDetail extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'stat_people_province_detail';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['people', 'province_id', 'stat_people_province_id'], 'required'],
            [['people', 'province_id', 'stat_people_province_id'], 'integer'],
            [['province_id'], 'exist', 'skipOnError' => true, 'targetClass' => Province::className(), 'targetAttribute' => ['province_id' => 'id']],
            [['stat_people_province_id'], 'exist', 'skipOnError' => true, 'targetClass' => StatPeopleProvince::className(), 'targetAttribute' => ['stat_people_province_id' => 'id']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'people' => 'People',
            'province_id' => 'Province ID',
            'stat_people_province_id' => 'Stat People Province ID',
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
    public function getStatPeopleProvince()
    {
        return $this->hasOne(StatPeopleProvince::className(), ['id' => 'stat_people_province_id']);
    }
}
