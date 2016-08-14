class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    if current_user.id == params[:id].to_i
      @user = current_user
    else
      redirect_to root_path, alert: "ACCESS DENIED."
    end
  end

end
