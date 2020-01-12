<?php

namespace app\models;

use Yii;
use yii\db\ActiveQuery;
use yii\db\ActiveRecord;

/**
 * This is the model class for table "branch".
 *
 * @property int $id
 * @property string $code
 * @property string $name
 * @property string $address
 * @property string $tel
 * @property int $deleted
 * @property int $position
 * @property string $remark
 * @property int $user_id
 * @property string $last_update
 * @property int $ministry_id
 *
 * @property Ministry $ministry
 * @property User $user
 * @property GovermentUnit[] $govermentUnits
 * @property UserHasBranch[] $userHasBranches
 */
class Branch extends ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'branch';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['name', 'user_id', 'ministry_id'], 'required'],
            [['address', 'remark'], 'string'],
            [['deleted', 'position', 'user_id', 'ministry_id'], 'integer'],
            [['last_update'], 'safe'],
            [['code'], 'string', 'max' => 10],
            [['name', 'tel'], 'string', 'max' => 255],
            [['ministry_id'], 'exist', 'skipOnError' => true, 'targetClass' => Ministry::className(), 'targetAttribute' => ['ministry_id' => 'id']],
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
            'code' => Yii::t('app', 'Code'),
            'name' => Yii::t('app', 'Name'),
            'address' => Yii::t('app', 'Address'),
            'tel' => Yii::t('app', 'Tel'),
            'deleted' => Yii::t('app', 'Deleted'),
            'position' => Yii::t('app', 'Position'),
            'remark' => Yii::t('app', 'Remark'),
            'user_id' => Yii::t('app', 'User ID'),
            'last_update' => Yii::t('app', 'Last Update'),
            'ministry_id' => Yii::t('app', 'Ministry ID'),
        ];
    }

    /**
     * @return ActiveQuery
     */
    public function getMinistry()
    {
        return $this->hasOne(Ministry::className(), ['id' => 'ministry_id']);
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
    public function getGovermentUnits()
    {
        return $this->hasMany(GovermentUnit::className(), ['branch_id' => 'id']);
    }

    /**
     * @return ActiveQuery
     */
    public function getUserHasBranches()
    {
        return $this->hasMany(UserHasBranch::className(), ['branch_id' => 'id']);
    }
}
