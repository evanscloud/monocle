class BooksController < ApplicationController
  # before_action :set_collection
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  def index
  end

  def search
    book = Book.search(params[:book][:title]).first
    if !book.nil?
      @book.info(book)
      book_params = @book.attributes
      @book = @collection.books.build(book_params)
      if @book.save
        redirect_to book_path(@book.id), alert: "The book has been added to your collection. Awesome sauce!"
      else
        render :new, alert: "Sorry, we couldn't find that. Please try a different search."
      end
    else
      redirect_to new_collection_book_path(@collection.id), alert: "Sorry, we couldn't find that. Please try a different search."
    end
  end

  def new
    if @collection.id = params[:collection_id]
      @book = Book.new
    else
      redirect_to collection_path(@collection.id), alert: "Sorry, you can only add to your own collection."
    end
  end

  def create
    @book = @collection.books.build(book_params)
    binding.pry
    @book.collection = @collection
    @book.collections << @collection
    if @book.save
      redirect_to book_path(@book.id), alert: "The book has been added to your collection. Awesome sauce!"
    else
      render :new, alert: "Sorry, there seems to be an error. Please try again."
    end
  end

  def show
    @user = current_user
    if @book.nil?
      redirect_to user_collections_path(current_user), alert: "Sorry, couldn't find that book."
    end
    # @book = @collection.books.find(params[:id])
  end

  def edit
  end

  def update
    if @book.update(book_params)
      redirect_to book_path(@book.id), alert: "Your book has returned from it's glorious journey across the galaxy."
    else
      render :edit, alert: "Looks like something went wrong. Please try again."
    end
  end

  def destroy
    @book.destroy
    redirect_to user_collections_path(current_user.id), alert: "* mistakenly drops book over paper shredder *"
  end

  private

    def set_collection
      @book = Book.find(params[:id])
      @collection = Collection.find(@book.collection_ids.first)
    end

    def set_book
      @book = Book.find(params[:id])
    end

    def book_params
      params.require(:book).permit(:title, :author, :publisher, :publisher_date, :categories, :average_rating, :ratings_count, :description, :price, :isbn, :buy_link, :image_link, :collection_id)
    end
end
