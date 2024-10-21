class TopicsController < ApplicationController
  def create
    @board = Board.find(params[:board_id])
    @board.topics.create(topic_params)
    redirect_to board_path(@board)
  end

  def show
    @topic = Topic.find(params[:id])
  end

  private
    def topic_params
      params.require(:topic).permit(:name, :subject, :comment)
    end
end
