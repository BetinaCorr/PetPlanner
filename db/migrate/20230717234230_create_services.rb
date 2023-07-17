class CreateServices < ActiveRecord::Migration[7.0]
  def change
    create_table :services do |t|
      t.string :name_service
      t.string :price
      t.integer :frequency
      t.datetime :starts_at
      t.datetime :ends_at
      t.references :pet, null: false, foreign_key: true
      t.references :professional, null: false, foreign_key: true

      t.timestamps
    end
  end
end
