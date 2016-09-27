class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :email, :provider
  has_many :collections
  has_many :comments
end
