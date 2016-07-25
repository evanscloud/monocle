class Collection < ActiveRecord::Base
  belongs_to :user
  has_many :book_collections, dependent: :destroy
  has_many :books, :through => :book_collections
  validates :name, :presence => true

  def books_attributes=(books_attributes)
    self.create_book(books_attributes) if book_id.nil?
  end
end
