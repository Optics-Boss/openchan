class RepliesController < ApplicationController
  def create
    puts params

    @boards = Board.all()
    @board = Board.find(params[:reply][:board_id])
    @topic = Topic.find(params[:topic_id])
    @reply = @topic.reply.create(reply_params)
    @reply.assign_attributes(reply_params)

    if @reply.persisted?
      redirect_to topic_path(@topic)
    else
      puts "else"

      render "topics/show", status: :unprocessable_entity, locals: {
        boards: @boards,
        board: @board,
        topic: @topic,
        reply: @reply
      }
    end
  end

  private
    def reply_params
      params.require(:reply).permit(:name, :comment)
    end
end
