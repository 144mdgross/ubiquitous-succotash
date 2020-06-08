class CreateLessons < ActiveRecord::Migration[5.2]
  def change
    create_table :lessons do |t|
      t.references :version, foreign_key: true
      t.string :content, null: false
    end
  end
end
