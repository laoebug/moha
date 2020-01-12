<?php

namespace app\models;

use Yii;
use yii\db\ActiveQuery;
use yii\db\ActiveRecord;

/**
 * This is the model class for table "stat_officer_ministry_add_detail".
 *
 * @property int $id
 * @property int $stat_officer_ministry_add_id
 * @property int $add
 * @property int $resign
 * @property int $ministry_id
 *
 * @property Ministry $ministry
 * @property StatOfficerMinistryAdd $statOfficerMinistryAdd
 */
class StatOfficerMinistryAddDetail extends ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'stat_officer_ministry_add_detail';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['stat_officer_ministry_add_id', 'ministry_id'], 'required'],
            [['stat_officer_ministry_add_id', 'add', 'resign', 'ministry_id'], 'integer'],
            [['ministry_id'], 'exist', 'skipOnError' => true, 'targetClass' => Ministry::className(), 'targetAttribute' => ['ministry_id' => 'id']],
            [['stat_officer_ministry_add_id'], 'exist', 'skipOnError' => true, 'targetClass' => StatOfficerMinistryAdd::className(), 'targetAttribute' => ['stat_officer_ministry_add_id' => 'id']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'stat_officer_ministry_add_id' => Yii::t('app', 'Stat Officer Ministry Add ID'),
            'add' => Yii::t('app', 'Add'),
            'resign' => Yii::t('app', 'Resign'),
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
    public function getStatOfficerMinistryAdd()
    {
        return $this->hasOne(StatOfficerMinistryAdd::className(), ['id' => 'stat_officer_ministry_add_id']);
    }
}
