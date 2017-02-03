class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :first_name, :last_name
  has_many :friendships
  has_many :friends
end
