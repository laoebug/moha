<?php

namespace app\models;

use Yii;
use yii\db\ActiveRecord;

/**
 * This is the model class for table "controller".
 *
 * @property int $id
 * @property string $code
 * @property int $deleted
 * @property string $description
 */
class Controller extends ActiveRecord
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
            [['deleted'], 'integer'],
            [['description'], 'string'],
            [['code'], 'string', 'max' => 255],
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
            'description' => Yii::t('app', 'Description'),
        ];
    }
}
