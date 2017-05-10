require_relative 'tic_tac_toe_refactored'

describe Board do

	let (:game) { Board.new }

	it "rejects values outside of grid" do
		expect(game.board[5,9]).to be_nil
	end

	describe "#make_mark" do

		it "takes input for square [0][0]" do
			game.make_mark([0,0])

			expect(game.board[0][0]).to satisfy { "X" || "O" }
		end

		it "takes input for square [0][2]" do
			game.make_mark([0,2])

			expect(game.board[0][2]).to satisfy { "X" || "O" }
		end

		it "takes input for square [2][1]" do
			game.make_mark([2,1])

			expect(game.board[2][1]).to satisfy { "X" || "O" }
		end

	end

	describe '#check_for_winner' do

		it "wins if top-row all X's or O's" do
			game.make_mark([0,0])
			game.make_mark([0,1])
			game.make_mark([0,2])

			expect(game.check_for_winner).to eql(true)
		end

		it "wins if middle-row all X's or O's" do
			game.make_mark([1,0])
			game.make_mark([1,1])
			game.make_mark([1,2])

			expect(game.check_for_winner).to eql(true)
		end

		it "wins if bottom-row all X's or O's" do
			game.make_mark([2,0])
			game.make_mark([2,1])
			game.make_mark([2,2])

			expect(game.check_for_winner).to eql(true)
		end

		it "wins if left column all X's or O's" do
			game = Board.new
			game.make_mark([0,0])
			game.make_mark([1,0])
			game.make_mark([2,0])

			expect(game.check_for_winner).to eql(true)
		end

		it "wins if center column all X's or O's" do
			game = Board.new
			game.make_mark([0,1])
			game.make_mark([1,1])
			game.make_mark([2,1])

			expect(game.check_for_winner).to eql(true)
		end

		it "wins if right column all X's or O's" do
			game = Board.new
			game.make_mark([0,2])
			game.make_mark([1,2])
			game.make_mark([2,2])

			expect(game.check_for_winner).to eql(true)
		end

		it "wins if descending diagonal" do
			game = Board.new
			game.make_mark([0,0])
			game.make_mark([1,1])
			game.make_mark([2,2])

			expect(game.check_for_winner).to eql(true)
		end

		it "wins if ascending diagonal" do
			game = Board.new
			game.make_mark([0,2])
			game.make_mark([1,1])
			game.make_mark([2,0])

			expect(game.check_for_winner).to eql(true)
		end
	end

end