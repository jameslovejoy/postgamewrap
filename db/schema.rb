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

ActiveRecord::Schema.define(version: 20171207195810) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "games", force: :cascade do |t|
    t.date "date"
    t.integer "game_number"
    t.string "home_team"
    t.string "away_team"
    t.integer "home_team_score"
    t.integer "away_team_score"
    t.string "mlb_id"
    t.string "bbref_id"
    t.string "wrap_text"
    t.string "wrap_url"
    t.string "recap_text"
    t.string "recap_url"
    t.string "youtube_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["date"], name: "index_games_on_date"
    t.index ["game_number"], name: "index_games_on_game_number"
  end

end
