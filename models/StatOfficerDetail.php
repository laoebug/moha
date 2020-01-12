<?php

namespace app\models;

use Yii;
use yii\db\ActiveQuery;
use yii\db\ActiveRecord;

/**
 * This is the model class for table "stat_officer_detail".
 *
 * @property int $id
 * @property int $stat_officer_id
 * @property int $center_total
 * @property int $province_total
 * @property int $district_total
 * @property int $center_women
 * @property int $province_women
 * @property int $district_women
 *
 * @property StatOfficer $statOfficer
 */
class StatOfficerDetail extends ActiveRecord
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
     * @return ActiveQuery
     */
    public function getStatOfficer()
    {
        return $this->hasOne(StatOfficer::className(), ['id' => 'stat_officer_id']);
    }
}
