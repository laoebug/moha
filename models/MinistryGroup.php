<?php

namespace app\models;

use Yii;
use yii\db\ActiveQuery;
use yii\db\ActiveRecord;

/**
 * This is the model class for table "ministry_group".
 *
 * @property int $id
 * @property string $name
 * @property int $deleted
 * @property int $position
 * @property string $input_dt_stamp
 * @property int $user_id
 *
 * @property Ministry[] $ministries
 */
class MinistryGroup extends ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'ministry_group';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['name'], 'required'],
            [['deleted', 'position', 'user_id'], 'integer'],
            [['input_dt_stamp'], 'safe'],
            [['name'], 'string', 'max' => 255],
            [['name'], 'unique'],
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
            'deleted' => Yii::t('app', 'Deleted'),
            'position' => Yii::t('app', 'Position'),
            'input_dt_stamp' => Yii::t('app', 'Input Dt Stamp'),
            'user_id' => Yii::t('app', 'User ID'),
        ];
    }

    /**
     * @return ActiveQuery
     */
    public function getMinistries()
    {
        return $this->hasMany(Ministry::className(), ['ministry_group_id' => 'id']);
    }
}
