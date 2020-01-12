<?php

namespace app\models;

use Yii;
use yii\db\ActiveQuery;
use yii\db\ActiveRecord;

/**
 * This is the model class for table "stat_association_foundation".
 *
 * @property int $id
 * @property string $last_update
 * @property int $user_id
 * @property int $phiscal_year_id
 * @property int $saved
 *
 * @property PhiscalYear $phiscalYear
 * @property User $user
 * @property StatAssociationFoundationDetail[] $statAssociationFoundationDetails
 */
class StatAssociationFoundation extends ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'stat_association_foundation';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['last_update', 'phiscal_year_id'], 'required'],
            [['last_update'], 'safe'],
            [['user_id', 'phiscal_year_id', 'saved'], 'integer'],
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
            'user_id' => Yii::t('app', 'User ID'),
            'phiscal_year_id' => Yii::t('app', 'Phiscal Year ID'),
            'saved' => Yii::t('app', 'Saved'),
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
    public function getStatAssociationFoundationDetails()
    {
        return $this->hasMany(StatAssociationFoundationDetail::className(), ['stat_association_foundation_id' => 'id']);
    }
}
