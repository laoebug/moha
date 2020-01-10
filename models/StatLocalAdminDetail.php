<?php

namespace app\models;

use Yii;
use yii\db\ActiveQuery;
use yii\db\ActiveRecord;

/**
 * This is the model class for table "stat_local_admin_detail".
 *
 * @property integer $id
 * @property integer $stat_local_admin_id
 * @property integer $province_id
 * @property integer $province_head_total
 * @property integer $province_head_women
 * @property integer $province_vice_total
 * @property integer $province_vice_women
 * @property integer $district_head_total
 * @property integer $district_head_women
 * @property integer $district_vice_total
 * @property integer $district_vice_women
 * @property integer $village_head_total
 * @property integer $village_head_women
 * @property integer $village_vice_total
 * @property integer $village_vice_women
 * @property integer $population_total
 * @property integer $population_women
 * @property integer $village
 * @property integer $family_total
 * @property integer $family_poor
 * @property int $capital_head_total
 * @property int $capital_head_women
 * @property int $capital_vice_total
 * @property int $capital_vice_women
 * @property int $city_head_total
 * @property int $city_head_women
 * @property int $city_vice_total
 * @property int $city_vice_women
 * @property int $family_approved
 * @property int $family_pending
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
            [['stat_local_admin_id', 'province_id'], 'required','message'=>Yii::t('app','Please enter a value for') .Yii::t('app','{attribute}')],
//            [['stat_local_admin_id', 'province_id', 'province_head_total', 'province_head_women', 'province_vice_total', 'province_vice_women', 'district_head_total', 'district_head_women', 'district_vice_total', 'district_vice_women', 'village_head_total', 'village_head_women', 'village_vice_total', 'village_vice_women', 'population_total', 'population_women', 'village', 'family_total', 'family_poor'], 'integer'],
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
            'province_head_total' => Yii::t('app', 'Province Head Total'),
            'province_head_women' => Yii::t('app', 'Province Head Women'),
            'province_vice_total' => Yii::t('app', 'Province Vice Total'),
            'province_vice_women' => Yii::t('app', 'Province Vice Women'),
            'district_head_total' => Yii::t('app', 'District Head Total'),
            'district_head_women' => Yii::t('app', 'District Head Women'),
            'district_vice_total' => Yii::t('app', 'District Vice Total'),
            'district_vice_women' => Yii::t('app', 'District Vice Women'),
            'village_head_total' => Yii::t('app', 'Village Head Total'),
            'village_head_women' => Yii::t('app', 'Village Head Women'),
            'village_vice_total' => Yii::t('app', 'Village Vice Total'),
            'village_vice_women' => Yii::t('app', 'Village Vice Women'),
            'population_total' => Yii::t('app', 'Population Total'),
            'population_women' => Yii::t('app', 'Population Women'),
            'village' => Yii::t('app', 'Village'),
            'family_total' => Yii::t('app', 'Family Total'),
            'family_poor' => Yii::t('app', 'Family Poor'),
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

    /**
     * @inheritdoc
     * @return StatLocalAdminDetailQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new StatLocalAdminDetailQuery(get_called_class());
    }
}
