require 'connect_four'

describe ConnectFour do
	let(:game) {ConnectFour.new}

	describe "Player" do
	end

	describe "Board" do

		let(:board) {Board.new}

		describe '#initialize' do
			it "creates an empty 6x7 2d array" do
				expect(board.cells.length).to eql 6
				expect(board.cells[0].length).to eql 7
				expect(board.cells.flatten.all?{|x| x.nil? }).to eql true
			end
		end

		describe '#get_cell' do

			context "given a valid cell coordinate" do
				it "returns the cell value" do
					expect(board.get_cell(2,4)).to eql nil
					expect(board.get_cell(1,1)).to eql nil
					board.cells = Array.new(6){Array.new(7, "Red")}
					expect(board.get_cell(4,5)).to eql "Red"
				end
			end

			context "given an out of bounds cell coordinate" do
				it "returns an error message" do
					expect(board.get_cell(-4, 3)).to eql "Cell (-4, 3) is out of bounds!"
					expect(board.get_cell(3, 10)).to eql "Cell (3, 10) is out of bounds!"
				end
			end

		end

		describe '#set_cell' do

		end

	end

end