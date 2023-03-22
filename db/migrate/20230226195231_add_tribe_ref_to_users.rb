class AddTribeRefToUsers < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :tribe, null: false, foreign_key: true
  end
end
