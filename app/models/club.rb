class Club < ActiveRecord::Base
  has_many :user_clubs
  has_many :users, :through => :user_clubs

  has_many :meetings
  has_many :books, :through => :meetings

  validates :name, presence: true
end
