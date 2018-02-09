<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "stat_position_detail".
 *
 * @property integer $id
 * @property integer $position1_total
 * @property integer $position1_women
 * @property integer $position2_total
 * @property integer $position2_women
 * @property integer $position3_total
 * @property integer $position3_women
 * @property integer $position4_total
 * @property integer $position4_women
 * @property integer $position5_total
 * @property integer $position5_women
 * @property integer $position6_total
 * @property integer $position6_women
 * @property integer $position7_total
 * @property integer $position7_women
 * @property integer $position8_total
 * @property integer $position8_women
 * @property integer $officer_level_id
 * @property integer $stat_position_id
 *
 * @property OfficerLevel $officerLevel
 * @property StatPosition $statPosition
 */
class StatPositionDetail extends \yii\db\ActiveRecord
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
            [['officer_level_id', 'stat_position_id'], 'required', 'required','message'=>Yii::t('app','Please enter a value for') .Yii::t('app','{attribute}')],
            [['officer_level_id'], 'exist', 'skipOnError' => true, 'targetClass' => OfficerLevel::className(), 'targetAttribute' => ['officer_level_id' => 'id']],
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
     * @return \yii\db\ActiveQuery
     */
    public function getOfficerLevel()
    {
        return $this->hasOne(OfficerLevel::className(), ['id' => 'officer_level_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getStatPosition()
    {
        return $this->hasOne(StatPosition::className(), ['id' => 'stat_position_id']);
    }

    /**
     * @inheritdoc
     * @return StatPositionDetailQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new StatPositionDetailQuery(get_called_class());
    }
}
