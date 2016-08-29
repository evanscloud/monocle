class Book < ActiveRecord::Base
  has_many :book_collections, :dependent => :destroy
  has_many :collections, :through => :book_collections
  has_many :book_genres
  has_many :genres, :through => :book_genres
  validates :title, :presence => true
  validates :author, :presence => true

  def genres_attributes=(genres_attributes)
    genres_attributes.each do |genre_attribute|
      unless genre_attribute["name"].blank?
        genre_attribute.values.each do |attribute|
          genre = Genre.find_or_create_by(name: genre_attribute.values.first)
          self.book_genres.build(genre_id: genre.id)
        end
      end
    end
  end

  def display_genre
    genre = self.genres.map { |genre| genre.name }
    genre.join(", ")
  end
end
