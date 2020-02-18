<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "aids_type".
 *
 * @property int $id
 * @property string $name
 * @property int $deleted
 * @property string $position
 *
 * @property StatAidsDetail[] $statAidsDetails
 */
class AidsType extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'aids_type';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['deleted'], 'integer'],
            [['name', 'position'], 'string', 'max' => 255],
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
    public function getStatAidsDetails()
    {
        return $this->hasMany(StatAidsDetail::className(), ['aids_type_id' => 'id']);
    }
}
