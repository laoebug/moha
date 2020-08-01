<?php

namespace app\models;

use Yii;
use yii\db\ActiveQuery;
use yii\db\ActiveRecord;

/**
 * This is the model class for table "ethnic".
 *
 * @property int $id
 * @property string $name
 * @property int $position
 * @property int $deleted
 *
 * @property StatEthnicDetail[] $statEthnicDetails
 * @property StatOfficerEthnicDetail[] $statOfficerEthnicDetails
 */
class Ethnic extends ActiveRecord
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
     * @return ActiveQuery
     */
    public function getStatEthnicDetails()
    {
        return $this->hasMany(StatEthnicDetail::className(), ['ethnic_id' => 'id']);
    }

    /**
     * @return ActiveQuery
     */
    public function getStatOfficerEthnicDetails()
    {
        return $this->hasMany(StatOfficerEthnicDetail::className(), ['ethnic_id' => 'id']);
    }
}
