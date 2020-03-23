<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "stat_register_people_detail".
 *
 * @property int $id
 * @property int $born
 * @property int $die
 * @property int $married_laolao
 * @property int $divorce_laolao
 * @property int $movein
 * @property int $moveout
 * @property int $stat_register_people_id
 *
 * @property StatRegisterPeople $statRegisterPeople
 */
class StatRegisterPeopleDetail extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'stat_register_people_detail';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['born', 'die', 'married_laolao', 'divorce_laolao', 'movein', 'moveout', 'stat_register_people_id'], 'integer'],
            [['stat_register_people_id'], 'required'],
            [['stat_register_people_id'], 'exist', 'skipOnError' => true, 'targetClass' => StatRegisterPeople::className(), 'targetAttribute' => ['stat_register_people_id' => 'id']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'born' => 'Born',
            'die' => 'Die',
            'married_laolao' => 'Married Laolao',
            'divorce_laolao' => 'Divorce Laolao',
            'movein' => 'Movein',
            'moveout' => 'Moveout',
            'stat_register_people_id' => 'Stat Register People ID',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getStatRegisterPeople()
    {
        return $this->hasOne(StatRegisterPeople::className(), ['id' => 'stat_register_people_id']);
    }
}
