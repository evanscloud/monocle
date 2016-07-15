class Collection < ActiveRecord::Base
  belongs_to :user
  has_many :book_collections
  has_many :books, :through => :book_collections
  validates :name, :presence => true

  # def comments_attributes=(comment_attributes)
  #   comment_attributes.values.each do |com_attr|
  #     comment = Comment.find_or_create_by(content: com_attr[:content])
  #     self.comments.build(content: comment[:content])
  #   end
  # end
end
