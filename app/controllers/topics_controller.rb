class TopicsController < ApplicationController
  def new
    @topic = Topic.new
  end

  def create
    @boards = Board.all()
    @board = Board.find(params[:board_id])
    @topic = @board.topics.create(topic_params)
    @topic.assign_attributes(topic_params)

    if @topic.persisted?
      redirect_to board_path(@board)
    else
      render "boards/show", status: :unprocessable_entity, locals: {
        boards: @boards,
        board: @board,
        topic: @topic
      }
    end
  end

  def show
    @boards = Board.all()
    @board = Board.find(params[:board_id])
    @topic = Topic.find(params[:id])
  end

  def destroy
    @topic = Topic.find(params[:id])
    @topic.destroy

    redirect_back fallback_location: root_path, status: :see_other
  end

  private
    def topic_params
      params.require(:topic).permit(:name, :subject, :comment)
    end
end
