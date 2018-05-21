<?php

namespace app\models;

use yii\base\Model;
use yii\data\ActiveDataProvider;

/**
 * StatReligionTeacherSearch represents the model behind the search form about `app\models\StatReligionTeacher`.
 */
class StatReligionTeacherSearch extends StatReligionTeacher
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id', 'saved', 'user_id', 'phiscal_year_id'], 'integer'],
            [['last_update'], 'safe'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function scenarios()
    {
        // bypass scenarios() implementation in the parent class
        return Model::scenarios();
    }

    /**
     * Creates data provider instance with search query applied
     *
     * @param array $params
     *
     * @return ActiveDataProvider
     */
    public function search($params)
    {
        $query = StatReligionTeacher::find();

        // add conditions that should always apply here

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        $this->load($params);

        if (!$this->validate()) {
            // uncomment the following line if you do not want to return any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        // grid filtering conditions
        $query->andFilterWhere([
            'id' => $this->id,
            'last_update' => $this->last_update,
            'saved' => $this->saved,
            'user_id' => $this->user_id,
            'phiscal_year_id' => $this->phiscal_year_id,
        ]);

        return $dataProvider;
    }
}
