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

ActiveRecord::Schema.define(version: 20161206181809) do

  create_table "contacts", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "contact_user"
    t.string   "channel_key"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["user_id"], name: "index_contacts_on_user_id"
  end

  create_table "messages", force: :cascade do |t|
    t.integer  "from"
    t.integer  "to"
    t.integer  "contact_id"
    t.text     "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["contact_id"], name: "index_messages_on_contact_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "password"
    t.string   "salt"
    t.boolean  "confirm"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "confirmation_token"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token"
  end

end
