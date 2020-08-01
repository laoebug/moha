<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "stat_ministry_detail".
 *
 * @property int $id
 * @property string $name
 * @property string $remark
 * @property int $position
 * @property string $batch
 * @property int $stat_ministry_id
 *
 * @property StatMinistry $statMinistry
 */
class StatMinistryDetail extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'stat_ministry_detail';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['position', 'stat_ministry_id'], 'integer'],
            [['stat_ministry_id'], 'required'],
            [['name', 'remark', 'batch'], 'string', 'max' => 255],
            [['stat_ministry_id'], 'exist', 'skipOnError' => true, 'targetClass' => StatMinistry::className(), 'targetAttribute' => ['stat_ministry_id' => 'id']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'name' => Yii::t('app', 'Name'),
            'remark' => Yii::t('app', 'Remark'),
            'position' => Yii::t('app', 'Position'),
            'batch' => Yii::t('app', 'Batch'),
            'stat_ministry_id' => Yii::t('app', 'Stat Ministry ID'),
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getStatMinistry()
    {
        return $this->hasOne(StatMinistry::className(), ['id' => 'stat_ministry_id']);
    }
}
