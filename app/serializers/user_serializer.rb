class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :first_name, :last_name, :friends
  has_many :friends
end
