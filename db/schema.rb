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

ActiveRecord::Schema.define(version: 20160513161727) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "decks", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "decks", ["name"], name: "index_decks_on_name", using: :btree

  create_table "invites", force: :cascade do |t|
    t.integer  "round_id",   null: false
    t.string   "phone"
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "invites", ["email"], name: "index_invites_on_email", using: :btree
  add_index "invites", ["phone"], name: "index_invites_on_phone", using: :btree
  add_index "invites", ["round_id"], name: "index_invites_on_round_id", using: :btree

  create_table "participant_rounds", force: :cascade do |t|
    t.integer  "round_id",       null: false
    t.integer  "participant_id", null: false
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "participant_rounds", ["participant_id"], name: "index_participant_rounds_on_participant_id", using: :btree
  add_index "participant_rounds", ["round_id"], name: "index_participant_rounds_on_round_id", using: :btree

  create_table "photos", force: :cascade do |t|
    t.integer  "round_id",   null: false
    t.integer  "user_id",    null: false
    t.integer  "prompt_id",  null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "photos", ["prompt_id"], name: "index_photos_on_prompt_id", using: :btree
  add_index "photos", ["round_id"], name: "index_photos_on_round_id", using: :btree
  add_index "photos", ["user_id"], name: "index_photos_on_user_id", using: :btree

  create_table "prompts", force: :cascade do |t|
    t.integer  "deck_id",    null: false
    t.string   "body",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "prompts", ["body"], name: "index_prompts_on_body", using: :btree
  add_index "prompts", ["deck_id"], name: "index_prompts_on_deck_id", using: :btree

  create_table "round_invites", force: :cascade do |t|
    t.integer  "round_id",   null: false
    t.integer  "invite_id",  null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "round_invites", ["invite_id"], name: "index_round_invites_on_invite_id", using: :btree
  add_index "round_invites", ["round_id"], name: "index_round_invites_on_round_id", using: :btree

  create_table "rounds", force: :cascade do |t|
    t.integer  "creator_id", null: false
    t.integer  "prompt_id",  null: false
    t.datetime "end_time",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "rounds", ["creator_id"], name: "index_rounds_on_creator_id", using: :btree
  add_index "rounds", ["prompt_id"], name: "index_rounds_on_prompt_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "first_name",      null: false
    t.string   "last_name",       null: false
    t.string   "email",           null: false
    t.string   "phone",           null: false
    t.string   "password_digest", null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", using: :btree

end
