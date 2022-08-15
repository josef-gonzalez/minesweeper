class Board < ApplicationRecord
    validates :name, :email, :width, :height, :mines, presence: true
    validates :email, format: { with: URI::MailTo::EMAIL_REGEXP } 
    validates :width, :height, :mines, numericality: { only_integer: true }
    after_create :generate_board
    has_many :tiles
    
    def generate_board
        height = self.height
        width = self.width
        mines = self.mines
        board_axis = []
        for row in 1..width do
          for column in 1..height do
            board_axis.push({x_axis: row, y_axis: column})
          end
        end
        
        self.tiles.create(board_axis)
        mines.times do
        tile = self.tiles.order("RANDOM()").find_by(value: nil)
          x = Integer(tile.x_axis)
          y = Integer(tile.y_axis)
          redo if tile.value == 'x'
          tile.update(value: 'x')
      
          [[x - 1, y], [x + 1, y], [x, y - 1], [x, y + 1]].each do |x, y|
            next if x < 0 || x >= height
            next if y < 0 || y >= width
            temp_tile = self.tiles.order("RANDOM()").find_by!(value: 'x')
            next if temp_tile.value == 'x'
            temp_tile.update(value: rand(1..9))
          end
        end
    end

  def tile(x,y)
    self.tiles.find_by(x_axis: x, y_axis: y)
  end
end
