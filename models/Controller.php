<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "controller".
 *
 * @property integer $id
 * @property string $code
 * @property string $deleted
 *
 * @property Action[] $actions
 */
class Controller extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'controller';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['code'], 'required'],
            [['code'], 'string', 'max' => 255],
            [['deleted'], 'string', 'max' => 1],
            [['code'], 'unique'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'code' => Yii::t('app', 'Code'),
            'deleted' => Yii::t('app', 'Deleted'),
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getActions()
    {
        return $this->hasMany(Action::className(), ['controller_id' => 'id']);
    }

    /**
     * @inheritdoc
     * @return ControllerQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new ControllerQuery(get_called_class());
    }
}
