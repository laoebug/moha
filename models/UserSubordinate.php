<?php

namespace app\models;

use Yii;
use yii\db\ActiveRecord;

/**
 * This is the model class for table "user_subordinate".
 *
 * @property int $user_id
 * @property int $subordinate_user_id
 */
class UserSubordinate extends ActiveRecord
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
            [['user_id', 'subordinate_user_id'], 'required'],
            [['user_id', 'subordinate_user_id'], 'integer'],
            [['user_id', 'subordinate_user_id'], 'unique', 'targetAttribute' => ['user_id', 'subordinate_user_id']],
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
}
