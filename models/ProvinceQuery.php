<?php

namespace app\models;

/**
 * This is the ActiveQuery class for [[Province]].
 *
 * @see Province
 */
use Yii;

class ProvinceQuery extends \yii\db\ActiveQuery
{
    /*
     * public function active()
     * {
     * return $this->andWhere('[[status]]=1');
     * }
     */
    public function init()
    {
        parent::init();
        $this->alias('p');
        $user = Yii::$app->user->identity;
        if (!empty ($user->role->province_id)) {
            $this->andWhere([
                'id' => $user->role->province_id
            ]);
        }
        $this->orderBy('p.position');
    }

    /**
     * @inheritdoc
     *
     * @return Province[]|array
     */
    public function all($db = null)
    {
        return parent::all($db);
    }

    /**
     * @inheritdoc
     *
     * @return Province|array|null
     */
    public function one($db = null)
    {
        return parent::one($db);
    }
}
