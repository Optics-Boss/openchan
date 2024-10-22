class RepliesController < ApplicationController
  def create
    @topic = Topic.find(params[:topic_id])
    @topic.reply.create(reply_params)
    redirect_to topic_path(@topic)
  end

  private
    def reply_params
      params.require(:reply).permit(:name, :comment)
    end
end
