class User < ApplicationRecord
  has_many :friendships
  has_many :friends, through: :friendships
  
  validates :first_name, presence: true
  validates :last_name, presence: true
end
