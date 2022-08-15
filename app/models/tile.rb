class Tile < ApplicationRecord
    belongs_to :board

    def columns
        Tile.where("x_axis"=> self.x_axis, "board_id"=>self.board_id).order(:x_axis)
    end
end
