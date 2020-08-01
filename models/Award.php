<?php

namespace app\models;

use Yii;
use yii\db\ActiveQuery;
use yii\db\ActiveRecord;

/**
 * This is the model class for table "award".
 *
 * @property int $id
 * @property string $name
 * @property int $deleted
 * @property int $user_id
 * @property int $position
 *
 * @property User $user
 * @property StatGovcoinMinistryDetail[] $statGovcoinMinistryDetails
 * @property StatGovcoinProvinceDetail[] $statGovcoinProvinceDetails
 * @property StatGovoverseaMinistryDetail[] $statGovoverseaMinistryDetails
 * @property StatGovoverseaProvinceDetail[] $statGovoverseaProvinceDetails
 * @property StatHighcoinMinistryDetail[] $statHighcoinMinistryDetails
 * @property StatHighoverseaMinistryDetail[] $statHighoverseaMinistryDetails
 * @property StatHornorcoinProvinceDetail[] $statHornorcoinProvinceDetails
 * @property StatVictorycoinMinistryDetail[] $statVictorycoinMinistryDetails
 * @property StatVictorycoinProvinceDetail[] $statVictorycoinProvinceDetails
 * @property StatVictoryoverseaMinistryDetail[] $statVictoryoverseaMinistryDetails
 * @property StatVictoryoverseaProvinceDetail[] $statVictoryoverseaProvinceDetails
 */
class Award extends ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'award';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['name', 'deleted', 'user_id'], 'required'],
            [['deleted', 'user_id', 'position'], 'integer'],
            [['name'], 'string', 'max' => 255],
            [['user_id'], 'exist', 'skipOnError' => true, 'targetClass' => User::className(), 'targetAttribute' => ['user_id' => 'id']],
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
            'user_id' => Yii::t('app', 'User ID'),
            'position' => Yii::t('app', 'Position'),
        ];
    }

    /**
     * @return ActiveQuery
     */
    public function getUser()
    {
        return $this->hasOne(User::className(), ['id' => 'user_id']);
    }

    /**
     * @return ActiveQuery
     */
    public function getStatGovcoinMinistryDetails()
    {
        return $this->hasMany(StatGovcoinMinistryDetail::className(), ['award_id' => 'id']);
    }

    /**
     * @return ActiveQuery
     */
    public function getStatGovcoinProvinceDetails()
    {
        return $this->hasMany(StatGovcoinProvinceDetail::className(), ['award_id' => 'id']);
    }

    /**
     * @return ActiveQuery
     */
    public function getStatGovoverseaMinistryDetails()
    {
        return $this->hasMany(StatGovoverseaMinistryDetail::className(), ['award_id' => 'id']);
    }

    /**
     * @return ActiveQuery
     */
    public function getStatGovoverseaProvinceDetails()
    {
        return $this->hasMany(StatGovoverseaProvinceDetail::className(), ['award_id' => 'id']);
    }

    /**
     * @return ActiveQuery
     */
    public function getStatHighcoinMinistryDetails()
    {
        return $this->hasMany(StatHighcoinMinistryDetail::className(), ['award_id' => 'id']);
    }

    /**
     * @return ActiveQuery
     */
    public function getStatHighoverseaMinistryDetails()
    {
        return $this->hasMany(StatHighoverseaMinistryDetail::className(), ['award_id' => 'id']);
    }

    /**
     * @return ActiveQuery
     */
    public function getStatHornorcoinProvinceDetails()
    {
        return $this->hasMany(StatHornorcoinProvinceDetail::className(), ['award_id' => 'id']);
    }

    /**
     * @return ActiveQuery
     */
    public function getStatVictorycoinMinistryDetails()
    {
        return $this->hasMany(StatVictorycoinMinistryDetail::className(), ['award_id' => 'id']);
    }

    /**
     * @return ActiveQuery
     */
    public function getStatVictorycoinProvinceDetails()
    {
        return $this->hasMany(StatVictorycoinProvinceDetail::className(), ['award_id' => 'id']);
    }

    /**
     * @return ActiveQuery
     */
    public function getStatVictoryoverseaMinistryDetails()
    {
        return $this->hasMany(StatVictoryoverseaMinistryDetail::className(), ['award_id' => 'id']);
    }

    /**
     * @return ActiveQuery
     */
    public function getStatVictoryoverseaProvinceDetails()
    {
        return $this->hasMany(StatVictoryoverseaProvinceDetail::className(), ['award_id' => 'id']);
    }
}
