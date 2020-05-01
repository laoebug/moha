<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "stat_ministry".
 *
 * @property int $id
 * @property string $last_update
 * @property int $user_id
 * @property int $deleted
 * @property int $from_year
 * @property int $to_year
 * @property string $batch
 *
 * @property User $user
 * @property StatMinistryDetail[] $statMinistryDetails
 */
class StatMinistry extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'stat_ministry';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['last_update'], 'safe'],
            [['user_id'], 'required'],
            [['user_id', 'deleted', 'from_year', 'to_year'], 'integer'],
            [['batch'], 'string', 'max' => 255],
            [['user_id'], 'exist', 'skipOnError' => true, 'targetClass' => User::className(), 'targetAttribute' => ['user_id' => 'id']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'last_update' => Yii::t('app', 'Last Update'),
            'user_id' => Yii::t('app', 'User ID'),
            'deleted' => Yii::t('app', 'Deleted'),
            'from_year' => Yii::t('app', 'From Year'),
            'to_year' => Yii::t('app', 'To Year'),
            'batch' => Yii::t('app', 'Batch'),
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getUser()
    {
        return $this->hasOne(User::className(), ['id' => 'user_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getStatMinistryDetails()
    {
        return $this->hasMany(StatMinistryDetail::className(), ['stat_ministry_id' => 'id']);
    }
}
