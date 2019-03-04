class CreateClubs < ActiveRecord::Migration[5.2]
  def change
    create_table :clubs do |t|
      t.string :name
      t.string :category
      t.string :description

      t.timestamps
    end
  end
end
