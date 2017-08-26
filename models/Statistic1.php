<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "statistic1".
 *
 * @property integer $id
 * @property integer $user_id
 * @property string $last_update
 * @property string $status
 *
 * @property User $user
 */
class Statistic1 extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'statistic1';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['user_id', 'last_update', 'status'], 'required'],
            [['user_id'], 'integer'],
            [['last_update'], 'safe'],
            [['status'], 'string', 'max' => 45],
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
            'user_id' => Yii::t('app', 'User ID'),
            'last_update' => Yii::t('app', 'Last Update'),
            'status' => Yii::t('app', 'Status'),
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
     * @inheritdoc
     * @return Statistic1Query the active query used by this AR class.
     */
    public static function find()
    {
        return new Statistic1Query(get_called_class());
    }
}
