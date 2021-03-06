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

ActiveRecord::Schema.define(version: 20171231163238) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "menus", force: :cascade do |t|
    t.string   "week"
    t.json     "daily_menus"
    t.string   "state"
    t.string   "form"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer "menu_id"
    t.integer "user_id"
    t.json    "daily_orders"
  end

  create_table "tokens", primary_key: "user_id", id: :integer, force: :cascade do |t|
    t.string "oauth_token"
  end

  create_table "user_invitations", primary_key: "token", id: :string, force: :cascade do |t|
    t.string   "email"
    t.datetime "accepted_at"
    t.datetime "created_at",  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "password_digest"
    t.string   "role",            default: "diner"
  end

  create_table "webhooks", force: :cascade do |t|
    t.string "event_id"
    t.string "event_type"
    t.json   "form_response"
  end

end
