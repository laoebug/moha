<?php

namespace app\models;

use Yii;
use yii\db\ActiveQuery;
use yii\db\ActiveRecord;

/**
 * This is the model class for table "stat_explore_detail".
 *
 * @property int $id
 * @property int $province_id
 * @property int $stat_explore_id
 * @property int $mark
 * @property int $point
 * @property int $hm
 * @property int $km
 * @property string $remark
 *
 * @property Province $province
 * @property StatExplore $statExplore
 */
class StatExploreDetail extends ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'stat_explore_detail';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['province_id', 'stat_explore_id'], 'required'],
            [['province_id', 'stat_explore_id', 'mark', 'point', 'hm', 'km'], 'integer'],
            [['remark'], 'string', 'max' => 255],
            [['province_id'], 'exist', 'skipOnError' => true, 'targetClass' => Province::className(), 'targetAttribute' => ['province_id' => 'id']],
            [['stat_explore_id'], 'exist', 'skipOnError' => true, 'targetClass' => StatExplore::className(), 'targetAttribute' => ['stat_explore_id' => 'id']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'province_id' => Yii::t('app', 'Province ID'),
            'stat_explore_id' => Yii::t('app', 'Stat Explore ID'),
            'mark' => Yii::t('app', 'Mark'),
            'point' => Yii::t('app', 'Point'),
            'hm' => Yii::t('app', 'Hm'),
            'km' => Yii::t('app', 'Km'),
            'remark' => Yii::t('app', 'Remark'),
        ];
    }

    /**
     * @return ActiveQuery
     */
    public function getProvince()
    {
        return $this->hasOne(Province::className(), ['id' => 'province_id']);
    }

    /**
     * @return ActiveQuery
     */
    public function getStatExplore()
    {
        return $this->hasOne(StatExplore::className(), ['id' => 'stat_explore_id']);
    }
}
