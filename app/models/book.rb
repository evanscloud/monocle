class Book < ActiveRecord::Base
  has_many :book_collections, :dependent => :destroy
  has_many :collections, :through => :book_collections
  validates :title, :presence => true
  validates :author, :presence => true
end
