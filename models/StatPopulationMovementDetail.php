<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "stat_population_movement_detail".
 *
 * @property integer $id
 * @property integer $district
 * @property integer $village
 * @property integer $population_total
 * @property integer $population_women
 * @property integer $born_total
 * @property integer $born_women
 * @property integer $die_total
 * @property integer $die_women
 * @property integer $married
 * @property integer $divorce
 * @property integer $movein_total
 * @property integer $movein_women
 * @property integer $moveout_total
 * @property integer $moveout_women
 * @property integer $real_total
 * @property integer $real_women
 * @property integer $province_id
 * @property integer $stat_population_movement_id
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
            [['district', 'village', 'population_total', 'population_women', 'born_total', 'born_women', 'die_total', 'die_women', 'married', 'divorce', 'movein_total', 'movein_women', 'moveout_total', 'moveout_women', 'real_total', 'real_women', 'province_id', 'stat_population_movement_id'], 'integer'],
            [['province_id', 'stat_population_movement_id'], 'required','message'=>Yii::t('app','Please enter a value for') .Yii::t('app','{attribute}')],
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
            'id' => Yii::t('app', 'ID'),
            'district' => Yii::t('app', 'District'),
            'village' => Yii::t('app', 'Village'),
            'population_total' => Yii::t('app', 'Population Total'),
            'population_women' => Yii::t('app', 'Population Women'),
            'born_total' => Yii::t('app', 'Born Total'),
            'born_women' => Yii::t('app', 'Born Women'),
            'die_total' => Yii::t('app', 'Die Total'),
            'die_women' => Yii::t('app', 'Die Women'),
            'married' => Yii::t('app', 'Married'),
            'divorce' => Yii::t('app', 'Divorce'),
            'movein_total' => Yii::t('app', 'Movein Total'),
            'movein_women' => Yii::t('app', 'Movein Women'),
            'moveout_total' => Yii::t('app', 'Moveout Total'),
            'moveout_women' => Yii::t('app', 'Moveout Women'),
            'real_total' => Yii::t('app', 'Real Total'),
            'real_women' => Yii::t('app', 'Real Women'),
            'province_id' => Yii::t('app', 'Province ID'),
            'stat_population_movement_id' => Yii::t('app', 'Stat Population Movement ID'),
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

    /**
     * @inheritdoc
     * @return StatPopulationMovementDetailQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new StatPopulationMovementDetailQuery(get_called_class());
    }
}
