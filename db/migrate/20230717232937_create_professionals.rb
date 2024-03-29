class CreateProfessionals < ActiveRecord::Migration[7.0]
  def change
    create_table :professionals do |t|
      t.string :name
      t.string :address
      t.string :phone_number
      t.references :pet, null: false, foreign_key: true

      t.timestamps
    end
  end
end
