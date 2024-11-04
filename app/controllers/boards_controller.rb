class BoardsController < ApplicationController
  def index
    @boards = Board.all
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
end
