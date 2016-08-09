class Book < ActiveRecord::Base
  belongs_to :collection
  has_many :book_collections, dependent: :destroy
  has_many :collections, :through => :book_collections
  validates_presence_of :title, :author

  # include GoogleBooks
  #
  # def self.search(title)
  #   GoogleBooks.search("#{title}")
  # end
  #
  # def info(book)
  #   self.title = book.title
  #   self.author = book.authors
  #   self.publisher = book.publisher
  #   self.published_date = book.published_date
  #   self.categories = book.categories
  #   self.description = book.description
  #   self.price = book.sale_info['retailPrice']['amount']
  #   self.isbn = book.isbn
  #   self.buy_link = book.sale_info['buyLink']
  #   self.image_link = book.image_link
  # end
end
