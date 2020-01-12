<?php

namespace app\models;

use Yii;
use yii\db\ActiveQuery;
use yii\db\ActiveRecord;

/**
 * This is the model class for table "stat_officer_ministry_detail".
 *
 * @property int $id
 * @property int $total
 * @property int $women
 * @property int $stat_officer_ministry_id
 * @property int $ministry_id
 *
 * @property Ministry $ministry
 * @property StatOfficerMinistry $statOfficerMinistry
 */
class StatOfficerMinistryDetail extends ActiveRecord
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
     * @return ActiveQuery
     */
    public function getMinistry()
    {
        return $this->hasOne(Ministry::className(), ['id' => 'ministry_id']);
    }

    /**
     * @return ActiveQuery
     */
    public function getStatOfficerMinistry()
    {
        return $this->hasOne(StatOfficerMinistry::className(), ['id' => 'stat_officer_ministry_id']);
    }
}
