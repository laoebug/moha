<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "stat_officer_ministry_train_detail".
 *
 * @property integer $id
 * @property integer $tech_in_total
 * @property integer $tech_in_women
 * @property integer $tech_out_total
 * @property integer $tech_out_women
 * @property integer $theo_in_total
 * @property integer $theo_in_women
 * @property integer $theo_out_total
 * @property integer $theo_out_women
 * @property integer $stat_officer_ministry_train_id
 * @property integer $ministry_id
 *
 * @property Ministry $ministry
 * @property StatOfficerMinistryTrain $statOfficerMinistryTrain
 */
class StatOfficerMinistryTrainDetail extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'stat_officer_ministry_train_detail';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['tech_in_total', 'tech_in_women', 'tech_out_total', 'tech_out_women', 'theo_in_total', 'theo_in_women', 'theo_out_total', 'theo_out_women', 'stat_officer_ministry_train_id', 'ministry_id'], 'integer'],
            [['stat_officer_ministry_train_id', 'ministry_id'], 'required','message'=>Yii::t('app','Please enter a value for') .Yii::t('app','{attribute}')],
            [['ministry_id'], 'exist', 'skipOnError' => true, 'targetClass' => Ministry::className(), 'targetAttribute' => ['ministry_id' => 'id']],
            [['stat_officer_ministry_train_id'], 'exist', 'skipOnError' => true, 'targetClass' => StatOfficerMinistryTrain::className(), 'targetAttribute' => ['stat_officer_ministry_train_id' => 'id']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'tech_in_total' => Yii::t('app', 'Tech In Total'),
            'tech_in_women' => Yii::t('app', 'Tech In Women'),
            'tech_out_total' => Yii::t('app', 'Tech Out Total'),
            'tech_out_women' => Yii::t('app', 'Tech Out Women'),
            'theo_in_total' => Yii::t('app', 'Theo In Total'),
            'theo_in_women' => Yii::t('app', 'Theo In Women'),
            'theo_out_total' => Yii::t('app', 'Theo Out Total'),
            'theo_out_women' => Yii::t('app', 'Theo Out Women'),
            'stat_officer_ministry_train_id' => Yii::t('app', 'Stat Officer Ministry Train ID'),
            'ministry_id' => Yii::t('app', 'Ministry ID'),
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getMinistry()
    {
        return $this->hasOne(Ministry::className(), ['id' => 'ministry_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getStatOfficerMinistryTrain()
    {
        return $this->hasOne(StatOfficerMinistryTrain::className(), ['id' => 'stat_officer_ministry_train_id']);
    }

    /**
     * @inheritdoc
     * @return StatOfficerMinistryTrainDetailQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new StatOfficerMinistryTrainDetailQuery(get_called_class());
    }
}
