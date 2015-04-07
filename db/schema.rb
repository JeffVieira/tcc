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

ActiveRecord::Schema.define(version: 20150406152532) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "checkins", force: :cascade do |t|
    t.string   "name"
    t.date     "date_validity"
    t.boolean  "checkout"
    t.string   "notification_period"
    t.integer  "user_id"
    t.integer  "document_type_id"
    t.integer  "folder_id"
    t.integer  "document_id"
    t.integer  "status"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.string   "arquivo_file_name"
    t.string   "arquivo_content_type"
    t.integer  "arquivo_file_size"
    t.datetime "arquivo_updated_at"
  end

  create_table "configurations", force: :cascade do |t|
    t.string   "notification_period"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "document_histories", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "document_id"
    t.string   "action"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "document_processes", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "status"
  end

  create_table "document_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "document_types_process", force: :cascade do |t|
    t.integer "document_type_id"
    t.integer "document_process_id"
  end

  create_table "document_versions", force: :cascade do |t|
    t.integer  "document_id"
    t.integer  "version"
    t.string   "name"
    t.date     "date_validity"
    t.boolean  "checkout"
    t.string   "notification_period"
    t.integer  "user_id"
    t.integer  "document_type_id"
    t.integer  "folder_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "arquivo_file_name"
    t.string   "arquivo_content_type"
    t.integer  "arquivo_file_size"
    t.datetime "arquivo_updated_at"
    t.integer  "status"
  end

  add_index "document_versions", ["document_id"], name: "index_document_versions_on_document_id", using: :btree

  create_table "documents", force: :cascade do |t|
    t.string   "name"
    t.date     "date_validity"
    t.boolean  "checkout"
    t.string   "notification_period"
    t.integer  "user_id"
    t.integer  "document_type_id"
    t.integer  "folder_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.string   "arquivo_file_name"
    t.string   "arquivo_content_type"
    t.integer  "arquivo_file_size"
    t.datetime "arquivo_updated_at"
    t.integer  "status"
    t.integer  "version"
  end

  create_table "folders", force: :cascade do |t|
    t.string   "name"
    t.integer  "parent_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "process_type_id"
    t.integer  "user_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.text     "description"
    t.integer  "user_id"
    t.integer  "autor_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "permissions", force: :cascade do |t|
    t.string   "permission_code"
    t.integer  "user_group_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "permissions", ["user_group_id"], name: "index_permissions_on_user_group_id", using: :btree

  create_table "sistem_configurations", force: :cascade do |t|
    t.string   "notification_period"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "user_groups", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",                   default: "", null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "versions", force: :cascade do |t|
    t.string   "item_type",  null: false
    t.integer  "item_id",    null: false
    t.string   "event",      null: false
    t.string   "whodunnit"
    t.text     "object"
    t.datetime "created_at"
  end

  add_index "versions", ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id", using: :btree

  create_table "work_processes", force: :cascade do |t|
    t.string   "name"
    t.integer  "folder_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
