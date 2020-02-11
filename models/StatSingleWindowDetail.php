<?php

namespace app\models;

use Yii;
use yii\db\ActiveQuery;
use yii\db\ActiveRecord;

/**
 * This is the model class for table "stat_single_window_detail".
 *
 * @property int $id
 * @property int $province_id
 * @property int $ministry_id
 * @property string $name
 * @property string $year
 * @property int $province
 * @property int $district
 * @property int $department
 * @property int $deleted
 * @property int $stat_single_window_id
 *
 * @property Ministry $ministry
 * @property Province $province0
 * @property StatSingleWindow $statSingleWindow
 */
class StatSingleWindowDetail extends ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'stat_single_window_detail';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['province_id', 'ministry_id', 'province', 'district', 'department', 'deleted', 'stat_single_window_id'], 'integer'],
            [['stat_single_window_id'], 'required'],
            [['name', 'year'], 'string', 'max' => 255],
            [['ministry_id'], 'exist', 'skipOnError' => true, 'targetClass' => Ministry::className(), 'targetAttribute' => ['ministry_id' => 'id']],
            [['province_id'], 'exist', 'skipOnError' => true, 'targetClass' => Province::className(), 'targetAttribute' => ['province_id' => 'id']],
            [['stat_single_window_id'], 'exist', 'skipOnError' => true, 'targetClass' => StatSingleWindow::className(), 'targetAttribute' => ['stat_single_window_id' => 'id']],
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
            'ministry_id' => Yii::t('app', 'Ministry ID'),
            'name' => Yii::t('app', 'Name'),
            'year' => Yii::t('app', 'Year'),
            'province' => Yii::t('app', 'Province'),
            'district' => Yii::t('app', 'District'),
            'department' => Yii::t('app', 'Department'),
            'deleted' => Yii::t('app', 'Deleted'),
            'stat_single_window_id' => Yii::t('app', 'Stat Single Window ID'),
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
    public function getProvince0()
    {
        return $this->hasOne(Province::className(), ['id' => 'province_id']);
    }

    /**
     * @return ActiveQuery
     */
    public function getStatSingleWindow()
    {
        return $this->hasOne(StatSingleWindow::className(), ['id' => 'stat_single_window_id']);
    }
}
