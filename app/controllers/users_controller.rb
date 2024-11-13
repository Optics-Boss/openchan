class UsersController < ApplicationController
  include UsersHelper
  before_action :require_login

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to @user
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
    def user_params
      params.require(:user).permit(:username, :password)
    end
    def require_login
      unless current_user
        redirect_to login_url
      end
    end
end
