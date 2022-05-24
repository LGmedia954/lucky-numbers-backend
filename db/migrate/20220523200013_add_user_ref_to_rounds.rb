class AddUserRefToRounds < ActiveRecord::Migration[6.1]
  def change
    add_reference :rounds, :user, foreign_key: true
  end
end