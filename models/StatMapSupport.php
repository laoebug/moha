<?php

namespace app\models;

use Yii;
use yii\db\ActiveQuery;
use yii\db\ActiveRecord;

/**
 * This is the model class for table "stat_map_support".
 *
 * @property int $id
 * @property string $title
 * @property string $place
 * @property string $ratio
 * @property string $mark
 * @property string $point
 * @property string $hm
 * @property string $km
 * @property string $remark
 * @property string $last_update
 * @property int $user_id
 * @property int $phiscal_year_id
 *
 * @property User $user
 * @property PhiscalYear $phiscalYear
 */
class StatMapSupport extends ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'stat_map_support';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['title', 'last_update', 'user_id', 'phiscal_year_id'], 'required'],
            [['last_update'], 'safe'],
            [['user_id', 'phiscal_year_id'], 'integer'],
            [['title', 'place', 'ratio', 'mark', 'point', 'hm', 'km', 'remark'], 'string', 'max' => 255],
            [['user_id'], 'exist', 'skipOnError' => true, 'targetClass' => User::className(), 'targetAttribute' => ['user_id' => 'id']],
            [['phiscal_year_id'], 'exist', 'skipOnError' => true, 'targetClass' => PhiscalYear::className(), 'targetAttribute' => ['phiscal_year_id' => 'id']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'title' => Yii::t('app', 'Title'),
            'place' => Yii::t('app', 'Place'),
            'ratio' => Yii::t('app', 'Ratio'),
            'mark' => Yii::t('app', 'Mark'),
            'point' => Yii::t('app', 'Point'),
            'hm' => Yii::t('app', 'Hm'),
            'km' => Yii::t('app', 'Km'),
            'remark' => Yii::t('app', 'Remark'),
            'last_update' => Yii::t('app', 'Last Update'),
            'user_id' => Yii::t('app', 'User ID'),
            'phiscal_year_id' => Yii::t('app', 'Phiscal Year ID'),
        ];
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
    public function getPhiscalYear()
    {
        return $this->hasOne(PhiscalYear::className(), ['id' => 'phiscal_year_id']);
    }
}
