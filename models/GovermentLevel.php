<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "goverment_level".
 *
 * @property integer $id
 * @property string $name
 * @property integer $deleted
 * @property integer $position
 */
class GovermentLevel extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'goverment_level';
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
     * @inheritdoc
     * @return GovermentLevelQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new GovermentLevelQuery(get_called_class());
    }
}
