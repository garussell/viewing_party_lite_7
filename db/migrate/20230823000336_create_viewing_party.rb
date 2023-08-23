class CreateViewingParty < ActiveRecord::Migration[7.0]
  def change
    create_table :viewing_parties do |t|
      t.string "name"
      t.string "host"
      t.string "movie"
      t.time "duration"
      t.datetime "viewing_time", precision: nil
      t.date "viewing_date"
      t.string "users"
      t.bigint "movie_id", null: false
      t.index ["movie_id"], name: "index_viewing_parties_on_movie_id"

      t.timestamps
    end
  end
end
