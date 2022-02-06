class CreateUserRounds < ActiveRecord::Migration[6.1]
  def change
    create_table :user_rounds do |t|
      t.references :round, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end