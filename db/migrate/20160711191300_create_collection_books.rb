class CreateCollectionBooks < ActiveRecord::Migration
  def change
    create_table :collection_books do |t|
      t.references :collection, index: true, foreign_key: true
      t.references :book, index: true, foreign_key: true
    end
  end
end
