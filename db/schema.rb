# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20161215101311) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "exhibits", force: :cascade do |t|
    t.string   "name"
    t.string   "fond_group"
    t.string   "section"
    t.string   "collection_number"
    t.string   "inventory_number"
    t.string   "another_inv_num"
    t.string   "photo_number"
    t.string   "dating"
    t.string   "material"
    t.string   "size_or_weight"
    t.string   "condition"
    t.boolean  "renewal"
    t.string   "date_of_renewal"
    t.string   "storage_location"
    t.string   "locality"
    t.string   "museum_director"
    t.string   "custodian"
    t.string   "date_of_receipt"
    t.string   "act_of_reception_num"
    t.integer  "user_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name"
    t.integer  "role"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

end
