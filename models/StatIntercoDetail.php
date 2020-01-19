<?php

namespace app\models;

use Yii;
use yii\db\ActiveQuery;
use yii\db\ActiveRecord;

/**
 * This is the model class for table "stat_interco_detail".
 *
 * @property int $id
 * @property string $name
 * @property string $area
 * @property int $stat_interco_id
 *
 * @property StatInterco $statInterco
 */
class StatIntercoDetail extends ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'stat_interco_detail';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['stat_interco_id'], 'required'],
            [['stat_interco_id'], 'integer'],
            [['name', 'area'], 'string', 'max' => 255],
            [['stat_interco_id'], 'exist', 'skipOnError' => true, 'targetClass' => StatInterco::className(), 'targetAttribute' => ['stat_interco_id' => 'id']],
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
            'area' => Yii::t('app', 'Area'),
            'stat_interco_id' => Yii::t('app', 'Stat Interco ID'),
        ];
    }

    /**
     * @return ActiveQuery
     */
    public function getStatInterco()
    {
        return $this->hasOne(StatInterco::className(), ['id' => 'stat_interco_id']);
    }
}
