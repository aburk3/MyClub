class CreateUsersClubs < ActiveRecord::Migration[5.2]
  def change
    create_table :users_clubs, id: false do |t|
      t.integer :user_id, null: false
      t.integer :club_id, null: false
    end
  end
end
