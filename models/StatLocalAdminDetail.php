<?php

namespace app\models;

use Yii;
use yii\db\ActiveQuery;
use yii\db\ActiveRecord;

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
 * @property int $capital_head_total
 * @property int $capital_head_women
 * @property int $capital_vice_total
 * @property int $capital_vice_women
 * @property int $village_approved
 * @property int $village_pending
 *
 * @property Province $province
 * @property StatLocalAdmin $statLocalAdmin
 */
class StatLocalAdminDetail extends ActiveRecord
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
            [['stat_local_admin_id', 'province_id', 'municipality_head_total', 'municipality_head_women', 'municipality_vice_total', 'municipality_vice_women', 'province_head_total', 'province_head_women', 'province_vice_total', 'province_vice_women', 'city_head_total', 'city_head_women', 'city_vice_total', 'city_vice_women', 'district_head_total', 'district_head_women', 'district_vice_total', 'district_vice_women', 'village_head_total', 'village_head_women', 'village_vice_total', 'village_vice_women', 'village_improved_five_unit', 'village_not_improved_five_unit', 'population_total', 'population_women', 'village', 'family_total', 'family_poor', 'capital_head_total', 'capital_head_women', 'capital_vice_total', 'capital_vice_women', 'village_approved', 'village_pending'], 'integer'],
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
            'id' => Yii::t('app', 'ID'),
            'stat_local_admin_id' => Yii::t('app', 'Stat Local Admin ID'),
            'province_id' => Yii::t('app', 'Province ID'),
            'municipality_head_total' => Yii::t('app', 'Municipality Head Total'),
            'municipality_head_women' => Yii::t('app', 'Municipality Head Women'),
            'municipality_vice_total' => Yii::t('app', 'Municipality Vice Total'),
            'municipality_vice_women' => Yii::t('app', 'Municipality Vice Women'),
            'province_head_total' => Yii::t('app', 'Province Head Total'),
            'province_head_women' => Yii::t('app', 'Province Head Women'),
            'province_vice_total' => Yii::t('app', 'Province Vice Total'),
            'province_vice_women' => Yii::t('app', 'Province Vice Women'),
            'city_head_total' => Yii::t('app', 'City Head Total'),
            'city_head_women' => Yii::t('app', 'City Head Women'),
            'city_vice_total' => Yii::t('app', 'City Vice Total'),
            'city_vice_women' => Yii::t('app', 'City Vice Women'),
            'district_head_total' => Yii::t('app', 'District Head Total'),
            'district_head_women' => Yii::t('app', 'District Head Women'),
            'district_vice_total' => Yii::t('app', 'District Vice Total'),
            'district_vice_women' => Yii::t('app', 'District Vice Women'),
            'village_head_total' => Yii::t('app', 'Village Head Total'),
            'village_head_women' => Yii::t('app', 'Village Head Women'),
            'village_vice_total' => Yii::t('app', 'Village Vice Total'),
            'village_vice_women' => Yii::t('app', 'Village Vice Women'),
            'village_improved_five_unit' => Yii::t('app', 'Village Improved Five Unit'),
            'village_not_improved_five_unit' => Yii::t('app', 'Village Not Improved Five Unit'),
            'population_total' => Yii::t('app', 'Population Total'),
            'population_women' => Yii::t('app', 'Population Women'),
            'village' => Yii::t('app', 'Village'),
            'family_total' => Yii::t('app', 'Family Total'),
            'family_poor' => Yii::t('app', 'Family Poor'),
            'capital_head_total' => Yii::t('app', 'Capital Head Total'),
            'capital_head_women' => Yii::t('app', 'Capital Head Women'),
            'capital_vice_total' => Yii::t('app', 'Capital Vice Total'),
            'capital_vice_women' => Yii::t('app', 'Capital Vice Women'),
            'village_approved' => Yii::t('app', 'Village Approved'),
            'village_pending' => Yii::t('app', 'Village Pending'),
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
    public function getStatLocalAdmin()
    {
        return $this->hasOne(StatLocalAdmin::className(), ['id' => 'stat_local_admin_id']);
    }
}
