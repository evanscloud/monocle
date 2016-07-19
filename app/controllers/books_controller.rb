class BooksController < ApplicationController
  before_action :set_collection

  def new
    if current_user.username = params[:user_id]
      @book = Book.new
    else
      redirect_to user_collection_path(current_user, current_user.collection), alert: "Sorry, you can only add to your collection."
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
