class BookSerializer < ActiveModel::Serializer
attributes :id, :title, :author, :publisher, :published_date, :description, :price, :isbn, :buy_link, :image_link
  has_many :collections
end
