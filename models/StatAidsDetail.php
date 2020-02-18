<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "stat_aids_detail".
 *
 * @property int $id
 * @property int $deleted
 * @property int $stat_aids_id
 * @property string $name
 * @property string $contract
 * @property string $start
 * @property string $finish
 * @property string $amount
 * @property string $remark
 * @property int $aids_type_id
 *
 * @property AidsType $aidsType
 * @property StatAids $statAids
 */
class StatAidsDetail extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'stat_aids_detail';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['deleted', 'stat_aids_id', 'aids_type_id'], 'integer'],
            [['stat_aids_id', 'aids_type_id'], 'required'],
            [['name', 'contract', 'start', 'finish', 'remark'], 'string', 'max' => 255],
            [['aids_type_id'], 'exist', 'skipOnError' => true, 'targetClass' => AidsType::className(), 'targetAttribute' => ['aids_type_id' => 'id']],
            [['stat_aids_id'], 'exist', 'skipOnError' => true, 'targetClass' => StatAids::className(), 'targetAttribute' => ['stat_aids_id' => 'id']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'deleted' => Yii::t('app', 'Deleted'),
            'stat_aids_id' => Yii::t('app', 'Stat Aids ID'),
            'name' => Yii::t('app', 'Name'),
            'contract' => Yii::t('app', 'Contract'),
            'start' => Yii::t('app', 'Start'),
            'finish' => Yii::t('app', 'Finish'),
            'amount' => Yii::t('app', 'Amount'),
            'remark' => Yii::t('app', 'Remark'),
            'aids_type_id' => Yii::t('app', 'Aids Type ID'),
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getAidsType()
    {
        return $this->hasOne(AidsType::className(), ['id' => 'aids_type_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getStatAids()
    {
        return $this->hasOne(StatAids::className(), ['id' => 'stat_aids_id']);
    }
}
