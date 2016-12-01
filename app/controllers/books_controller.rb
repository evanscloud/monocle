class BooksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_collection, except: [:show, :edit, :update, :destroy]
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  def new
    if @collection.user_id == current_user.id
      @book = Book.new
    else
      redirect_to collection_path(@collection.id), alert: "Sorry, you can only add to your own collection."
    end
  end

  def search
  end

  def result
    @searched_book = GoogleBooks.search(params[:title]).first

    if @searched_book.nil?
      redirect_to collection_books_search_path(@collection.id), alert: "Sorry, that book doesn't seem to exist. Please try again."
    else
      if @searched_book.sale_info['retailPrice'].blank?
        @searched_book.sale_info[:price] = "unavailable"
      else
        @searched_book.sale_info[:price] = @searched_book.sale_info['retailPrice']['amount']
      end
      @searched_book.sale_info[:link] ||= @searched_book.sale_info['buyLink']

      @book = @collection.books.build(title: @searched_book.title, author: @searched_book.authors, publisher: @searched_book.publisher, published_date: @searched_book.published_date, description: @searched_book.description, price: @searched_book.sale_info[:price], isbn: @searched_book.isbn, buy_link: @searched_book.sale_info[:link], image_link: @searched_book.image_link)
      if @book.save
        @book.collections << @collection
        redirect_to book_path(@book.id), alert: "The book has been added to your collection. Awesome sauce!"
      else
        render :new, alert: "Sorry, there seems to be an error. Please try again."
      end
    end
  end

  def create
    @book = @collection.books.build(book_params)
    if @book.save
      @book.collections << @collection
      redirect_to book_path(@book.id), alert: "The book has been added to your collection. Awesome sauce!"
    else
      render :new, alert: "Sorry, there seems to be an error. Please try again."
    end
  end

  def show
    @collection = @book.collections.first
    if @book.nil?
      redirect_to user_collections_path(current_user), alert: "Sorry, couldn't find that book."
    else
      respond_to do |format|
        format.html { render :show }
        format.json { render json: @book }
      end
    end
  end

  def edit
  end

  def update
    if current_user.id == @book.collections.first.user_id
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
      params.require(:book).permit(:title, :author, :publisher, :published_date, :description, :price, :isbn, :buy_link, :image_link, :collection_id, genre_ids: [], genres_attributes: [:name])
    end
end
