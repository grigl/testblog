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

ActiveRecord::Schema.define(version: 20140304024631) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", force: true do |t|
    t.string   "author"
    t.text     "comment_body"
    t.integer  "post_rating"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "post_id"
  end

  create_table "posts", force: true do |t|
    t.string   "title"
    t.string   "author"
    t.string   "author_ip"
    t.text     "post_body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "category_id"
    t.float    "rating"
    t.integer  "comments_count"
    t.string   "date_added"
  end

  add_index "posts", ["author"], name: "index_posts_on_author", using: :btree
  add_index "posts", ["category_id"], name: "index_posts_on_category_id", using: :btree
  add_index "posts", ["comments_count"], name: "index_posts_on_comments_count", using: :btree
  add_index "posts", ["date_added"], name: "index_posts_on_date_added", using: :btree
  add_index "posts", ["rating"], name: "index_posts_on_rating", using: :btree

end
