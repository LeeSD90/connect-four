require 'connect_four'

describe ConnectFour do
	let(:game) {ConnectFour.new}

	describe "Player" do
	end

	describe "Board" do



		describe '#initialize' do
			it "creates an empty 6x7 2d array" do
				expect(subject.board.cells.length).to eql 6
				expect(subject.board.cells[0].length).to eql 7
				expect(subject.board.cells.flatten.all?{|x| x.nil? }).to eql true
			end
		end

		describe '#get_cell' do

			context "given a valid cell coordinate" do
				it "returns the cell value" do
					expect(subject.board.get_cell(2,4)).to eql nil
					expect(subject.board.get_cell(1,1)).to eql nil
					subject.board.cells = Array.new(6){Array.new(7, "Red")}
					expect(subject.board.get_cell(4,5)).to eql "Red"
				end
			end

			context "given an out of bounds cell coordinate" do
				it "returns an error message" do
					expect(subject.board.get_cell(-4, 3)).to eql "Cell (-4, 3) is out of bounds!"
					expect(subject.board.get_cell(3, 10)).to eql "Cell (3, 10) is out of bounds!"
				end
			end

		end

		describe '#set_cell' do

			context "given a valid cell coordinate and value" do
				it "sets the cell to the given value and returns true" do
					expect(subject.board.set_cell(1,2, "Red")).to eql "Red"
					expect(subject.board.cells[1][2]).to eql "Red"
					expect(subject.board.set_cell(1,1, "Yellow")).to eql "Yellow"
					expect(subject.board.cells[1][1]).to eql "Yellow"
				end
			end

			context "given an out of bounds cell coordinate" do
				it "returns an error message" do
					expect(subject.board.set_cell(-4, 3, "Yellow")).to eql "Cell (-4, 3) is out of bounds!"
					expect(subject.board.set_cell(3, 10, "Red")).to eql "Cell (3, 10) is out of bounds!"
				end
			end

			context "given an invalid value" do
				it "returns an error message" do
					expect(subject.board.set_cell(1, 2, "Blah")).to eql "Value Blah is invalid!"
					expect(subject.board.set_cell(3, 4, -1)).to eql "Value -1 is invalid!"
				end
			end

		end

	end

end