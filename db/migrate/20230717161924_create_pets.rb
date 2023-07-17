class CreatePets < ActiveRecord::Migration[7.0]
  def change
    create_table :pets do |t|
      t.string :name
      t.string :breed
      t.string :species
      t.integer :age
      t.string :gender
      t.string :clothes_size
      t.integer :walk
      t.boolean :adopted
      t.date :arrival_date
      t.float :weight
      t.boolean :sterilized
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
