class Club < ApplicationRecord
  has_many :users_clubs
  has_many :users, :through => :users_clubs

  has_many :meetings
  has_many :books, :through => :meetings
end
