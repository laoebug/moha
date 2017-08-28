<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "legal_status".
 *
 * @property integer $id
 * @property string $name
 * @property integer $deleted
 *
 * @property StatLegalDetail[] $statLegalDetails
 */
class LegalStatus extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'legal_status';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['name', 'deleted'], 'required'],
            [['deleted'], 'integer'],
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
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getStatLegalDetails()
    {
        return $this->hasMany(StatLegalDetail::className(), ['legal_status_id' => 'id']);
    }

    /**
     * @inheritdoc
     * @return LegalStatusQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new LegalStatusQuery(get_called_class());
    }
}