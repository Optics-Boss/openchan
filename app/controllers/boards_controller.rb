class BoardsController < ApplicationController
  def index
    @boards = Board.all
  end

  def show
    short_name = params.extract_value(:id)
    # @board = Board.find_by_short_name(short_name)
    @boards = Board.all
    @board = Board.find(params[:id])
  end
end
