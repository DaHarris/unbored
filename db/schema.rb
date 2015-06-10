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

ActiveRecord::Schema.define(version: 20150610210036) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bars", force: :cascade do |t|
    t.string "name"
    t.float  "lat"
    t.float  "long"
    t.string "open"
    t.string "close"
    t.string "phone"
    t.string "address"
    t.string "description"
    t.string "icon",        default: "Bar.svg"
  end

  create_table "boats", force: :cascade do |t|
    t.string "name"
    t.float  "lat"
    t.float  "long"
    t.string "description"
    t.string "icon",        default: "Boat.png"
  end

  create_table "breweries", force: :cascade do |t|
    t.string "name"
    t.float  "lat"
    t.float  "long"
    t.string "open"
    t.string "close"
    t.string "phone"
    t.string "address"
    t.string "description"
    t.string "icon",        default: "Brewery.png"
  end

  create_table "cafes", force: :cascade do |t|
    t.string "name"
    t.float  "lat"
    t.float  "long"
    t.string "description"
    t.string "icon",        default: "Cafe.svg"
  end

  create_table "camps", force: :cascade do |t|
    t.string "name"
    t.float  "lat"
    t.float  "long"
    t.string "description"
    t.string "icon",        default: "Camp.png"
  end

  create_table "concerts", force: :cascade do |t|
    t.string "name"
    t.float  "lat"
    t.float  "long"
    t.string "description"
    t.string "address"
    t.string "phone"
    t.string "icon",        default: "Concert.png"
  end

  create_table "dances", force: :cascade do |t|
    t.string "name"
    t.float  "lat"
    t.float  "long"
    t.string "description"
    t.string "open"
    t.string "close"
    t.string "address"
    t.string "phone"
    t.string "icon",        default: "Dance.png"
  end

  create_table "dgbaskets", force: :cascade do |t|
    t.string  "name"
    t.float   "lat"
    t.float   "long"
    t.string  "description"
    t.integer "holes"
    t.string  "icon",        default: "Dgbasket.png"
  end

  create_table "fish", force: :cascade do |t|
    t.string "name"
    t.float  "lat"
    t.float  "long"
    t.string "description"
    t.string "icon",        default: "Fish.png"
  end

  create_table "golves", force: :cascade do |t|
    t.string  "name"
    t.float   "lat"
    t.float   "long"
    t.string  "description"
    t.integer "holes"
    t.string  "price"
    t.string  "phone"
    t.string  "address"
    t.string  "open"
    t.string  "close"
    t.string  "icon",        default: "Golf.png"
  end

  create_table "hikings", force: :cascade do |t|
    t.string "name"
    t.float  "lat"
    t.float  "long"
    t.string "description"
    t.string "icon",        default: "Hiking.png"
  end

  create_table "icecreams", force: :cascade do |t|
    t.string "name"
    t.float  "lat"
    t.float  "long"
    t.string "description"
    t.string "open"
    t.string "close"
    t.string "phone"
    t.string "address"
    t.string "icon",        default: "Icecream.png"
  end

  create_table "movies", force: :cascade do |t|
    t.string "name"
    t.float  "lat"
    t.float  "long"
    t.string "description"
    t.string "open"
    t.string "close"
    t.string "address"
    t.string "phone"
    t.string "icon",        default: "Movie.png"
  end

  create_table "museums", force: :cascade do |t|
    t.string "name"
    t.float  "lat"
    t.float  "long"
    t.string "description"
    t.string "address"
    t.string "open"
    t.string "close"
    t.string "phone"
    t.string "icon",        default: "Museum.png"
  end

  create_table "paintbrushes", force: :cascade do |t|
    t.string "name"
    t.float  "lat"
    t.float  "long"
    t.string "description"
    t.string "address"
    t.string "phone"
    t.string "open"
    t.string "close"
    t.string "icon",        default: "Paintbrush.png"
  end

  create_table "parks", force: :cascade do |t|
    t.string "name"
    t.float  "lat"
    t.float  "long"
    t.string "description"
    t.string "icon",        default: "Park.png"
  end

  create_table "skateparks", force: :cascade do |t|
    t.string "name"
    t.float  "lat"
    t.float  "long"
    t.string "description"
    t.string "icon",        default: "Skatepark.png"
  end

  create_table "theatres", force: :cascade do |t|
    t.string "name"
    t.float  "lat"
    t.float  "long"
    t.string "description"
    t.string "address"
    t.string "phone"
    t.string "icon",        default: "Theatre.png"
  end

  create_table "tourists", force: :cascade do |t|
    t.string "name"
    t.float  "lat"
    t.float  "long"
    t.string "description"
    t.string "address"
    t.string "phone"
    t.string "open"
    t.string "close"
    t.float  "price"
    t.string "icon",        default: "Tourist.png"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
  end

  create_table "zoos", force: :cascade do |t|
    t.string "name"
    t.float  "lat"
    t.float  "long"
    t.string "description"
    t.string "address"
    t.string "phone"
    t.string "open"
    t.string "close"
    t.string "icon",        default: "Zoo.png"
  end

end
