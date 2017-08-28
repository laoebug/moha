<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "stat_goverment_unit_detail".
 *
 * @property integer $id
 * @property integer $branch_id
 * @property string $remark
 * @property integer $goverment_level_id
 * @property integer $value
 * @property integer $stat_goverment_unit_id
 *
 * @property Branch $branch
 * @property GovermentLevel $govermentLevel
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
            [['branch_id', 'goverment_level_id', 'stat_goverment_unit_id'], 'required'],
            [['branch_id', 'goverment_level_id', 'value', 'stat_goverment_unit_id'], 'integer'],
            [['remark'], 'string'],
            [['branch_id'], 'exist', 'skipOnError' => true, 'targetClass' => Branch::className(), 'targetAttribute' => ['branch_id' => 'id']],
            [['goverment_level_id'], 'exist', 'skipOnError' => true, 'targetClass' => GovermentLevel::className(), 'targetAttribute' => ['goverment_level_id' => 'id']],
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
            'branch_id' => Yii::t('app', 'Branch ID'),
            'remark' => Yii::t('app', 'Remark'),
            'goverment_level_id' => Yii::t('app', 'Goverment Level ID'),
            'value' => Yii::t('app', 'Value'),
            'stat_goverment_unit_id' => Yii::t('app', 'Stat Goverment Unit ID'),
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getBranch()
    {
        return $this->hasOne(Branch::className(), ['id' => 'branch_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getGovermentLevel()
    {
        return $this->hasOne(GovermentLevel::className(), ['id' => 'goverment_level_id']);
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
