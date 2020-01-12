<?php

namespace app\models;

use Yii;
use yii\db\ActiveQuery;
use yii\db\ActiveRecord;

/**
 * This is the model class for table "stat_officer_add".
 *
 * @property int $id
 * @property string $last_update
 * @property int $saved
 * @property int $phiscal_year_id
 * @property int $user_id
 *
 * @property PhiscalYear $phiscalYear
 * @property User $user
 * @property StatOfficerAddDetail[] $statOfficerAddDetails
 */
class StatOfficerAdd extends ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'stat_officer_add';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['last_update', 'saved', 'phiscal_year_id', 'user_id'], 'required'],
            [['last_update'], 'safe'],
            [['saved', 'phiscal_year_id', 'user_id'], 'integer'],
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
            'id' => Yii::t('app', 'ID'),
            'last_update' => Yii::t('app', 'Last Update'),
            'saved' => Yii::t('app', 'Saved'),
            'phiscal_year_id' => Yii::t('app', 'Phiscal Year ID'),
            'user_id' => Yii::t('app', 'User ID'),
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
    public function getStatOfficerAddDetails()
    {
        return $this->hasMany(StatOfficerAddDetail::className(), ['stat_officer_add_id' => 'id']);
    }
}
