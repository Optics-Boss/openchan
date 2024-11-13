class RepliesController < ApplicationController
  def create
    @boards = Board.all()
    @board = Board.find(params[:reply][:board_id])
    @topic = Topic.find(params[:topic_id])
    @reply = @topic.reply.create(reply_params)
    @reply.assign_attributes(reply_params)

    if @reply.persisted?
      redirect_to board_topic_path(@board, @topic)
    else
      render "topics/show", status: :unprocessable_entity, locals: {
        boards: @boards,
        board: @board,
        topic: @topic,
        reply: @reply
      }
    end
  end

  def report
    @reply = Reply.find(params[:id]).update_attribute!(:reported, true)
    redirect_back fallback_location: root_path, status: :see_other
  end

  def destroy
    @reply = Reply.find(params[:id])
    @reply.destroy!

    redirect_back fallback_location: root_path, status: :see_other
  end

  private
    def reply_params
      params.require(:reply).permit(:name, :comment)
    end
end
