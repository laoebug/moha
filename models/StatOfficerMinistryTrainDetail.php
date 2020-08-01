<?php

namespace app\models;

use Yii;
use yii\db\ActiveQuery;
use yii\db\ActiveRecord;

/**
 * This is the model class for table "stat_officer_ministry_train_detail".
 *
 * @property int $id
 * @property int $tech_in_total
 * @property int $tech_in_women
 * @property int $tech_out_total
 * @property int $tech_out_women
 * @property int $theo_in_total
 * @property int $theo_in_women
 * @property int $theo_out_total
 * @property int $theo_out_women
 * @property int $stat_officer_ministry_train_id
 * @property int $ministry_id
 *
 * @property Ministry $ministry
 * @property StatOfficerMinistryTrain $statOfficerMinistryTrain
 */
class StatOfficerMinistryTrainDetail extends ActiveRecord
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
            [['stat_officer_ministry_train_id', 'ministry_id'], 'required'],
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
     * @return ActiveQuery
     */
    public function getMinistry()
    {
        return $this->hasOne(Ministry::className(), ['id' => 'ministry_id']);
    }

    /**
     * @return ActiveQuery
     */
    public function getStatOfficerMinistryTrain()
    {
        return $this->hasOne(StatOfficerMinistryTrain::className(), ['id' => 'stat_officer_ministry_train_id']);
    }
}
