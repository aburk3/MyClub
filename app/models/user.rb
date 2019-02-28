class User < ActiveRecord::Base
  has_secure_password
  has_many :user_clubs
  has_many :clubs, :through => :user_clubs
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :password, presence: true
end
