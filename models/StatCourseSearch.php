<?php

namespace app\models;

use yii\base\Model;
use yii\data\ActiveDataProvider;

/**
 * StatCourseSearch represents the model behind the search form about `app\models\StatCourse`.
 */
class StatCourseSearch extends StatCourse
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id', 'deleted', 'position', 'user_id', 'stat_course_id'], 'integer'],
            [['name', 'last_update'], 'safe'],
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
        $query = StatCourse::find();

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
            'deleted' => $this->deleted,
            'position' => $this->position,
            'last_update' => $this->last_update,
            'user_id' => $this->user_id,
            'stat_course_id' => $this->stat_course_id,
        ]);

        $query->andFilterWhere(['like', 'name', $this->name]);

        return $dataProvider;
    }
}
