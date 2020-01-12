<?php

namespace app\models;

use Yii;
use yii\db\ActiveQuery;
use yii\db\ActiveRecord;

/**
 * This is the model class for table "user_has_branch".
 *
 * @property int $user_id
 * @property int $branch_id
 *
 * @property Branch $branch
 */
class UserHasBranch extends ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'user_has_branch';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['user_id', 'branch_id'], 'required'],
            [['user_id', 'branch_id'], 'integer'],
            [['user_id', 'branch_id'], 'unique', 'targetAttribute' => ['user_id', 'branch_id']],
            [['branch_id'], 'exist', 'skipOnError' => true, 'targetClass' => Branch::className(), 'targetAttribute' => ['branch_id' => 'id']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'user_id' => Yii::t('app', 'User ID'),
            'branch_id' => Yii::t('app', 'Branch ID'),
        ];
    }

    /**
     * @return ActiveQuery
     */
    public function getBranch()
    {
        return $this->hasOne(Branch::className(), ['id' => 'branch_id']);
    }
}
