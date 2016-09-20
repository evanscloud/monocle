class UserSerializer < ActiveModel::Serializer
  attributes :id, :username
  has_many :collections
  has_many :comments
end
