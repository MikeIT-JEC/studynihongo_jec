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

ActiveRecord::Schema.define(version: 20161111051302) do

  create_table "admins", force: :cascade do |t|
    t.string   "email"
    t.string   "role"
    t.string   "password_hash"
    t.string   "password_salt"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "password_reset_token"
    t.datetime "password_reset_sent_at"
    t.string   "name"
    t.string   "auth_token"
  end

  create_table "articles", force: :cascade do |t|
    t.string   "title"
    t.text     "body"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "slug"
    t.integer  "admin_id"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "articles", ["admin_id"], name: "index_articles_on_admin_id"
  add_index "articles", ["slug"], name: "index_articles_on_slug"

  create_table "cebu_scheds", force: :cascade do |t|
    t.integer  "admin_id"
    t.string   "duration"
    t.integer  "status",     default: 0
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "slug"
  end

  add_index "cebu_scheds", ["admin_id"], name: "index_cebu_scheds_on_admin_id"
  add_index "cebu_scheds", ["slug"], name: "index_cebu_scheds_on_slug"

  create_table "cebu_students", force: :cascade do |t|
    t.string   "firstname"
    t.string   "middlename"
    t.string   "lastname"
    t.integer  "age"
    t.string   "contactnumber"
    t.string   "emailaddress"
    t.datetime "datereserved"
    t.datetime "dateexpired"
    t.integer  "cebu_sched_id"
    t.string   "payment_scheme"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.integer  "status",         default: 0
    t.boolean  "agreed",         default: false
    t.string   "address"
  end

  create_table "cebu_sub_scheds", force: :cascade do |t|
    t.integer  "cebu_sched_id"
    t.integer  "admin_id"
    t.string   "cs_day"
    t.string   "cs_session"
    t.string   "cs_time"
    t.string   "cs_jlpt_level"
    t.integer  "cs_status",     default: 0
    t.integer  "cs_slots"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.string   "cs_starts"
    t.string   "slug"
  end

  add_index "cebu_sub_scheds", ["cebu_sched_id"], name: "index_cebu_sub_scheds_on_cebu_sched_id"

  create_table "ckeditor_assets", force: :cascade do |t|
    t.string   "data_file_name",               null: false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.string   "data_fingerprint"
    t.integer  "assetable_id"
    t.string   "assetable_type",    limit: 30
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], name: "idx_ckeditor_assetable"
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], name: "idx_ckeditor_assetable_type"

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id"
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type"

  create_table "galleries", force: :cascade do |t|
    t.string   "caption"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "inquiries", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.text     "inquiry"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "contactnumber"
  end

  create_table "manila_scheds", force: :cascade do |t|
    t.string   "duration"
    t.integer  "status"
    t.string   "slug"
    t.integer  "admin_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "manila_scheds", ["admin_id"], name: "index_manila_scheds_on_admin_id"

  create_table "manila_students", force: :cascade do |t|
    t.string   "firstname"
    t.string   "middlename"
    t.string   "lastname"
    t.integer  "age"
    t.string   "contactnumber"
    t.string   "emailaddress"
    t.datetime "datereserved"
    t.datetime "dateexpired"
    t.integer  "manila_sched_id"
    t.string   "payment_scheme"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.integer  "status",          default: 0
    t.boolean  "agreed",          default: false
    t.string   "address"
  end

  create_table "manila_sub_scheds", force: :cascade do |t|
    t.integer  "manila_sched_id"
    t.integer  "admin_id"
    t.string   "ms_day"
    t.string   "ms_session"
    t.string   "ms_time"
    t.string   "ms_jlpt_level"
    t.integer  "ms_status"
    t.integer  "ms_slots"
    t.string   "ms_starts"
    t.string   "slug"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "manila_sub_scheds", ["admin_id"], name: "index_manila_sub_scheds_on_admin_id"
  add_index "manila_sub_scheds", ["manila_sched_id"], name: "index_manila_sub_scheds_on_manila_sched_id"

  create_table "payment_terms", force: :cascade do |t|
    t.string   "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teacher_backgrounds", force: :cascade do |t|
    t.string   "background"
    t.integer  "teacher_information_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "teacher_backgrounds", ["teacher_information_id"], name: "index_teacher_backgrounds_on_teacher_information_id"

  create_table "teacher_informations", force: :cascade do |t|
    t.string   "name"
    t.string   "age"
    t.string   "address"
    t.string   "contact_number"
    t.string   "emailaddress"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "branch"
    t.string   "branch_address"
  end

  create_table "teacher_qualifications", force: :cascade do |t|
    t.string   "qualification"
    t.integer  "teacher_information_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "teacher_qualifications", ["teacher_information_id"], name: "index_teacher_qualifications_on_teacher_information_id"

end
