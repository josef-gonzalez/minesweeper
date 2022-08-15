class BoardsController < ApplicationController
  before_action :set_board, only: [:show]
  def index
    @board = Board.new
    @boards = Board.all
  end

  def show
    if params[:tile]
      tile = @board.tiles.find_by(id: params[:tile])
      if !tile.revealed
        tile.update(revealed: true)
        if tile.value == "x"
          @board.tiles.update_all(revealed: true)
          @bomb = true
        end
      end
    end
  end

  def create
    board = Board.new(board_params)
    respond_to do |format|
        if board.save!
            format.html { redirect_to board_path(board.id),  notice: 'Board was successfully created.' }
        else
            format.html { render :index }
        end
    end
  end
    
  private
  def set_board
    @board = Board.find(params[:id])
  end

  def board_params
    params.require(:board).permit(:name,:email, :width, :height, :mines)
  end
end
