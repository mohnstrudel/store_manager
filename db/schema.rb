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

ActiveRecord::Schema[7.0].define(version: 2023_02_06_113623) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "brands", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "customer_orders", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "email"
    t.float "paid_amount"
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "product_id"
    t.index ["product_id"], name: "index_customer_orders_on_product_id"
  end

  create_table "expenses", force: :cascade do |t|
    t.string "expense_type"
    t.float "total_amount"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "franchises", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.bigint "product_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_orders_on_product_id"
  end

  create_table "payments", force: :cascade do |t|
    t.string "payable_type", null: false
    t.bigint "payable_id", null: false
    t.integer "parent_id"
    t.float "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["payable_type", "payable_id"], name: "index_payments_on_payable"
  end

  create_table "products", force: :cascade do |t|
    t.string "title"
    t.string "version"
    t.string "size"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "color"
    t.bigint "brand_id"
    t.bigint "franchise_id"
    t.index ["brand_id"], name: "index_products_on_brand_id"
    t.index ["franchise_id"], name: "index_products_on_franchise_id"
  end

  create_table "supplier_orders", force: :cascade do |t|
    t.float "paid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "price"
    t.string "supplier"
    t.string "order_number"
    t.integer "amount"
    t.bigint "product_id"
    t.index ["product_id"], name: "index_supplier_orders_on_product_id"
  end

  add_foreign_key "customer_orders", "products"
  add_foreign_key "orders", "products"
  add_foreign_key "products", "brands"
  add_foreign_key "products", "franchises"
  add_foreign_key "supplier_orders", "products"
end
