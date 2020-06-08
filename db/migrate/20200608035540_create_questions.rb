class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.references :lesson, foreign_key: true
      t.string :question, null: false
      t.string :correct_answer
      t.string :uid, null: false
    end
  end
end
