<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "goverment_level".
 *
 * @property integer $id
 * @property string $name
 * @property integer $deleted
 *
 * @property StatGovermentUnitDetail[] $statGovermentUnitDetails
 */
class GovermentLevel extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'goverment_level';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['name'], 'required'],
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
    public function getStatGovermentUnitDetails()
    {
        return $this->hasMany(StatGovermentUnitDetail::className(), ['goverment_level_id' => 'id']);
    }

    /**
     * @inheritdoc
     * @return GovermentLevelQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new GovermentLevelQuery(get_called_class());
    }
}
