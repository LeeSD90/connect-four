
class ConnectFour
	attr_accessor :board, :p1, :p2
	@win = false
	@last_turn

	def initialize
		@board = Board.new
		@p1 = Player.new("Player One", "R")
		@p2 = Player.new("Player Two", "Y")
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
		puts "\nYour turn #{player.name}.\n"
		x, y = -1
		@board.draw

		loop do
			puts "\nSelect a column(1-7) with an empty space."
			x = gets.chomp.to_i - 1
			y = board.count_column(x)
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
		if !x.between?(0,6) || !y.between?(0,5) then
			return "Cell (#{x}, #{y}) is out of bounds!"
		else return @cells[x][y]
		end
	end

	def set_cell(x, y, v)
		if !x.between?(0,6) || !y.between?(0,5) then
			return false
		elsif v != "R" && v!= "Y"
			return false
		else
			@cells[x][y] = v
			return true
		end
	end

	def count_column(x)
		if !x.between?(0,6) then
			return "Column #{x} doesn't exist!"
		else
			return cells[x].length - cells[x].count(nil)
		end
	end

	def draw
		x = 0
		y = @cells[0].length - 1
		print @cells[x][y]

		until y == -1
			print "\n|"
			until x == @cells.length
				value = get_cell(x,y).to_s
				print value.empty? ? " _ |" : " " + value.to_s + " |"
				x += 1
			end
			x = 0
			puts
			y -= 1
		end
		puts
		print "  1   2   3   4   5   6   7"
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