class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.string :publisher
      t.string :published_date
      t.string :categories
      t.string :description
      t.float :price
      t.string :isbn
      t.string :buy_link
      t.string :image_link

      t.timestamps null: false
    end
  end
end
