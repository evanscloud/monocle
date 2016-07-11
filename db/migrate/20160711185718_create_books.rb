class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.string :publisher
      t.string :published_date
      t.string :categories
      t.float :average_rating
      t.integer :ratings_count
      t.string :description
      t.float :price
      t.string :isbn
      t.string :buy_link
    end
  end
end
