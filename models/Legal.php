<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "legal".
 *
 * @property integer $id
 * @property string $name
 * @property integer $deleted
 * @property integer $legal_type_id
 * @property integer $position
 *
 * @property LegalType $legalType
 * @property StatLegalDetail[] $statLegalDetails
 */
class Legal extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'legal';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['name', 'legal_type_id'], 'required','message'=>Yii::t('app','Please enter a value for') .Yii::t('app','{attribute}')],
            [['deleted', 'legal_type_id', 'position'], 'integer'],
            [['name'], 'string', 'max' => 255],
            [['legal_type_id'], 'exist', 'skipOnError' => true, 'targetClass' => LegalType::className(), 'targetAttribute' => ['legal_type_id' => 'id']],
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
            'legal_type_id' => Yii::t('app', 'Legal Type ID'),
            'position' => Yii::t('app', 'Position'),
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getLegalType()
    {
        return $this->hasOne(LegalType::className(), ['id' => 'legal_type_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getStatLegalDetails()
    {
        return $this->hasMany(StatLegalDetail::className(), ['legal_id' => 'id']);
    }

    /**
     * @inheritdoc
     * @return LegalQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new LegalQuery(get_called_class());
    }
}
