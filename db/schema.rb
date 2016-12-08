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

ActiveRecord::Schema.define(version: 20161208030830) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "customers", force: :cascade do |t|
    t.integer  "tenant_id"
    t.string   "customer_code"
    t.string   "name"
    t.text     "address"
    t.string   "phone"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["customer_code"], name: "index_customers_on_customer_code", unique: true, using: :btree
  end

  create_table "product_items", force: :cascade do |t|
    t.integer  "tenant_id"
    t.integer  "transactionable_id"
    t.string   "transactionable_type"
    t.integer  "product_id"
    t.decimal  "price",                precision: 12, scale: 2
    t.decimal  "price_sell",           precision: 12, scale: 2
    t.float    "total"
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
  end

  create_table "products", force: :cascade do |t|
    t.integer  "tenant_id"
    t.string   "product_code"
    t.string   "name"
    t.string   "unit"
    t.decimal  "price",        precision: 12, scale: 2
    t.float    "profit"
    t.float    "stock"
    t.decimal  "price_sell"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  create_table "purchases", force: :cascade do |t|
    t.integer  "tenant_id"
    t.string   "transaction_code"
    t.datetime "date"
    t.integer  "suplier_id"
    t.integer  "created_by"
    t.decimal  "total_amount",     precision: 12, scale: 2
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
  end

  create_table "sales", force: :cascade do |t|
    t.integer  "tenant_id"
    t.string   "transaction_code"
    t.datetime "date"
    t.integer  "suplier_id"
    t.integer  "created_by"
    t.decimal  "total_amount",     precision: 12, scale: 2
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
  end

  create_table "supliers", force: :cascade do |t|
    t.string   "suplier_code"
    t.string   "name"
    t.text     "address"
    t.string   "city"
    t.string   "state"
    t.string   "phone"
    t.string   "fax"
    t.string   "contact"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "tenants", force: :cascade do |t|
    t.string   "url"
    t.boolean  "is_active",  default: true
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.index ["url"], name: "index_tenants_on_url", unique: true, using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: ""
    t.string   "username",               default: "", null: false
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
    t.integer  "tenant_id"
    t.string   "access_token"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
    t.index ["username", "tenant_id"], name: "index_users_on_username_and_tenant_id", unique: true, using: :btree
  end

end
