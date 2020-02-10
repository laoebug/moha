<?php

namespace app\models;

use Yii;
use yii\db\ActiveQuery;
use yii\db\ActiveRecord;

/**
 * This is the model class for table "legal_type".
 *
 * @property int $id
 * @property string $name
 * @property int $deleted
 * @property int $position
 *
 * @property Legal[] $legals
 * @property StatLegalDetail[] $statLegalDetails
 *
 */
class LegalType extends ActiveRecord
{
    // public $stat_legal_details=[];
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
            [['name'], 'required'],
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
     * @return ActiveQuery
     */
    public function getLegals()
    {
        return $this->hasMany(Legal::className(), ['legal_type_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getStatLegalDetails()
    {
        return $this->hasMany(StatLegalDetail::className(), ['legal_type_id' => 'id']);
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
