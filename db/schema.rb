# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160914075023) do

  create_table "accounts", force: :cascade do |t|
    t.integer  "fine"
    t.integer  "leaves"
    t.integer  "last_month_adjustment"
    t.integer  "resident_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "accounts", ["resident_id"], name: "index_accounts_on_resident_id"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"

  create_table "admin_users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "hostel"
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true

  create_table "bills", force: :cascade do |t|
    t.date     "from_date"
    t.date     "to_date"
    t.date     "expiry_date"
    t.integer  "amount"
    t.string   "payment_mode"
    t.boolean  "is_paid"
    t.integer  "resident_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "paid_amount"
  end

  add_index "bills", ["resident_id"], name: "index_bills_on_resident_id"

  create_table "hostels", force: :cascade do |t|
    t.string   "hostel"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "leaves", force: :cascade do |t|
    t.date     "start_date"
    t.date     "end_date"
    t.string   "destination"
    t.integer  "resident_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "leaves", ["resident_id"], name: "index_leaves_on_resident_id"

  create_table "microposts", force: :cascade do |t|
    t.text     "content"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "microposts", ["user_id", "created_at"], name: "index_microposts_on_user_id_and_created_at"
  add_index "microposts", ["user_id"], name: "index_microposts_on_user_id"

  create_table "rate_cards", force: :cascade do |t|
    t.integer  "daily_diet"
    t.integer  "establishment_charge"
    t.integer  "maintenance_charge"
    t.integer  "staff_welfare_charge"
    t.integer  "extra_charge"
    t.integer  "hostel_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "rate_cards", ["hostel_id"], name: "index_rate_cards_on_hostel_id"

  create_table "residents", force: :cascade do |t|
    t.string   "room_number"
    t.string   "roll_number"
    t.string   "name"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "hostel_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "roll_number"
    t.string   "email"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "password_digest"
    t.string   "remember_digest"
    t.string   "activation_digest"
    t.boolean  "activated",         default: false
    t.datetime "activated_at"
    t.string   "reset_digest"
    t.datetime "reset_sent_at"
    t.integer  "resident_id"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

end
