<?php

namespace app\models;

use Yii;
use yii\db\ActiveQuery;
use yii\db\ActiveRecord;

/**
 * This is the model class for table "user_has_role".
 *
 * @property int $user_id
 * @property int $role_id
 * @property string $set_date
 *
 * @property Role $role
 */
class UserHasRole extends ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'user_has_role';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['user_id', 'role_id', 'set_date'], 'required'],
            [['user_id', 'role_id'], 'integer'],
            [['set_date'], 'safe'],
            [['user_id', 'role_id'], 'unique', 'targetAttribute' => ['user_id', 'role_id']],
            [['role_id'], 'exist', 'skipOnError' => true, 'targetClass' => Role::className(), 'targetAttribute' => ['role_id' => 'id']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'user_id' => Yii::t('app', 'User ID'),
            'role_id' => Yii::t('app', 'Role ID'),
            'set_date' => Yii::t('app', 'Set Date'),
        ];
    }

    /**
     * @return ActiveQuery
     */
    public function getRole()
    {
        return $this->hasOne(Role::className(), ['id' => 'role_id']);
    }
}
