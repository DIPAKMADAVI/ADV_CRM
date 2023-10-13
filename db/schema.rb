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

ActiveRecord::Schema[7.0].define(version: 2023_09_07_123013) do
  create_table "adv_channels", charset: "utf8mb4", force: :cascade do |t|
    t.string "channel_name"
    t.string "sub_channal_name"
    t.string "description"
    t.boolean "is_active", default: true
    t.boolean "is_remove", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "advertisement_plans", charset: "utf8mb4", force: :cascade do |t|
    t.string "title_of_adv"
    t.bigint "customer_id"
    t.bigint "adv_media_id"
    t.bigint "business_detail_id"
    t.string "placement"
    t.string "budget_plan"
    t.datetime "est_start_date"
    t.datetime "est_end_date"
    t.string "adv_plan_status"
    t.string "description"
    t.boolean "is_active", default: true
    t.boolean "is_remove", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "customer_name"
    t.string "selected_media"
    t.index ["adv_media_id"], name: "index_advertisement_plans_on_adv_media_id"
    t.index ["business_detail_id"], name: "index_advertisement_plans_on_business_detail_id"
    t.index ["customer_id"], name: "index_advertisement_plans_on_customer_id"
  end

  create_table "business_details", charset: "utf8mb4", force: :cascade do |t|
    t.string "business_name"
    t.bigint "customer_id"
    t.string "business_sector"
    t.string "business_landline_number"
    t.string "business_mobile_number"
    t.string "business_state"
    t.string "business_district"
    t.string "business_mail"
    t.string "business_address"
    t.string "business_website"
    t.boolean "is_active", default: true
    t.boolean "is_remove", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_business_details_on_customer_id"
  end

  create_table "customer_infos", charset: "utf8mb4", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "cust_email"
    t.string "phone_number"
    t.string "customer_state"
    t.string "customer_district"
    t.string "cust_address"
    t.string "gender"
    t.string "profile_pic"
    t.integer "customer_status"
    t.boolean "is_active", default: true
    t.boolean "is_remove", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "departments", charset: "utf8mb4", force: :cascade do |t|
    t.string "dept_name"
    t.string "dept_state"
    t.string "city"
    t.string "description"
    t.boolean "is_active", default: true
    t.boolean "is_remove", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "media_assets", charset: "utf8mb4", force: :cascade do |t|
    t.string "media_type"
    t.bigint "sub_media_id"
    t.string "state"
    t.string "district"
    t.string "town_city"
    t.string "area_location"
    t.integer "dimentions"
    t.decimal "number_of_count", precision: 10
    t.boolean "is_active", default: true
    t.boolean "is_remove", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sub_media_id"], name: "index_media_assets_on_sub_media_id"
  end

  create_table "pricings", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "sub_media_id"
    t.string "price_scheme"
    t.boolean "is_accupied", default: false
    t.decimal "price", precision: 10, scale: 2
    t.boolean "is_active", default: true
    t.boolean "is_remove", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sub_media_id"], name: "index_pricings_on_sub_media_id"
  end

  create_table "roles", charset: "utf8mb4", force: :cascade do |t|
    t.string "role_name"
    t.text "description"
    t.boolean "is_active", default: true
    t.boolean "is_remove", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "selected_plans", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "advertisement_detail_id"
    t.bigint "price_plan_id"
    t.bigint "business_detail_id"
    t.integer "scheme_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["advertisement_detail_id"], name: "index_selected_plans_on_advertisement_detail_id"
    t.index ["business_detail_id"], name: "index_selected_plans_on_business_detail_id"
    t.index ["price_plan_id"], name: "index_selected_plans_on_price_plan_id"
  end

  create_table "users", charset: "utf8mb4", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "last_sign_in_ip"
    t.string "current_sign_in_ip"
    t.datetime "date_of_birth"
    t.string "gender"
    t.bigint "role_id", null: false
    t.string "username"
    t.string "firstname"
    t.string "lastname"
    t.string "phone_no"
    t.string "state"
    t.string "district"
    t.string "city"
    t.string "user_address"
    t.string "alternate_phone_no"
    t.integer "status"
    t.integer "created_by"
    t.bigint "department_id"
    t.date "hire_date"
    t.boolean "is_active", default: true
    t.boolean "is_remove", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["department_id"], name: "index_users_on_department_id"
    t.index ["role_id"], name: "index_users_on_role_id"
  end

  add_foreign_key "media_assets", "adv_channels", column: "sub_media_id"
  add_foreign_key "users", "departments"
end
