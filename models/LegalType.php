<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "legal_type".
 *
 * @property integer $id
 * @property string $name
 * @property integer $deleted
 * @property integer $position
 *
 * @property Legal[] $legals
 */
class LegalType extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'legal_type';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['name'], 'required','message'=>Yii::t('app','Please enter a value for') .Yii::t('app','{attribute}')],
            [['deleted', 'position'], 'integer'],
            [['name'], 'string', 'max' => 255],
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
    public function getLegals()
    {
        return $this->hasMany(Legal::className(), ['legal_type_id' => 'id']);
    }

    /**
     * @inheritdoc
     * @return LegalTypeQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new LegalTypeQuery(get_called_class());
    }
}
