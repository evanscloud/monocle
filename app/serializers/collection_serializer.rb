class CollectionSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_one :user, serializer: UserCollectionSerializer
  has_many :books, serializer: BookCollectionSerializer
  has_many :comments, serializer: CommentCollectionSerializer
end
