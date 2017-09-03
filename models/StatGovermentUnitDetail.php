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
 * @property integer $branch_id
 * @property string $remark
 * @property integer $office
 *
 * @property Branch $branch
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
            [['department', 'insitute', 'center', 'stat_goverment_unit_id', 'branch_id', 'office'], 'integer'],
            [['stat_goverment_unit_id', 'branch_id'], 'required'],
            [['remark'], 'string'],
            [['branch_id'], 'exist', 'skipOnError' => true, 'targetClass' => Branch::className(), 'targetAttribute' => ['branch_id' => 'id']],
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
            'branch_id' => Yii::t('app', 'Branch ID'),
            'remark' => Yii::t('app', 'Remark'),
            'office' => Yii::t('app', 'Office'),
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
