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

ActiveRecord::Schema[7.0].define(version: 2023_02_03_221545) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "customer_orders", force: :cascade do |t|
    t.bigint "product_id", null: false
    t.string "name"
    t.string "address"
    t.string "email"
    t.float "paid_amount"
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_customer_orders_on_product_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "title"
    t.string "brand"
    t.string "version"
    t.string "size"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "color"
  end

  create_table "supplier_orders", force: :cascade do |t|
    t.bigint "product_id", null: false
    t.float "paid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "price"
    t.index ["product_id"], name: "index_supplier_orders_on_product_id"
  end

  add_foreign_key "customer_orders", "products"
  add_foreign_key "supplier_orders", "products"
end
