class BooksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_collection, except: [:show, :edit, :update, :destroy]
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  def new
    if @collection.user_id = current_user.id
      @book = Book.new
    else
      redirect_to collection_path(@collection.id), alert: "Sorry, you can only add to your own collection."
    end
  end

  def create
    @book = @collection.books.build(book_params)
    if @book.save
      redirect_to book_path(@book.id), alert: "The book has been added to your collection. Awesome sauce!"
    else
      render :new, alert: "Sorry, there seems to be an error. Please try again."
    end
  end

  def show
    @collection = @book.collections.first
    if @book.nil?
      redirect_to user_collections_path(current_user), alert: "Sorry, couldn't find that book."
    end
  end

  def edit
  end

  def update
    if current_user.id = @book.collections.first.user_id
      if @book.update(book_params)
        redirect_to book_path(@book.id), alert: "Your book has returned from it's glorious journey across the galaxy."
      else
        render :edit, alert: "Looks like something went wrong. Please try again."
      end
    end
  end

  def destroy
    @book.destroy
    redirect_to user_collections_path(current_user.id), alert: "* mistakenly drops book over paper shredder *"
  end

  private

    def set_collection
      @collection = Collection.find(params[:collection_id])
    end

    def set_book
      @book = Book.find(params[:id])
    end

    def book_params
      params.require(:book).permit(:title, :author, :publisher, :publisher_date, :categories, :average_rating, :ratings_count, :description, :price, :isbn, :buy_link, :image_link, :collection_id)
    end
end
