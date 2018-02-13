<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "user_subordinate".
 *
 * @property integer $user_id
 * @property integer $subordinate_user_id
 *
 * @property User $user
 * @property User $subordinateUser
 */
class UserSubordinate extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'user_subordinate';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['user_id', 'subordinate_user_id'], 'required','message'=>Yii::t('app','Please enter a value for') .Yii::t('app','{attribute}')],
            [['user_id', 'subordinate_user_id'], 'integer'],
            [['user_id'], 'exist', 'skipOnError' => true, 'targetClass' => User::className(), 'targetAttribute' => ['user_id' => 'id']],
            [['subordinate_user_id'], 'exist', 'skipOnError' => true, 'targetClass' => User::className(), 'targetAttribute' => ['subordinate_user_id' => 'id']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'user_id' => Yii::t('app', 'User ID'),
            'subordinate_user_id' => Yii::t('app', 'Subordinate User ID'),
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
    public function getSubordinateUser()
    {
        return $this->hasOne(User::className(), ['id' => 'subordinate_user_id']);
    }

    /**
     * @inheritdoc
     * @return UserSubordinateQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new UserSubordinateQuery(get_called_class());
    }
}
