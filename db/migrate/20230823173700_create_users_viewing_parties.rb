class CreateUsersViewingParties < ActiveRecord::Migration[7.0]
  def change
    create_table :users_viewing_parties do |t|
      t.bigint "user_id", null: false
      t.bigint "viewing_party_id", null: false
      t.index ["user_id"], name: "index_users_viewing_parties_on_user_id"
      t.index ["viewing_party_id"], name: "index_users_viewing_parties_on_viewing_party_id"

      t.timestamps
    end
  end
end
