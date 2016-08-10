class Book < ActiveRecord::Base
  has_many :book_collections, :dependent => :destroy
  has_many :collections, :through => :book_collections
  validates_presence_of :title, :author
end
