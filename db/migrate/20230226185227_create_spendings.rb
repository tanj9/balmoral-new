class CreateSpendings < ActiveRecord::Migration[7.0]
  def change
    create_table :spendings do |t|
      t.float :amount
      t.date :date
      t.string :category
      t.text :details
      t.references :tribe, null: false, foreign_key: true

      t.timestamps
    end
  end
end
