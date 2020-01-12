<?php

namespace app\models;

use Yii;
use yii\db\ActiveQuery;
use yii\db\ActiveRecord;

/**
 * This is the model class for table "stat_officer_need_detail".
 *
 * @property int $id
 * @property int $center
 * @property int $province
 * @property int $district
 * @property int $stat_officer_need_id
 *
 * @property StatOfficerNeed $statOfficerNeed
 */
class StatOfficerNeedDetail extends ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'stat_officer_need_detail';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['center', 'province', 'district', 'stat_officer_need_id'], 'integer'],
            [['stat_officer_need_id'], 'required'],
            [['stat_officer_need_id'], 'exist', 'skipOnError' => true, 'targetClass' => StatOfficerNeed::className(), 'targetAttribute' => ['stat_officer_need_id' => 'id']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'center' => Yii::t('app', 'Center'),
            'province' => Yii::t('app', 'Province'),
            'district' => Yii::t('app', 'District'),
            'stat_officer_need_id' => Yii::t('app', 'Stat Officer Need ID'),
        ];
    }

    /**
     * @return ActiveQuery
     */
    public function getStatOfficerNeed()
    {
        return $this->hasOne(StatOfficerNeed::className(), ['id' => 'stat_officer_need_id']);
    }
}
