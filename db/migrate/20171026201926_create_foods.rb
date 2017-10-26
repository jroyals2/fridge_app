class CreateFoods < ActiveRecord::Migration[5.1]
  def change
    create_table :foods do |t|
      t.string :name
      t.integer :weight
      t.boolean :vegan
      t.date :placed_in_fridge
      t.references :fridge, foreign_key: true

      t.timestamps
    end
  end
end
