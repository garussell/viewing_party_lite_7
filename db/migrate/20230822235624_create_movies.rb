class CreateMovies < ActiveRecord::Migration[7.0]
  def change
    create_table :movies do |t|
      t.string "name"
      t.float "vote_average"
      t.time "runtime"
      t.string "genre"
      t.string "summary"
      t.string "top_10"
      t.integer "total_reviews"
      t.string "review_authors"
      t.bigint "user_id", null: false
      t.index ["user_id"], name: "index_movies_on_user_id"

      t.timestamps
    end
  end
end
