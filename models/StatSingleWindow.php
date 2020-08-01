<?php

namespace app\models;

use Yii;
use yii\db\ActiveQuery;
use yii\db\ActiveRecord;

/**
 * This is the model class for table "stat_single_window".
 *
 * @property int $id
 * @property string $last_updated
 * @property int $user_id
 * @property int $phiscal_year_id
 * @property int $deleted
 *
 * @property PhiscalYear $phiscalYear
 * @property User $user
 * @property StatSingleWindowDetail[] $statSingleWindowDetails
 */
class StatSingleWindow extends ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'stat_single_window';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['last_updated', 'user_id', 'phiscal_year_id'], 'required'],
            [['last_updated'], 'safe'],
            [['user_id', 'phiscal_year_id', 'deleted'], 'integer'],
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
            'last_updated' => Yii::t('app', 'Last Updated'),
            'user_id' => Yii::t('app', 'User ID'),
            'phiscal_year_id' => Yii::t('app', 'Phiscal Year ID'),
            'deleted' => Yii::t('app', 'Deleted'),
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
    public function getStatSingleWindowDetails()
    {
        return $this->hasMany(StatSingleWindowDetail::className(), ['stat_single_window_id' => 'id']);
    }
}
