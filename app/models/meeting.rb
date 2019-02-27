class Meeting < ApplicationRecord
  belongs_to :club
  belongs_to :user
  has_many :users
end
