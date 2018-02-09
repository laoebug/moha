<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "stat_goverment_unit_detail".
 *
 * @property integer $id
 * @property integer $department
 * @property integer $insitute
 * @property integer $center
 * @property integer $stat_goverment_unit_id
 * @property string $remark
 * @property integer $office
 * @property integer $ministry_id
 *
 * @property Ministry $ministry
 * @property StatGovermentUnit $statGovermentUnit
 */
class StatGovermentUnitDetail extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'stat_goverment_unit_detail';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['department', 'insitute', 'center', 'stat_goverment_unit_id', 'office', 'ministry_id'], 'integer'],
            [['stat_goverment_unit_id', 'ministry_id'], 'required','message'=>Yii::t('app','Please enter a value for') .Yii::t('app','{attribute}')],
            [['remark'], 'string'],
            [['ministry_id'], 'exist', 'skipOnError' => true, 'targetClass' => Ministry::className(), 'targetAttribute' => ['ministry_id' => 'id']],
            [['stat_goverment_unit_id'], 'exist', 'skipOnError' => true, 'targetClass' => StatGovermentUnit::className(), 'targetAttribute' => ['stat_goverment_unit_id' => 'id']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'department' => Yii::t('app', 'Department'),
            'insitute' => Yii::t('app', 'Insitute'),
            'center' => Yii::t('app', 'Center'),
            'stat_goverment_unit_id' => Yii::t('app', 'Stat Goverment Unit ID'),
            'remark' => Yii::t('app', 'Remark'),
            'office' => Yii::t('app', 'Office'),
            'ministry_id' => Yii::t('app', 'Ministry ID'),
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getMinistry()
    {
        return $this->hasOne(Ministry::className(), ['id' => 'ministry_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getStatGovermentUnit()
    {
        return $this->hasOne(StatGovermentUnit::className(), ['id' => 'stat_goverment_unit_id']);
    }

    /**
     * @inheritdoc
     * @return StatGovermentUnitDetailQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new StatGovermentUnitDetailQuery(get_called_class());
    }
}
