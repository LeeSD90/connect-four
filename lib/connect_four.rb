class ConnectFour
	attr_accessor :board, :p1, :p2
	@win = false
	@last_turn

	def initialize
		@board = Board.new
		@p1 = Player.new("Player One", "Red")
		@p2 = Player.new("Player Two", "Yellow")
		@last_turn = @p2
		play
	end

	def play
		until @win
			@last_turn == @p1 ? take_turn(@p2) : take_turn(@p1)
			return if @win
		end
	end

	def take_turn(player)
		puts "Your turn #{player.name}."
		x, y = -1

		loop do
			puts "Select a column(1-7) with an empty space."
			x = gets.chomp.to_i
			y = board.count_column(x) + 1
			if @board.set_cell(x,y,player.color)
				break
			end
		end

		@last_turn = player
		@win = check_win
	end

	def check_win
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
		if !x.between?(1,7) || !y.between?(1,6) then
			return false
		elsif v != "Red" && v!= "Yellow"
			return false
		else
			@cells[x][y] = v
			return true
		end
	end

	def count_column(x)
		if !x.between?(1,7) then
			return "Column #{x} doesn't exist!"
		else
			return cells[x].length - cells[x].count(nil)
		end
	end

	private

	def create_board
		return Array.new(7){Array.new(6)}
	end

end

class Player
	attr_accessor :name, :color

	def initialize(player_name, color)
		@name = player_name
		@color = color
	end
end

game = ConnectFour.new