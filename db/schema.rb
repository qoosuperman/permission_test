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

ActiveRecord::Schema.define(version: 2021_09_24_140800) do

  create_table "books", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "group_permissions", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "user_group_id"
    t.bigint "permission_resource_id"
    t.integer "priority"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["permission_resource_id"], name: "index_group_permissions_on_permission_resource_id"
    t.index ["priority"], name: "index_group_permissions_on_priority"
    t.index ["user_group_id"], name: "index_group_permissions_on_user_group_id"
  end

  create_table "permission_resources", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
    t.integer "default_priority", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["default_priority"], name: "index_permission_resources_on_default_priority"
  end

  create_table "user_groups", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
    t.boolean "admin", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["admin"], name: "index_user_groups_on_admin"
  end

  create_table "users", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.bigint "user_group_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["user_group_id"], name: "index_users_on_user_group_id"
  end

end
