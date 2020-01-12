<?php

namespace app\models;

use Yii;
use yii\db\ActiveQuery;
use yii\db\ActiveRecord;

/**
 * This is the model class for table "notice".
 *
 * @property int $id
 * @property string $created_date
 * @property string $title
 * @property string $content
 * @property string $start_date
 * @property string $end_date
 * @property int $show
 * @property int $user_id
 * @property int $position
 * @property int $deleted
 *
 * @property User $user
 */
class Notice extends ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'notice';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['created_date', 'title', 'start_date', 'end_date', 'user_id'], 'required'],
            [['created_date', 'start_date', 'end_date'], 'safe'],
            [['content'], 'string'],
            [['show', 'user_id', 'position', 'deleted'], 'integer'],
            [['title'], 'string', 'max' => 255],
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
            'created_date' => Yii::t('app', 'Created Date'),
            'title' => Yii::t('app', 'Title'),
            'content' => Yii::t('app', 'Content'),
            'start_date' => Yii::t('app', 'Start Date'),
            'end_date' => Yii::t('app', 'End Date'),
            'show' => Yii::t('app', 'Show'),
            'user_id' => Yii::t('app', 'User ID'),
            'position' => Yii::t('app', 'Position'),
            'deleted' => Yii::t('app', 'Deleted'),
        ];
    }

    /**
     * @return ActiveQuery
     */
    public function getUser()
    {
        return $this->hasOne(User::className(), ['id' => 'user_id']);
    }
}
