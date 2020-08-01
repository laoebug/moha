<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "external_link".
 *
 * @property integer $id
 * @property string $url
 * @property string $description
 * @property integer $position
 * @property integer $deleted
 * @property string $input_dt_stamp
 */
class ExternalLink extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'external_link';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['url'], 'string'],
            [['position', 'deleted'], 'integer'],
            [['input_dt_stamp'], 'safe'],
            [['description'], 'string', 'max' => 1024],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'url' => Yii::t('app', 'Url'),
            'description' => Yii::t('app', 'Description'),
            'position' => Yii::t('app', 'Position'),
            'deleted' => Yii::t('app', 'Deleted'),
            'input_dt_stamp' => Yii::t('app', 'Input Dt Stamp'),
        ];
    }
}
