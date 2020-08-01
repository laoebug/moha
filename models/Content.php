<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "content".
 *
 * @property string $code
 * @property string $value
 */
class Content extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'content';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['code'], 'required'],
            [['value'], 'string'],
            [['code'], 'string', 'max' => 20],
            [['code'], 'unique'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'code' => Yii::t('app', 'Code'),
            'value' => Yii::t('app', 'Value'),
        ];
    }
}
