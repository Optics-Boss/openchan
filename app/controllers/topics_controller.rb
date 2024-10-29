class TopicsController < ApplicationController
  def new
    @topic = Topic.new
  end

  def create
    @boards = Board.all()
    @board = Board.find(params[:board_id])
    # @topic = Topic.new(topic_params)
    @topic = @board.topics.create(topic_params)

    if @topic.persisted?
      puts "If"
      redirect_to board_path(@board)
    else
      puts "Else"
      render "boards/show", status: :unprocessable_entity, locals: {
        boards: @boards,
        board: @board,
        topic: @topic
      }
    end
  end

  def show
    @boards = Board.all()
    @topic = Topic.find(params[:id])
  end

  private
    def topic_params
      params.require(:topic).permit(:name, :subject, :comment)
    end
end
