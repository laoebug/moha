<?php

namespace app\models;

/**
 * This is the ActiveQuery class for [[Controller]].
 *
 * @see Controller
 */
class ControllerQuery extends \yii\db\ActiveQuery
{
    /*public function active()
    {
        return $this->andWhere('[[status]]=1');
    }*/

    /**
     * @inheritdoc
     * @return Controller[]|array
     */
    public function all($db = null)
    {
        return parent::all($db);
    }

    /**
     * @inheritdoc
     * @return Controller|array|null
     */
    public function one($db = null)
    {
        return parent::one($db);
    }
}
