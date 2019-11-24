<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "stat_population_movement_detail".
 *
 * @property int $id
 * @property int $district
 * @property int $village
 * @property int $population_total
 * @property int $population_women
 * @property int $born_total
 * @property int $born_women
 * @property int $die_total
 * @property int $die_women
 * @property int $married_local_foreigner
 * @property int $divorce_local_foreigner
 * @property int $married
 * @property int $divorce
 * @property int $movein_total
 * @property int $movein_women
 * @property int $moveout_total
 * @property int $moveout_women
 * @property int $real_total
 * @property int $real_women
 * @property int $province_id
 * @property int $stat_population_movement_id
 *
 * @property Province $province
 * @property StatPopulationMovement $statPopulationMovement
 */
class StatPopulationMovementDetail extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'stat_population_movement_detail';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['district', 'village', 'population_total', 'population_women', 'born_total', 'born_women', 'die_total', 'die_women', 'married_local_foreigner', 'divorce_local_foreigner', 'married', 'divorce', 'movein_total', 'movein_women', 'moveout_total', 'moveout_women', 'real_total', 'real_women', 'province_id', 'stat_population_movement_id'], 'integer'],
            [['province_id', 'stat_population_movement_id'], 'required'],
            [['province_id'], 'exist', 'skipOnError' => true, 'targetClass' => Province::className(), 'targetAttribute' => ['province_id' => 'id']],
            [['stat_population_movement_id'], 'exist', 'skipOnError' => true, 'targetClass' => StatPopulationMovement::className(), 'targetAttribute' => ['stat_population_movement_id' => 'id']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'district' => 'District',
            'village' => 'Village',
            'population_total' => 'Population Total',
            'population_women' => 'Population Women',
            'born_total' => 'Born Total',
            'born_women' => 'Born Women',
            'die_total' => 'Die Total',
            'die_women' => 'Die Women',
            'married_local_foreigner' => 'Married Local Foreigner',
            'divorce_local_foreigner' => 'Divorce Local Foreigner',
            'married' => 'Married',
            'divorce' => 'Divorce',
            'movein_total' => 'Movein Total',
            'movein_women' => 'Movein Women',
            'moveout_total' => 'Moveout Total',
            'moveout_women' => 'Moveout Women',
            'real_total' => 'Real Total',
            'real_women' => 'Real Women',
            'province_id' => 'Province ID',
            'stat_population_movement_id' => 'Stat Population Movement ID',
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
    public function getStatPopulationMovement()
    {
        return $this->hasOne(StatPopulationMovement::className(), ['id' => 'stat_population_movement_id']);
    }
}
