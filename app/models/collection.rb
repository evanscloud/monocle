class Collection < ActiveRecord::Base
  belongs_to :user
  has_many :book_collections, dependent: :destroy
  has_many :books, :through => :book_collections
  validates :name, :presence => true

  def books_attributes=(books_attributes)
    books_attributes.values.each do |book_attr|
      book = Book.find_or_create_by(title: book_attr[:title], author: book_attr[:author], publisher: book_attr[:publisher], published_date: book_attr[:published_date], categories: book_attr[:categories], description: book_attr[:description], price: book_attr[:price], isbn: book_attr[:isbn], buy_link: book_attr[:buy_link], image_link: book_attr[:image_link])
      self.book_collections.build(book_id: book.id)
    end
  end
end
