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

ActiveRecord::Schema.define(version: 2025_03_23_150752) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "citext"
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "guests", force: :cascade do |t|
    t.citext "email", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "token", null: false
    t.boolean "attending"
    t.string "diet"
    t.string "songs"
    t.string "notes"
    t.string "first_name"
    t.string "last_name"
    t.datetime "confirmed_at"
    t.string "address_street"
    t.string "address_number"
    t.string "address_city"
    t.string "address_zip"
    t.string "address_province"
    t.string "address_country"
    t.boolean "email_updates", default: true, null: false
    t.index ["email"], name: "index_guests_on_email", unique: true
  end

  create_table "plus_ones", force: :cascade do |t|
    t.bigint "guest_id"
    t.string "diet"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "household_role", default: "child_12_or_under", null: false
    t.index ["guest_id"], name: "index_plus_ones_on_guest_id"
  end

  add_foreign_key "plus_ones", "guests"

  create_view "attendees", sql_definition: <<-SQL
      SELECT (guests.id)::text AS id,
      guests.first_name,
      guests.last_name,
      guests.email,
      guests.address_street,
      guests.address_number,
      guests.address_city,
      guests.address_zip,
      guests.address_province,
      guests.address_country,
      guests.diet,
      guests.songs,
      guests.notes,
      NULL::character varying AS household_role,
      guests.updated_at
     FROM guests
    WHERE guests.attending
  UNION ALL
   SELECT ((plus_ones.guest_id || '-'::text) || plus_ones.id) AS id,
      plus_ones.first_name,
      plus_ones.last_name,
      NULL::citext AS email,
      NULL::character varying AS address_street,
      NULL::character varying AS address_number,
      NULL::character varying AS address_city,
      NULL::character varying AS address_zip,
      NULL::character varying AS address_province,
      NULL::character varying AS address_country,
      plus_ones.diet,
      NULL::character varying AS songs,
      NULL::character varying AS notes,
      plus_ones.household_role,
      plus_ones.updated_at
     FROM (plus_ones
       JOIN guests ON ((plus_ones.guest_id = guests.id)))
    WHERE guests.attending;
  SQL
end
