<?php

namespace app\models;

use Yii;
use yii\db\ActiveQuery;
use yii\db\ActiveRecord;

/**
 * This is the model class for table "stat_officer_ethnic_detail".
 *
 * @property int $id
 * @property int $stat_officer_ethnic_id
 * @property int $total
 * @property int $officer_level_id
 * @property int $ethnic_id
 * @property int $women
 *
 * @property Ethnic $ethnic
 * @property StatOfficerEthnic $statOfficerEthnic
 */
class StatOfficerEthnicDetail extends ActiveRecord
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
            [['stat_officer_ethnic_id', 'officer_level_id', 'ethnic_id'], 'required'],
            [['stat_officer_ethnic_id', 'total', 'officer_level_id', 'ethnic_id', 'women'], 'integer'],
            [['ethnic_id'], 'exist', 'skipOnError' => true, 'targetClass' => Ethnic::className(), 'targetAttribute' => ['ethnic_id' => 'id']],
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
     * @return ActiveQuery
     */
    public function getEthnic()
    {
        return $this->hasOne(Ethnic::className(), ['id' => 'ethnic_id']);
    }

    /**
     * @return ActiveQuery
     */
    public function getStatOfficerEthnic()
    {
        return $this->hasOne(StatOfficerEthnic::className(), ['id' => 'stat_officer_ethnic_id']);
    }
}
