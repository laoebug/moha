<?php

namespace app\models;

use Yii;
use yii\db\ActiveQuery;
use yii\db\ActiveRecord;

/**
 * This is the model class for table "use_subcordinate".
 *
 * @property int $user_id
 * @property int $subcordinate_user_id
 *
 * @property User $user
 * @property User $subcordinateUser
 */
class UseSubcordinate extends ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'use_subcordinate';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['user_id', 'subcordinate_user_id'], 'required'],
            [['user_id', 'subcordinate_user_id'], 'integer'],
            [['user_id', 'subcordinate_user_id'], 'unique', 'targetAttribute' => ['user_id', 'subcordinate_user_id']],
            [['user_id'], 'exist', 'skipOnError' => true, 'targetClass' => User::className(), 'targetAttribute' => ['user_id' => 'id']],
            [['subcordinate_user_id'], 'exist', 'skipOnError' => true, 'targetClass' => User::className(), 'targetAttribute' => ['subcordinate_user_id' => 'id']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'user_id' => Yii::t('app', 'User ID'),
            'subcordinate_user_id' => Yii::t('app', 'Subcordinate User ID'),
        ];
    }

    /**
     * @return ActiveQuery
     */
    public function getUser()
    {
        return $this->hasOne(User::className(), ['id' => 'user_id']);
    }

    /**
     * @return ActiveQuery
     */
    public function getSubcordinateUser()
    {
        return $this->hasOne(User::className(), ['id' => 'subcordinate_user_id']);
    }
}
