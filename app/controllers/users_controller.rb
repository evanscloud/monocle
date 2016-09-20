class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    if current_user.id == params[:id].to_i
      @user = current_user
      respond_to do |format|
        format.html { render :show }
        format.json { render json: @user }
      end
    else
      redirect_to root_path, alert: "ACCESS DENIED."
    end
  end

end
