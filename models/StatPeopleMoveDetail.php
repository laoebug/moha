<?php

namespace app\models;

use Yii;
use yii\db\ActiveQuery;
use yii\db\ActiveRecord;

/**
 * This is the model class for table "stat_people_move_detail".
 *
 * @property int $id
 * @property int $stat_people_move_id
 * @property int $movein_total
 * @property int $movein_women
 * @property int $born_total
 * @property int $born_women
 * @property int $wedding_laolao
 * @property int $wedding_laofor
 * @property int $divorce_laolao
 * @property int $divorce_laofor
 * @property int $sign_total
 * @property int $sign_women
 * @property int $resign_total
 * @property int $resign_women
 * @property int $movein_village_total
 * @property int $movein_village_women
 * @property int $movein_district_total
 * @property int $movein_district_women
 * @property int $movein_province_total
 * @property int $movein_province_women
 * @property int $moveout_village_total
 * @property int $moveout_village_women
 * @property int $moveout_district_total
 * @property int $moveout_district_women
 * @property int $moveout_province_total
 * @property int $moveout_province_women
 * @property int $die_total
 * @property int $die_women
 * @property int $real_total
 * @property int $real_women
 * @property int $deleted
 *
 * @property StatPeopleMove $statPeopleMove
 */
class StatPeopleMoveDetail extends ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'stat_people_move_detail';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['stat_people_move_id'], 'required'],
            [['stat_people_move_id', 'movein_total', 'movein_women', 'born_total', 'born_women', 'wedding_laolao', 'wedding_laofor', 'divorce_laolao', 'divorce_laofor', 'sign_total', 'sign_women', 'resign_total', 'resign_women', 'movein_village_total', 'movein_village_women', 'movein_district_total', 'movein_district_women', 'movein_province_total', 'movein_province_women', 'moveout_village_total', 'moveout_village_women', 'moveout_district_total', 'moveout_district_women', 'moveout_province_total', 'moveout_province_women', 'die_total', 'die_women', 'real_total', 'real_women', 'deleted'], 'integer'],
            [['stat_people_move_id'], 'exist', 'skipOnError' => true, 'targetClass' => StatPeopleMove::className(), 'targetAttribute' => ['stat_people_move_id' => 'id']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'stat_people_move_id' => Yii::t('app', 'Stat People Move ID'),
            'movein_total' => Yii::t('app', 'Movein Total'),
            'movein_women' => Yii::t('app', 'Movein Women'),
            'born_total' => Yii::t('app', 'Born Total'),
            'born_women' => Yii::t('app', 'Born Women'),
            'wedding_laolao' => Yii::t('app', 'Wedding Laolao'),
            'wedding_laofor' => Yii::t('app', 'Wedding Laofor'),
            'divorce_laolao' => Yii::t('app', 'Divorce Laolao'),
            'divorce_laofor' => Yii::t('app', 'Divorce Laofor'),
            'sign_total' => Yii::t('app', 'Sign Total'),
            'sign_women' => Yii::t('app', 'Sign Women'),
            'resign_total' => Yii::t('app', 'Resign Total'),
            'resign_women' => Yii::t('app', 'Resign Women'),
            'movein_village_total' => Yii::t('app', 'Movein Village Total'),
            'movein_village_women' => Yii::t('app', 'Movein Village Women'),
            'movein_district_total' => Yii::t('app', 'Movein District Total'),
            'movein_district_women' => Yii::t('app', 'Movein District Women'),
            'movein_province_total' => Yii::t('app', 'Movein Province Total'),
            'movein_province_women' => Yii::t('app', 'Movein Province Women'),
            'moveout_village_total' => Yii::t('app', 'Moveout Village Total'),
            'moveout_village_women' => Yii::t('app', 'Moveout Village Women'),
            'moveout_district_total' => Yii::t('app', 'Moveout District Total'),
            'moveout_district_women' => Yii::t('app', 'Moveout District Women'),
            'moveout_province_total' => Yii::t('app', 'Moveout Province Total'),
            'moveout_province_women' => Yii::t('app', 'Moveout Province Women'),
            'die_total' => Yii::t('app', 'Die Total'),
            'die_women' => Yii::t('app', 'Die Women'),
            'real_total' => Yii::t('app', 'Real Total'),
            'real_women' => Yii::t('app', 'Real Women'),
            'deleted' => Yii::t('app', 'Deleted'),
        ];
    }

    /**
     * @return ActiveQuery
     */
    public function getStatPeopleMove()
    {
        return $this->hasOne(StatPeopleMove::className(), ['id' => 'stat_people_move_id']);
    }
}
