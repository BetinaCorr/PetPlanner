class CreateMedications < ActiveRecord::Migration[7.0]
  def change
    create_table :medications do |t|
      t.string :name
      t.date :administration_date
      t.date :expiration_date
      t.integer :frequency
      t.string :purpose_medication
      t.string :comment
      t.references :pet, null: false, foreign_key: true

      t.timestamps
    end
  end
end
