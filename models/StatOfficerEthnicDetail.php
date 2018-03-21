<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "stat_officer_ethnic_detail".
 *
 * @property integer $id
 * @property integer $stat_officer_ethnic_id
 * @property integer $total
 * @property integer $officer_level_id
 * @property integer $ethnic_id
 * @property integer $women
 *
 * @property Ethnic $ethnic
 * @property OfficerLevel $officerLevel
 * @property StatOfficerEthnic $statOfficerEthnic
 */
class StatOfficerEthnicDetail extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'stat_officer_ethnic_detail';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['stat_officer_ethnic_id', 'officer_level_id', 'ethnic_id'], 'required','message'=>Yii::t('app','Please enter a value for') .Yii::t('app','{attribute}')],
            [['stat_officer_ethnic_id', 'total', 'officer_level_id', 'ethnic_id', 'women'], 'integer'],
            [['ethnic_id'], 'exist', 'skipOnError' => true, 'targetClass' => Ethnic::className(), 'targetAttribute' => ['ethnic_id' => 'id']],
            [['officer_level_id'], 'exist', 'skipOnError' => true, 'targetClass' => OfficerLevel::className(), 'targetAttribute' => ['officer_level_id' => 'id']],
            [['stat_officer_ethnic_id'], 'exist', 'skipOnError' => true, 'targetClass' => StatOfficerEthnic::className(), 'targetAttribute' => ['stat_officer_ethnic_id' => 'id']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'stat_officer_ethnic_id' => Yii::t('app', 'Stat Officer Ethnic ID'),
            'total' => Yii::t('app', 'Total'),
            'officer_level_id' => Yii::t('app', 'Officer Level ID'),
            'ethnic_id' => Yii::t('app', 'Ethnic ID'),
            'women' => Yii::t('app', 'Women'),
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getEthnic()
    {
        return $this->hasOne(Ethnic::className(), ['id' => 'ethnic_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getOfficerLevel()
    {
        return $this->hasOne(OfficerLevel::className(), ['id' => 'officer_level_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getStatOfficerEthnic()
    {
        return $this->hasOne(StatOfficerEthnic::className(), ['id' => 'stat_officer_ethnic_id']);
    }

    /**
     * @inheritdoc
     * @return StatOfficerEthnicDetailQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new StatOfficerEthnicDetailQuery(get_called_class());
    }
}
