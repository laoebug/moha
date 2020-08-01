<?php

namespace app\models;

use Yii;
use yii\db\ActiveQuery;
use yii\db\ActiveRecord;

/**
 * This is the model class for table "stat_people_move".
 *
 * @property int $id
 * @property string $last_update
 * @property int $deleted
 * @property int $user_id
 * @property int $phiscal_year_id
 *
 * @property PhiscalYear $phiscalYear
 * @property User $user
 * @property StatPeopleMoveDetail[] $statPeopleMoveDetails
 */
class StatPeopleMove extends ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'stat_people_move';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['last_update', 'deleted', 'user_id', 'phiscal_year_id'], 'required'],
            [['last_update'], 'safe'],
            [['deleted', 'user_id', 'phiscal_year_id'], 'integer'],
            [['phiscal_year_id'], 'exist', 'skipOnError' => true, 'targetClass' => PhiscalYear::className(), 'targetAttribute' => ['phiscal_year_id' => 'id']],
            [['user_id'], 'exist', 'skipOnError' => true, 'targetClass' => User::className(), 'targetAttribute' => ['user_id' => 'id']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'last_update' => 'Last Update',
            'deleted' => 'Deleted',
            'user_id' => 'User ID',
            'phiscal_year_id' => 'Phiscal Year ID',
        ];
    }

    /**
     * @return ActiveQuery
     */
    public function getPhiscalYear()
    {
        return $this->hasOne(PhiscalYear::className(), ['id' => 'phiscal_year_id']);
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
    public function getStatPeopleMoveDetails()
    {
        return $this->hasMany(StatPeopleMoveDetail::className(), ['stat_people_move_id' => 'id']);
    }
}
