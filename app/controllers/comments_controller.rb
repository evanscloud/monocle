class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.create(comment_params)
    if @comment.save
      redirect_to collection_path(@comment.collection), alert: "New comment!"
    else
      render :new, alert: "Sorry, there seems to be an error. Please try again."
    end
  end

  def show
  end

  def edit
  end

  def update
    if current_user.id = @comment.user_id
      if @comment.update(comment_params)
        redirect_to collection_path(@comment.collection_id), alert: "Your comment has been given the stamp of approval!"
      else
        render :edit, alert: "Looks like something went wrong. Please try again."
      end
    else
      redirect_to collection_path(@comment.collection_id), alert: "Sorry, you can't edit someone else's comments (I'm watching you...)."
    end
  end

  def destroy
    @comment.destroy
    redirect_to collection_path(@comment.collection_id), alert: "Shhhh, that never happened..."
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:content, :user_id, :collection_id)
  end
end
