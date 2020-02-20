<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "study_level".
 *
 * @property int $id
 * @property string $name
 * @property int $deleted
 * @property string $position
 *
 * @property StatOfficerSalary6Detail[] $statOfficerSalary6Details
 */
class StudyLevel extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'study_level';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['deleted'], 'integer'],
            [['name', 'position'], 'string', 'max' => 255],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'name' => Yii::t('app', 'Name'),
            'deleted' => Yii::t('app', 'Deleted'),
            'position' => Yii::t('app', 'Position'),
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getStatOfficerSalary6Details()
    {
        return $this->hasMany(StatOfficerSalary6Detail::className(), ['study_level_id' => 'id']);
    }
}
