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

ActiveRecord::Schema.define(version: 20130910211041) do

  create_table "ads", force: true do |t|
    t.string   "ad_content"
    t.string   "ad_url"
    t.string   "merchant_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", force: true do |t|
    t.string   "name"
    t.integer  "tagged_posts", default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categorizations", force: true do |t|
    t.integer  "post_id"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "categorizations", ["post_id", "category_id"], name: "index_categorizations_on_post_id_and_category_id", using: :btree

  create_table "citations", force: true do |t|
    t.integer  "post_id"
    t.string   "text"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ckeditor_assets", force: true do |t|
    t.string   "data_file_name",               null: false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    limit: 30
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], name: "idx_ckeditor_assetable", using: :btree
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], name: "idx_ckeditor_assetable_type", using: :btree

  create_table "dotds", force: true do |t|
    t.string   "product_name"
    t.string   "brand"
    t.string   "retail_price"
    t.string   "sale_price"
    t.string   "small_image_url"
    t.text     "buy_url"
    t.string   "percent_off"
    t.string   "price_difference"
    t.string   "merchant_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "gear_guides", force: true do |t|
    t.integer  "user_id"
    t.string   "title"
    t.text     "content"
    t.string   "meta_description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "view_count",       default: 0
  end

  create_table "internal_categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "internal_categorizations", force: true do |t|
    t.string   "internal_categorizable_type"
    t.integer  "internal_categorizable_id"
    t.integer  "internal_category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "internal_categorizations", ["internal_categorizable_id"], name: "index_internal_categorizations_on_internal_categorizable_id", using: :btree
  add_index "internal_categorizations", ["internal_categorizable_type"], name: "index_internal_categorizations_on_internal_categorizable_type", using: :btree
  add_index "internal_categorizations", ["internal_category_id"], name: "index_internal_categorizations_on_internal_category_id", using: :btree

  create_table "posts", force: true do |t|
    t.integer  "user_id"
    t.string   "title"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "pic_thumbnail_url"
    t.string   "pic_large_url"
    t.string   "flickr_url"
    t.integer  "all_time_view_count",              default: 0
    t.integer  "monthly_view_count",               default: 0
    t.string   "picture_alt_text"
    t.string   "pic_large_square_url"
    t.string   "meta_description"
    t.string   "section"
    t.string   "pic_medium_url"
    t.decimal  "stars"
    t.datetime "last_updated_products_for_review"
    t.boolean  "is_a_review",                      default: false
  end

  add_index "posts", ["all_time_view_count", "monthly_view_count"], name: "index_posts_on_all_time_view_count_and_monthly_view_count", using: :btree
  add_index "posts", ["section"], name: "index_posts_on_section", using: :btree

  create_table "products", force: true do |t|
    t.integer  "post_id"
    t.string   "merchant_name"
    t.string   "product_name"
    t.string   "brand"
    t.string   "retail_price"
    t.string   "sale_price"
    t.string   "buy_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "products", ["post_id"], name: "index_products_on_post_id", using: :btree

  create_table "rails_admin_histories", force: true do |t|
    t.text     "message"
    t.string   "username"
    t.integer  "item"
    t.string   "table"
    t.integer  "month",      limit: 2
    t.integer  "year",       limit: 8
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rails_admin_histories", ["item", "table", "month", "year"], name: "index_rails_admin_histories", using: :btree

  create_table "retailers", force: true do |t|
    t.string   "name"
    t.string   "url"
    t.text     "what_i_say"
    t.text     "what_they_say"
    t.boolean  "cottage_industry"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "avantlink_searchable"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
