# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.


ActiveRecord::Schema[7.0].define(version: 2023_07_18_001138) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "allergies", force: :cascade do |t|
    t.string "name"
    t.string "comment"
    t.bigint "pet_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pet_id"], name: "index_allergies_on_pet_id"
  end

  create_table "foods", force: :cascade do |t|
    t.string "name"
    t.string "category"
    t.string "price"
    t.date "purchase_date"
    t.bigint "pet_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pet_id"], name: "index_foods_on_pet_id"
  end

  create_table "medications", force: :cascade do |t|
    t.string "name"
    t.date "administration_date"
    t.date "expiration_date"
    t.integer "frequency"
    t.string "purpose_medication"
    t.string "comment"
    t.bigint "pet_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pet_id"], name: "index_medications_on_pet_id"
  end

  create_table "pets", force: :cascade do |t|
    t.string "name"
    t.string "breed"
    t.string "species"
    t.integer "age"
    t.string "gender"
    t.string "clothes_size"
    t.integer "walk"
    t.boolean "adopted"
    t.date "arrival_date"
    t.float "weight"
    t.boolean "sterilized"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_pets_on_user_id"
  end

  create_table "professionals", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "phone_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "services", force: :cascade do |t|
    t.string "name_service"
    t.string "price"
    t.integer "frequency"
    t.datetime "starts_at"
    t.datetime "ends_at"
    t.bigint "pet_id", null: false
    t.bigint "professional_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pet_id"], name: "index_services_on_pet_id"
    t.index ["professional_id"], name: "index_services_on_professional_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end


  create_table "vaccines", force: :cascade do |t|
    t.string "name"
    t.string "purpose_vaccine"
    t.integer "frequency"
    t.date "administration_date"
    t.string "comment"
    t.bigint "pet_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pet_id"], name: "index_vaccines_on_pet_id"
  end


  add_foreign_key "allergies", "pets"
  add_foreign_key "foods", "pets"
  add_foreign_key "medications", "pets"
  add_foreign_key "pets", "users"
  add_foreign_key "services", "pets"
  add_foreign_key "services", "professionals"
  add_foreign_key "vaccines", "pets"
end
