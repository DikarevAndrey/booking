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

ActiveRecord::Schema.define(version: 20180430155157) do

  create_table "administrators", force: :cascade do |t|
    t.integer "place_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["place_id"], name: "index_administrators_on_place_id"
    t.index ["user_id"], name: "index_administrators_on_user_id"
  end

  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cuisines", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cuisines_places", id: false, force: :cascade do |t|
    t.integer "place_id", null: false
    t.integer "cuisine_id", null: false
  end

  create_table "features", force: :cascade do |t|
    t.boolean "beer", default: false
    t.boolean "smoke_allowed", default: false
    t.boolean "cocktails", default: false
    t.boolean "hookah", default: false
    t.integer "place_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["place_id"], name: "index_features_on_place_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string "address"
    t.string "subway"
    t.integer "city_id"
    t.integer "place_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_locations_on_city_id"
    t.index ["place_id"], name: "index_locations_on_place_id"
  end

  create_table "offers", force: :cascade do |t|
    t.string "name"
    t.boolean "is_active"
    t.text "content"
    t.integer "place_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["place_id"], name: "index_offers_on_place_id"
  end

  create_table "orders", force: :cascade do |t|
    t.datetime "visit_date_time"
    t.integer "guests_count", default: 1
    t.text "comment"
    t.integer "place_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["place_id"], name: "index_orders_on_place_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "places", force: :cascade do |t|
    t.string "kind", null: false
    t.string "name", null: false
    t.integer "min_age", default: 0, null: false
    t.string "open_hours"
    t.integer "avg_bill"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ratings", force: :cascade do |t|
    t.integer "points", default: 0, null: false
    t.integer "stars", default: 0, null: false
    t.integer "place_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["place_id"], name: "index_ratings_on_place_id"
  end

  create_table "recomendations", force: :cascade do |t|
    t.string "fav_type"
    t.string "fav_cuisine"
    t.integer "user_id"
    t.integer "place_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["place_id"], name: "index_recomendations_on_place_id"
    t.index ["user_id"], name: "index_recomendations_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "points", null: false
    t.text "comment"
    t.integer "place_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["place_id"], name: "index_reviews_on_place_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "born_date"
    t.string "tel_number"
    t.boolean "admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
