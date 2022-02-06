class CreateRounds < ActiveRecord::Migration[6.1]
  def change
    create_table :rounds do |t|
      t.string :title
      t.integer :pick_one
      t.integer :pick_two
      t.integer :pick_three
      t.integer :pick_four
      t.integer :pick_five
      t.integer :pick_six

      t.timestamps
    end
  end
end