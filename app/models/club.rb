class Club < ActiveRecord::Base
  has_many :user_clubs
  has_many :users, :through => :user_clubs
  has_many :meetings

  validates :name, presence: true, :length => {:within => 5..30}, on: :create

  def is_admin?(user)
    self.admin == user.id
  end
end
