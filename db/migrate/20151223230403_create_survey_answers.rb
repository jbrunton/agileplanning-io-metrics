class CreateSurveyAnswers < ActiveRecord::Migration
  def change
    create_table :survey_answers do |t|
      t.references :survey_response, index: true, foreign_key: true
      t.references :survey_question, index: true, foreign_key: true
      t.references :mood, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
