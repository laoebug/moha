<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "stat_officer_ministry_detail".
 *
 * @property integer $id
 * @property integer $total
 * @property integer $women
 * @property integer $stat_officer_ministry_id
 * @property integer $ministry_id
 *
 * @property Ministry $ministry
 * @property StatOfficerMinistry $statOfficerMinistry
 */
class StatOfficerMinistryDetail extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'stat_officer_ministry_detail';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['total', 'women', 'stat_officer_ministry_id', 'ministry_id'], 'integer'],
            [['stat_officer_ministry_id', 'ministry_id'], 'required'],
            [['ministry_id'], 'exist', 'skipOnError' => true, 'targetClass' => Ministry::className(), 'targetAttribute' => ['ministry_id' => 'id']],
            [['stat_officer_ministry_id'], 'exist', 'skipOnError' => true, 'targetClass' => StatOfficerMinistry::className(), 'targetAttribute' => ['stat_officer_ministry_id' => 'id']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'total' => Yii::t('app', 'Total'),
            'women' => Yii::t('app', 'Women'),
            'stat_officer_ministry_id' => Yii::t('app', 'Stat Officer Ministry ID'),
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
    public function getStatOfficerMinistry()
    {
        return $this->hasOne(StatOfficerMinistry::className(), ['id' => 'stat_officer_ministry_id']);
    }

    /**
     * @inheritdoc
     * @return StatOfficerMinistryDetailQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new StatOfficerMinistryDetailQuery(get_called_class());
    }
}
