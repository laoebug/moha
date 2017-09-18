<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "stat_explore_detail".
 *
 * @property integer $id
 * @property integer $province_id
 * @property integer $stat_explore_id
 * @property integer $mark
 * @property integer $point
 * @property integer $hm
 * @property integer $km
 * @property string $remark
 *
 * @property Province $province
 * @property StatExplore $statExplore
 */
class StatExploreDetail extends \yii\db\ActiveRecord
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
     * @return \yii\db\ActiveQuery
     */
    public function getProvince()
    {
        return $this->hasOne(Province::className(), ['id' => 'province_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getStatExplore()
    {
        return $this->hasOne(StatExplore::className(), ['id' => 'stat_explore_id']);
    }

    /**
     * @inheritdoc
     * @return StatExploreDetailQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new StatExploreDetailQuery(get_called_class());
    }
}
