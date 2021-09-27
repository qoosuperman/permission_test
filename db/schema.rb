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

ActiveRecord::Schema.define(version: 2021_09_26_053228) do

  create_table "application_resources", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
    t.string "actions"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_application_resources_on_name"
  end

  create_table "books", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "permission_group_references", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "permission_id"
    t.bigint "permission_group_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["permission_group_id"], name: "index_permission_group_references_on_permission_group_id"
    t.index ["permission_id"], name: "index_permission_group_references_on_permission_id"
  end

  create_table "permission_group_teams", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "permission_group_id"
    t.bigint "team_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["permission_group_id"], name: "index_permission_group_teams_on_permission_group_id"
    t.index ["team_id"], name: "index_permission_group_teams_on_team_id"
  end

  create_table "permission_groups", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
    t.boolean "enabled", default: true
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "permissions", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "application_resource_id"
    t.string "name"
    t.integer "allowed_actions"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["application_resource_id"], name: "index_permissions_on_application_resource_id"
  end

  create_table "teams", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "user_teams", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "team_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["team_id"], name: "index_user_teams_on_team_id"
    t.index ["user_id"], name: "index_user_teams_on_user_id"
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
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
