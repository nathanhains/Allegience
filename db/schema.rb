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

ActiveRecord::Schema.define(version: 2021_04_29_172424) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "acceptances", force: :cascade do |t|
    t.integer "job_response_id"
    t.integer "responder_id"
    t.integer "heroization_id"
    t.integer "villainization_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "civilian_faction_requests", force: :cascade do |t|
    t.integer "faction_request_id"
    t.integer "requestor_id"
    t.boolean "accepted", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "civilian_factions", force: :cascade do |t|
    t.string "name"
    t.integer "owner_id"
    t.integer "requestor_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "civilians", force: :cascade do |t|
    t.string "name"
    t.string "allegience", default: "Civilian"
    t.string "avatar"
    t.integer "civilian_rank", default: 0
    t.integer "civilian_level", default: 0
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "comments", force: :cascade do |t|
    t.text "body"
    t.integer "civilian_id"
    t.integer "civilian_faction_id"
    t.integer "heroization_id"
    t.integer "villainization_id"
    t.integer "heroization_faction_id"
    t.integer "villainization_faction_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "hero_comments", force: :cascade do |t|
    t.text "body"
    t.integer "heroization_id"
    t.integer "heroization_faction_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "heroization_faction_requests", force: :cascade do |t|
    t.integer "faction_request_id"
    t.integer "requestor_id"
    t.boolean "accepted", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "heroization_factions", force: :cascade do |t|
    t.string "name"
    t.integer "owner_id"
    t.integer "joiner_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "heroizations", force: :cascade do |t|
    t.integer "hero_id"
    t.integer "user_id"
    t.string "avatar"
    t.integer "hero_rank", default: 0
    t.integer "hero_level", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "heros", force: :cascade do |t|
    t.string "name"
    t.string "avatar"
    t.string "allegience", default: "Hero"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "jobs", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.integer "requirement"
    t.integer "reward"
    t.string "power_reward"
    t.integer "requestor_user_id"
    t.integer "responder_user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "powers", force: :cascade do |t|
    t.string "name"
    t.integer "powerable_id"
    t.string "powerable_type"
    t.integer "heroization_id"
    t.integer "villainization_id"
    t.integer "hero_id"
    t.integer "villain_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.string "avatar"
    t.string "allegience", default: "Civilian"
    t.string "alter_ego", default: "N/A"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "villainization_faction_requests", force: :cascade do |t|
    t.integer "faction_request_id"
    t.integer "requestor_id"
    t.boolean "accepted", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "villainization_factions", force: :cascade do |t|
    t.string "name"
    t.integer "owner_id"
    t.integer "joiner_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "villainizations", force: :cascade do |t|
    t.integer "villain_id"
    t.integer "user_id"
    t.string "avatar"
    t.integer "villain_rank", default: 0
    t.integer "villain_level", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "villains", force: :cascade do |t|
    t.integer "user_id"
    t.string "name"
    t.string "avatar"
    t.string "allegience", default: "Villain"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
