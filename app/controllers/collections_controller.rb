class CollectionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_collection, only: [:show, :edit, :update, :destroy]

  def index
    @collections = Collection.where(user_id: current_user.id)
  end

  def new
    if current_user.username = params[:user_id]
      @collection = current_user.collections.build
    else
      redirect_to new_user_collection_path(current_user), alert: "Sorry, you can only create a collection for yourself."
    end
  end

  def create
    @collection = current_user.collections.create(collection_params)
    if @collection.save
      redirect_to user_collection_path(@collection.user_id, @collection.id), alert: "The collection has been added to your bookshelf. High fives all around!"
    else
      render :new, alert: "Sorry, there seems to be an error. Please try again."
    end
  end

  def show
    @user = current_user
    @books = @collection.books
    if @collection.nil?
      redirect_to user_collections_path(@collection), alert: "Sorry, collection not found."
    end
  end

  def edit
  end

  def update
    if @collection.update(collection_params)
      redirect_to user_collection_path(@collection.user_id, @collection.id), alert: "Looks like it updated successfully. Woohoo!"
    else
      render :edit, alert: "Looks like something went wrong. Please try again."
    end
  end

  def destroy
    @collection.destroy
    redirect_to user_collections_path, alert: "Deleted successfully! Huzzah!"
  end

  private
  def set_collection
    @collection = Collection.find(params[:id])
  end

  def collection_params
    params.require(:collection).permit(:name, :user_id)
  end
end

# , comment_ids: [], comments_attributes: [:content]
