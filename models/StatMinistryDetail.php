<?php

namespace app\models;

use Yii;
use yii\db\ActiveQuery;
use yii\db\ActiveRecord;

/**
 * This is the model class for table "stat_ministry_detail".
 *
 * @property int $id
 * @property int $stat_ministry_id
 * @property string $name
 * @property string $remark
 * @property int $position
 *
 * @property StatMinistry $statMinistry
 */
class StatMinistryDetail extends ActiveRecord
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
            [['stat_ministry_id'], 'required'],
            [['stat_ministry_id', 'position'], 'integer'],
            [['name', 'remark'], 'string', 'max' => 255],
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
            'stat_ministry_id' => Yii::t('app', 'Stat Ministry ID'),
            'name' => Yii::t('app', 'Name'),
            'remark' => Yii::t('app', 'Remark'),
            'position' => Yii::t('app', 'Position'),
        ];
    }

    /**
     * @return ActiveQuery
     */
    public function getStatMinistry()
    {
        return $this->hasOne(StatMinistry::className(), ['id' => 'stat_ministry_id']);
    }
}
