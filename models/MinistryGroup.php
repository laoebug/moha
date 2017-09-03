<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "ministry_group".
 *
 * @property integer $id
 * @property string $name
 * @property integer $deleted
 * @property integer $position
 *
 * @property Ministry[] $ministries
 */
class MinistryGroup extends \yii\db\ActiveRecord
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
            [['deleted', 'position'], 'integer'],
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
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getMinistries()
    {
        return $this->hasMany(Ministry::className(), ['ministry_group_id' => 'id']);
    }

    /**
     * @inheritdoc
     * @return MinistryGroupQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new MinistryGroupQuery(get_called_class());
    }
}
