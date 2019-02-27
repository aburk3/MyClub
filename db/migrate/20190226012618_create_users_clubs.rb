class CreateUsersClubs < ActiveRecord::Migration[5.2]
  def change
    create_table :users_clubs do |t|
      t.belongs_to :user_id, null: false
      t.belongs_to :club_id, null: false
    end
  end
end
