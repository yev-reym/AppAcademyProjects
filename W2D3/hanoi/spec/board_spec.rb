require 'rspec'
require 'board'

describe Board do
    subject(:board) {Board.new}

    describe "#initialize" do

        it "should call on populate" do
            n = 4
            expect(board).to receive(:populate).with(n)
            board.populate(n)
        end

    end

    describe "#populate" do 
        it "should make an array of three instances of a peg" do
            expect(board.pegs[0]).to be_a(Object)
        end

        it "should stack first peg with 'n' disks" do
            board.populate(4)
            expect(board.pegs[0].disks).to eq([4, 3, 2, 1])
        end

    end

    describe "#valid_move?" do

    context "if disk can be moved to peg (disk is smaller than top disk or peg is empty)"

        it "should return true if empty" do
            board.popu
        end
    end

end








