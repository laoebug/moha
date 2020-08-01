<?php

namespace app\models;

use Yii;
use yii\db\ActiveQuery;
use yii\db\ActiveRecord;

/**
 * This is the model class for table "stat_position_detail".
 *
 * @property int $id
 * @property int $position1_total
 * @property int $position1_women
 * @property int $position2_total
 * @property int $position2_women
 * @property int $position3_total
 * @property int $position3_women
 * @property int $position4_total
 * @property int $position4_women
 * @property int $position5_total
 * @property int $position5_women
 * @property int $position6_total
 * @property int $position6_women
 * @property int $position7_total
 * @property int $position7_women
 * @property int $position8_total
 * @property int $position8_women
 * @property int $officer_level_id
 * @property int $stat_position_id
 *
 * @property StatPosition $statPosition
 */
class StatPositionDetail extends ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'stat_position_detail';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['position1_total', 'position1_women', 'position2_total', 'position2_women', 'position3_total', 'position3_women', 'position4_total', 'position4_women', 'position5_total', 'position5_women', 'position6_total', 'position6_women', 'position7_total', 'position7_women', 'position8_total', 'position8_women', 'officer_level_id', 'stat_position_id'], 'integer'],
            [['officer_level_id', 'stat_position_id'], 'required'],
            [['stat_position_id'], 'exist', 'skipOnError' => true, 'targetClass' => StatPosition::className(), 'targetAttribute' => ['stat_position_id' => 'id']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'position1_total' => Yii::t('app', 'Position1 Total'),
            'position1_women' => Yii::t('app', 'Position1 Women'),
            'position2_total' => Yii::t('app', 'Position2 Total'),
            'position2_women' => Yii::t('app', 'Position2 Women'),
            'position3_total' => Yii::t('app', 'Position3 Total'),
            'position3_women' => Yii::t('app', 'Position3 Women'),
            'position4_total' => Yii::t('app', 'Position4 Total'),
            'position4_women' => Yii::t('app', 'Position4 Women'),
            'position5_total' => Yii::t('app', 'Position5 Total'),
            'position5_women' => Yii::t('app', 'Position5 Women'),
            'position6_total' => Yii::t('app', 'Position6 Total'),
            'position6_women' => Yii::t('app', 'Position6 Women'),
            'position7_total' => Yii::t('app', 'Position7 Total'),
            'position7_women' => Yii::t('app', 'Position7 Women'),
            'position8_total' => Yii::t('app', 'Position8 Total'),
            'position8_women' => Yii::t('app', 'Position8 Women'),
            'officer_level_id' => Yii::t('app', 'Officer Level ID'),
            'stat_position_id' => Yii::t('app', 'Stat Position ID'),
        ];
    }

    /**
     * @return ActiveQuery
     */
    public function getStatPosition()
    {
        return $this->hasOne(StatPosition::className(), ['id' => 'stat_position_id']);
    }
}
