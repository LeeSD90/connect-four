class ConnectFour
	attr_accessor :board

	def initialize
		@board = Board.new
	end

end

class Board
	attr_accessor :cells

	def initialize
		@cells = create_board
	end

	def get_cell(x,y)
		if !x.between?(1,6) || !y.between?(1,7) then
			return "Cell (#{x}, #{y}) is out of bounds!"
		else return @cells[x][y]
		end
	end

	def set_cell(x, y, v)
		if !x.between?(1,6) || !y.between?(1,7) then
			return "Cell (#{x}, #{y}) is out of bounds!"
		elsif v != "Red" && v!= "Yellow"
			return "Value #{v} is invalid!"
		else
			@cells[x][y] = v
		end
	end

	private

	def create_board
		return Array.new(6){Array.new(7)}
	end

end

class Player
end