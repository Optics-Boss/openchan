class AdminController < ApplicationController
  include UsersHelper
  before_action :require_login

  def index
  end

  def showReported
    @replies = Reply.where(reported: true)
  end

  private
    def require_login
      unless current_user
        redirect_to login_url
      end
    end
end
