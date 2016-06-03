# encoding: UTF-8
ActiveRecord::Schema.define(version: 20160603130502) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attachinary_files", force: :cascade do |t|
    t.integer  "attachinariable_id"
    t.string   "attachinariable_type"
    t.string   "scope"
    t.string   "public_id"
    t.string   "version"
    t.integer  "width"
    t.integer  "height"
    t.string   "format"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "attachinary_files", ["attachinariable_type", "attachinariable_id", "scope"], name: "by_scoped_parent", using: :btree

  create_table "cocktails", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "photo"
  end

  create_table "doses", force: :cascade do |t|
    t.string   "description"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "cocktail_id"
    t.integer  "ingredient_id"
  end

  add_index "doses", ["cocktail_id"], name: "index_doses_on_cocktail_id", using: :btree
  add_index "doses", ["ingredient_id"], name: "index_doses_on_ingredient_id", using: :btree

  create_table "ingredients", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.string   "content"
    t.integer  "rating"
    t.integer  "cocktail_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "reviews", ["cocktail_id"], name: "index_reviews_on_cocktail_id", using: :btree

  add_foreign_key "doses", "cocktails"
  add_foreign_key "doses", "ingredients"
  add_foreign_key "reviews", "cocktails"
end
