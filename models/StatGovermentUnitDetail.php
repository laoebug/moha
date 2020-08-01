<?php

namespace app\models;

use Yii;
use yii\db\ActiveQuery;
use yii\db\ActiveRecord;

/**
 * This is the model class for table "stat_goverment_unit_detail".
 *
 * @property int $id
 * @property int $department
 * * @property int $division
 * @property int $insitute
 * @property int $center
 * @property int $stat_goverment_unit_id
 * @property string $remark
 * @property int $office
 * @property int $ministry_id
 *
 * @property Ministry $ministry
 * @property StatGovermentUnit $statGovermentUnit
 */
class StatGovermentUnitDetail extends ActiveRecord
{
    /**
     * @inheritdoc
     */
    public $name;
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
            [['department', 'division', 'insitute', 'center', 'stat_goverment_unit_id', 'office', 'ministry_id'], 'integer'],
            [['stat_goverment_unit_id', 'ministry_id'], 'required'],
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
            'division' => Yii::t('app', 'Division'),
            'insitute' => Yii::t('app', 'Insitute'),
            'center' => Yii::t('app', 'Center'),
            'stat_goverment_unit_id' => Yii::t('app', 'Stat Goverment Unit ID'),
            'remark' => Yii::t('app', 'Remark'),
            'office' => Yii::t('app', 'Office'),
            'ministry_id' => Yii::t('app', 'Ministry ID'),
        ];
    }

    /**
     * @return ActiveQuery
     */
    public function getMinistry()
    {
        return $this->hasOne(Ministry::className(), ['id' => 'ministry_id']);
    }

    /**
     * @return ActiveQuery
     */
    public function getStatGovermentUnit()
    {
        return $this->hasOne(StatGovermentUnit::className(), ['id' => 'stat_goverment_unit_id']);
    }
}
