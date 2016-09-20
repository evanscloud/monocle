class BookCollectionSerializer < ActiveModel::Serializer
  attributes :id, :title, :author, :publisher, :published_date, :description, :price, :isbn, :buy_link, :image_link
end
