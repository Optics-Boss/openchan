class BoardsController < ApplicationController
  def index
    @boards = Board.all
  end

  def adminIndex
    @boards = Board.all
  end

  def new
    @board = Board.new
  end

  def create
    @board = Board.new(board_params)

    if @board.save
        redirect_to boards_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    puts params
    short_name = params.extract_value(:id)
    # @board = Board.find_by_short_name(short_name)
    @boards = Board.all
    @board = Board.find(params[:id])

    @sort = params[:sort] ? params[:sort] : "created_at"

    if params[:sort] == "name"
      @default = ""
    elsif params[:sort] == "created_at"
      @default = Time.now
    elsif params[:sort] == nil
      @default = Time.now
    else
      @default = ""
    end
  end

  def edit
    @board = Board.find(params[:id])
  end

  def update
    @board = Board.find(params[:id])

    if @board.update(board_params)
      redirect_to @board
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @board = Board.find(params[:id])
    @board.destroy!

    redirect_back fallback_location: root_path, status: :see_other
  end

  private
    def board_params
      params.require(:board).permit(:name, :short_name)
    end
end
