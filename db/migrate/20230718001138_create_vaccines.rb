class CreateVaccines < ActiveRecord::Migration[7.0]
  def change
    create_table :vaccines do |t|
      t.string :name
      t.string :purpose_vaccine
      t.integer :frequency
      t.date :administration_date
      t.string :comment
      t.references :pet, null: false, foreign_key: true

      t.timestamps
    end
  end
end
