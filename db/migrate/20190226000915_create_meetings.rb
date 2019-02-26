class CreateMeetings < ActiveRecord::Migration[5.2]
  def change
    create_table :meetings do |t|
      t.string :name
      t.integer :count
      t.datetime :meeting_datetime
      t.belongs_to :book, index: true, foreign_key: true
      t.belongs_to :wine, index: true, foreign_key: true
      t.belongs_to :club, index: true, foreign_key: true

      t.timestamps
    end
  end
end
