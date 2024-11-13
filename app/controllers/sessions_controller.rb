class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(username: params[:username])

    if !!@user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to(admin_path)
    else
      message = "Something went wrong with your username and password"
      redirect_to login_path, notice: message
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
    reset_session
    message = "You have succesfully logged out"
    redirect_to login_path, notice: message
  end

  private
    def user_params
      params.require(:user).permit(:username, :password)
    end
end
