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

ActiveRecord::Schema.define(version: 20_180_222_193_028) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'spaces', force: :cascade do |t|
    t.bigint 'store_id'
    t.string 'title'
    t.float 'size', default: 0.0
    t.float 'price_per_day', default: 0.0
    t.float 'price_per_week', default: 0.0
    t.float 'price_per_month', default: 0.0
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['store_id'], name: 'index_spaces_on_store_id'
    t.index ['title'], name: 'index_spaces_on_title', unique: true
  end

  create_table 'stores', force: :cascade do |t|
    t.string 'title'
    t.string 'city'
    t.string 'street'
    t.integer 'spaces_count', default: 0
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['city'], name: 'index_stores_on_city'
    t.index ['spaces_count'], name: 'index_stores_on_spaces_count'
    t.index ['street'], name: 'index_stores_on_street'
    t.index ['title'], name: 'index_stores_on_title', unique: true
  end

  add_foreign_key 'spaces', 'stores'
end
