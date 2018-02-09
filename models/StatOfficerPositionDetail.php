<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "stat_officer_position_detail".
 *
 * @property integer $id
 * @property integer $p1_total
 * @property integer $p1_women
 * @property integer $p2_total
 * @property integer $p2_women
 * @property integer $p3_total
 * @property integer $p3_women
 * @property integer $p4_total
 * @property integer $p4_women
 * @property integer $p5_total
 * @property integer $p5_women
 * @property integer $p6_total
 * @property integer $p6_women
 * @property integer $p7_total
 * @property integer $p7_women
 * @property integer $p8_total
 * @property integer $p8_women
 * @property integer $stat_officer_position_id
 *
 * @property StatOfficerPosition $statOfficerPosition
 */
class StatOfficerPositionDetail extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'stat_officer_position_detail';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['p1_total', 'p1_women', 'p2_total', 'p2_women', 'p3_total', 'p3_women', 'p4_total', 'p4_women', 'p5_total', 'p5_women', 'p6_total', 'p6_women', 'p7_total', 'p7_women', 'p8_total', 'p8_women', 'stat_officer_position_id'], 'integer'],
            [['stat_officer_position_id'], 'required', 'required','message'=>Yii::t('app','Please enter a value for') .Yii::t('app','{attribute}')],
            [['stat_officer_position_id'], 'exist', 'skipOnError' => true, 'targetClass' => StatOfficerPosition::className(), 'targetAttribute' => ['stat_officer_position_id' => 'id']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'p1_total' => Yii::t('app', 'P1 Total'),
            'p1_women' => Yii::t('app', 'P1 Women'),
            'p2_total' => Yii::t('app', 'P2 Total'),
            'p2_women' => Yii::t('app', 'P2 Women'),
            'p3_total' => Yii::t('app', 'P3 Total'),
            'p3_women' => Yii::t('app', 'P3 Women'),
            'p4_total' => Yii::t('app', 'P4 Total'),
            'p4_women' => Yii::t('app', 'P4 Women'),
            'p5_total' => Yii::t('app', 'P5 Total'),
            'p5_women' => Yii::t('app', 'P5 Women'),
            'p6_total' => Yii::t('app', 'P6 Total'),
            'p6_women' => Yii::t('app', 'P6 Women'),
            'p7_total' => Yii::t('app', 'P7 Total'),
            'p7_women' => Yii::t('app', 'P7 Women'),
            'p8_total' => Yii::t('app', 'P8 Total'),
            'p8_women' => Yii::t('app', 'P8 Women'),
            'stat_officer_position_id' => Yii::t('app', 'Stat Officer Position ID'),
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getStatOfficerPosition()
    {
        return $this->hasOne(StatOfficerPosition::className(), ['id' => 'stat_officer_position_id']);
    }

    /**
     * @inheritdoc
     * @return StatOfficerPositionDetailQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new StatOfficerPositionDetailQuery(get_called_class());
    }
}
