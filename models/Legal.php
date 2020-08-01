<?php

namespace app\models;

use Yii;
use yii\db\ActiveQuery;
use yii\db\ActiveRecord;

/**
 * This is the model class for table "legal".
 *
 * @property int $id
 * @property string $name
 * @property int $deleted
 * @property int $legal_type_id
 * @property int $position
 *
 * @property LegalType $legalType
 * @property StatLegalDetail[] $statLegalDetails
 */
class Legal extends ActiveRecord
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
            [['name', 'legal_type_id'], 'required'],
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
     * @return ActiveQuery
     */
    public function getLegalType()
    {
        return $this->hasOne(LegalType::className(), ['id' => 'legal_type_id']);
    }

    /**
     * @return ActiveQuery
     */
    public function getStatLegalDetails()
    {
        return $this->hasMany(StatLegalDetail::className(), ['legal_id' => 'id']);
    }
}
