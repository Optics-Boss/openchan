class AdminController < ApplicationController
  def showReported
    @replies = Reply.where(reported: true)
  end
end
