class User < ApplicationRecord
  has_secure_password
  has_many :users_clubs
  has_many :clubs, :through => :users_clubs
end
