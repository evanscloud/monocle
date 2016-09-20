class CollectionSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_many :books, serializer: BookCollectionSerializer
end
