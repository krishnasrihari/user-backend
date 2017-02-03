class User < ApplicationRecord
  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships
  
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true

  def name
  	self.first_name + " " + self.last_name
  end
end
