<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "use_subcordinate".
 *
 * @property integer $user_id
 * @property integer $subcordinate_user_id
 *
 * @property User $user
 * @property User $subcordinateUser
 */
class UseSubcordinate extends \yii\db\ActiveRecord
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
     * @return \yii\db\ActiveQuery
     */
    public function getUser()
    {
        return $this->hasOne(User::className(), ['id' => 'user_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getSubcordinateUser()
    {
        return $this->hasOne(User::className(), ['id' => 'subcordinate_user_id']);
    }

    /**
     * @inheritdoc
     * @return UseSubcordinateQuery the active query used by this AR class.
     */
    public static function find()
    {
        return new UseSubcordinateQuery(get_called_class());
    }
}
