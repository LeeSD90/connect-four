class ConnectFour

	def initialize
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

	private

	def create_board
		return Array.new(6){Array.new(7)}
	end

end

class Player
end