class CreateTribes < ActiveRecord::Migration[7.0]
  def change
    create_table :tribes do |t|
      t.integer :keys
      t.string :color
      t.float :shareholding
      t.references :house, null: false, foreign_key: true

      t.timestamps
    end
  end
end
