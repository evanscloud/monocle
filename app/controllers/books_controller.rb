class BooksController < ApplicationController
  before_action :set_collection

  def new
    if current_user.username = params[:user_id]
      @book = Book.new
    else
      redirect_to user_collection_path(current_user, current_user.collection), alert: "Sorry, you can only add to your collection."
    end
  end

  def create
    # binding.pry
    @book = Book.new
    book = GoogleBooks.search(params[:book][:title]).first
    if !book.nil?
      @book.info(book)
      @book = @collection.books.build(@book)
      if @book.save
        redirect_to user_collection_path(@collection.user_id, @collection.id), alert: "The book has been added to your collection. Awesome sauce!"
      else
        render :new, alert: "Sorry, we couldn't find that. Please try a different search."
      end
    else
      redirect_to new_user_collection_book_path, alert: "Sorry, we couldn't find that. Please try a different search."
    end
  end

  private

    def set_collection
      @collection = Collection.find(params[:collection_id])
    end

    def book_params
      params.require(:book).permit(:title, :author, :publisher, :publisher_date, :categories, :average_rating, :ratings_count, :description, :price, :isbn, :buy_link, :image_link)
    end
end
