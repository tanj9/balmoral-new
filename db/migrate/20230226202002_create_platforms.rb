class CreatePlatforms < ActiveRecord::Migration[7.0]
  def change
    create_table :platforms do |t|
      t.string :name
      t.string :url
      t.references :house, null: false, foreign_key: true

      t.timestamps
    end
  end
end
