class Club < ApplicationRecord
  has_and_belongs_to_many :users
  has_many :meetings
  has_many :books, :through => :meetings
end
