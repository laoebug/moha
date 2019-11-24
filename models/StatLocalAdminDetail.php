<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "stat_local_admin_detail".
 *
 * @property int $id
 * @property int $stat_local_admin_id
 * @property int $province_id
 * @property int $municipality_head_total
 * @property int $municipality_head_women
 * @property int $municipality_vice_total
 * @property int $municipality_vice_women
 * @property int $province_head_total
 * @property int $province_head_women
 * @property int $province_vice_total
 * @property int $province_vice_women
 * @property int $city_head_total
 * @property int $city_head_women
 * @property int $city_vice_total
 * @property int $city_vice_women
 * @property int $district_head_total
 * @property int $district_head_women
 * @property int $district_vice_total
 * @property int $district_vice_women
 * @property int $village_head_total
 * @property int $village_head_women
 * @property int $village_vice_total
 * @property int $village_vice_women
 * @property int $village_improved_five_unit
 * @property int $village_not_improved_five_unit
 * @property int $population_total
 * @property int $population_women
 * @property int $village
 * @property int $family_total
 * @property int $family_poor
 *
 * @property Province $province
 * @property StatLocalAdmin $statLocalAdmin
 */
class StatLocalAdminDetail extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'stat_local_admin_detail';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['stat_local_admin_id', 'province_id'], 'required'],
            [['stat_local_admin_id', 'province_id', 'municipality_head_total', 'municipality_head_women', 'municipality_vice_total', 'municipality_vice_women', 'province_head_total', 'province_head_women', 'province_vice_total', 'province_vice_women', 'city_head_total', 'city_head_women', 'city_vice_total', 'city_vice_women', 'district_head_total', 'district_head_women', 'district_vice_total', 'district_vice_women', 'village_head_total', 'village_head_women', 'village_vice_total', 'village_vice_women', 'village_improved_five_unit', 'village_not_improved_five_unit', 'population_total', 'population_women', 'village', 'family_total', 'family_poor'], 'integer'],
            [['province_id'], 'exist', 'skipOnError' => true, 'targetClass' => Province::className(), 'targetAttribute' => ['province_id' => 'id']],
            [['stat_local_admin_id'], 'exist', 'skipOnError' => true, 'targetClass' => StatLocalAdmin::className(), 'targetAttribute' => ['stat_local_admin_id' => 'id']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'stat_local_admin_id' => 'Stat Local Admin ID',
            'province_id' => 'Province ID',
            'municipality_head_total' => 'Municipality Head Total',
            'municipality_head_women' => 'Municipality Head Women',
            'municipality_vice_total' => 'Municipality Vice Total',
            'municipality_vice_women' => 'Municipality Vice Women',
            'province_head_total' => 'Province Head Total',
            'province_head_women' => 'Province Head Women',
            'province_vice_total' => 'Province Vice Total',
            'province_vice_women' => 'Province Vice Women',
            'city_head_total' => 'City Head Total',
            'city_head_women' => 'City Head Women',
            'city_vice_total' => 'City Vice Total',
            'city_vice_women' => 'City Vice Women',
            'district_head_total' => 'District Head Total',
            'district_head_women' => 'District Head Women',
            'district_vice_total' => 'District Vice Total',
            'district_vice_women' => 'District Vice Women',
            'village_head_total' => 'Village Head Total',
            'village_head_women' => 'Village Head Women',
            'village_vice_total' => 'Village Vice Total',
            'village_vice_women' => 'Village Vice Women',
            'village_improved_five_unit' => 'Village Improved Five Unit',
            'village_not_improved_five_unit' => 'Village Not Improved Five Unit',
            'population_total' => 'Population Total',
            'population_women' => 'Population Women',
            'village' => 'Village',
            'family_total' => 'Family Total',
            'family_poor' => 'Family Poor',
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
    public function getStatLocalAdmin()
    {
        return $this->hasOne(StatLocalAdmin::className(), ['id' => 'stat_local_admin_id']);
    }
}
