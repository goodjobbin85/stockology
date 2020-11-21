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

ActiveRecord::Schema.define(version: 20201121052209) do

  create_table "friendships", force: :cascade do |t|
    t.integer "user_id"
    t.integer "friend_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["friend_id"], name: "index_friendships_on_friend_id"
    t.index ["user_id"], name: "index_friendships_on_user_id"
  end

  create_table "stocks", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "ticker"
    t.decimal "last_price"
    t.integer "user_id"
    t.string "stock_symbol"
    t.string "primary_exchange"
    t.string "sector"
    t.decimal "high"
    t.decimal "low"
    t.decimal "change"
    t.decimal "latest_colume"
    t.decimal "avg_total_volume"
    t.decimal "market_cap"
    t.decimal "pe_ratio"
    t.decimal "fifty_two_week_high"
    t.decimal "fifty_two_week_low"
    t.decimal "ytd_change"
    t.integer "quantity"
    t.index ["user_id"], name: "index_stocks_on_user_id"
  end

  create_table "user_stocks", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "stock_id"
    t.index ["stock_id"], name: "index_user_stocks_on_stock_id"
    t.index ["user_id"], name: "index_user_stocks_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "username"
    t.boolean "admin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.integer "stock_id"
    t.string "remember_digest"
    t.index ["stock_id"], name: "index_users_on_stock_id"
  end

end
