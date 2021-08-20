# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_08_20_062222) do

  create_table "connections", force: :cascade do |t|
    t.integer "userid_1"
    t.integer "userid_2"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "matchings", force: :cascade do |t|
    t.integer "userid_1"
    t.integer "userid_2"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "queries", force: :cascade do |t|
    t.integer "userid_1"
    t.integer "userid_2"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "relationships", force: :cascade do |t|
    t.integer "friend1_id"
    t.integer "friend2_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["friend1_id", "friend2_id"], name: "index_relationships_on_friend1_id_and_friend2_id", unique: true
    t.index ["friend1_id"], name: "index_relationships_on_friend1_id"
    t.index ["friend2_id"], name: "index_relationships_on_friend2_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "provider", null: false
    t.string "uid", null: false
    t.string "twitter_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "image_url", null: false
    t.index ["provider", "uid"], name: "index_users_on_provider_and_uid", unique: true
  end

end
