class UsersController < ApplicationController
  include UsersHelper
  before_action :require_login
  invisible_captcha only: [ :create, :update ], honeypot: :subtitle

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
        redirect_to users_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to @user
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy!

    redirect_back fallback_location: root_path, status: :see_other
  end

  private
    def user_params
      params.require(:user).permit(:username, :password, :password_confirmation, :role)
    end
    def require_login
      unless current_user
        redirect_to login_url
      end
    end
end
