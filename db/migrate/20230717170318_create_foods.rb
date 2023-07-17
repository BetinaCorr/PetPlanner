class CreateFoods < ActiveRecord::Migration[7.0]
  def change
    create_table :foods do |t|
      t.string :name
      t.string :category
      t.string :price
      t.date :purchase_date
      t.references :pet, null: false, foreign_key: true

      t.timestamps
    end
  end
end
