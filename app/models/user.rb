class User < ActiveRecord::Base
  has_secure_password
  has_many :user_clubs
  has_many :clubs, :through => :user_clubs
  validates :first_name, presence: true, on: :create
  validates :last_name, presence: true, on: :create
  validates :email, presence: true, on: :create
  validates :password, presence: true, on: :create
end
