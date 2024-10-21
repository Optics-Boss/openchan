class ReplyController < ApplicationController
  def create
    @topic = Topic.find(params[:topic_id])
    @topic.reply.create(topic_params)
    redirect_to topic_path(@topic)
  end
end
