
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
		x, y = -1
		@board.draw
		puts "\n\nYour turn #{player.name} (#{player.color}).\n"
		loop do

			puts "\nSelect a column(1-7) with an empty space."
			x = gets.chomp.to_i - 1
			y = board.count_column(x)
			if @board.set_cell(x,y,player.color)
				break
			end
		end

		@last_turn = player
		@win = check_win(player.color)
		if @win
			@board.draw
			puts "\n\n#{player.name} wins!"
		end
	end

	def check_win(color, direction=nil, x=nil, y=nil, correct=1)
		if correct == 4 then return true end
		if direction.nil? then
			coordinates = @board.cells.flat_map.with_index{ |row, row_index|
				row.each_index.select{|i| row[i] == color }.map{|column_index| [row_index, column_index]}
			}
			coordinates.each do |(x,y)|
				found_win = false
				if board.get_cell(x+1,y) == color then
					found_win = check_win(color, [1,0], x, y)
				end
				if board.get_cell(x-1,y) == color then
					found_win = check_win(color, [0,-1], x, y) unless found_win
				end
				if board.get_cell(x,y+1) == color then
					found_win = check_win(color, [0,1], x, y) unless found_win
				end
				if board.get_cell(x,y-1) == color then
					found_win = check_win(color, [0,-1], x, y) unless found_win
				end
				if board.get_cell(x+1,y+1) == color then
					found_win = check_win(color, [1,1], x, y) unless found_win
				end
				if board.get_cell(x-1,y-1) == color then
					found_win = check_win(color, [-1,-1], x, y) unless found_win
				end
				if board.get_cell(x+1,y-1) == color then
					found_win = check_win(color, [1,-1], x, y) unless found_win
				end
				if board.get_cell(x-1,y+1) == color then
					found_win = check_win(color, [-1,1], x, y) unless found_win
				end
				return found_win
			end
		else
			x = x+direction[0]
			y = y+direction[1]
			if board.get_cell(x, y) == color then
				correct += 1
				return check_win(color, direction, x, y, correct)
			else return false
			end
		end
		return false
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
		print "  1   2   3   4   5   6   7  \n"
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