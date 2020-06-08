class CreateVersionUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :version_users do |t|
      t.references :user, foreign_key: true
      t.references :version, foreign_key: true
    end
  end
end
