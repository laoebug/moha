<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "ethnic".
 *
 * @property integer $id
 * @property string $name
 * @property integer $position
 * @property integer $deleted
 *
 * @property StatEthnicDetail[] $statEthnicDetails
 * @property StatOfficerEthnicDetail[] $statOfficerEthnicDetails
 */
class Ethnic extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'ethnic';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['name'], 'required'],
            [['position', 'deleted'], 'integer'],
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
            'position' => Yii::t('app', 'Position'),
            'deleted' => Yii::t('app', 'Deleted'),
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getStatEthnicDetails()
    {
        return $this->hasMany(StatEthnicDetail::className(), ['ethnic_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getStatOfficerEthnicDetails()
    {
        return $this->hasMany(StatOfficerEthnicDetail::className(), ['ethnic_id' => 'id']);
    }

    /**
     * @inheritdoc
     * @return EthnicQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new EthnicQuery(get_called_class());
    }
}
