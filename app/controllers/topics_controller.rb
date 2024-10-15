class TopicsController < ApplicationController
  def create
    @board = Board.find(params[:board_id])

    if @board.topics.create(topic_params)
      redirect_to board_path(@board)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
    def topic_params
      params.require(:topic).permit(:name, :subject, :comment)
    end
end
