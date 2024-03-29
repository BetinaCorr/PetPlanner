class CreateDiseases < ActiveRecord::Migration[7.0]
  def change
    create_table :diseases do |t|
      t.string :name
      t.string :category
      t.text :comment
      t.date :started_at
      t.references :pet, null: false, foreign_key: true

      t.timestamps
    end
  end
end
