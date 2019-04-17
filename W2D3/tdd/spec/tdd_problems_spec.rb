require 'rspec'
require 'tdd_problems'

describe Array do 
    describe "#my_uniq" do
        let(:arr) { [1, 2, 1, 3, 3] } 
            
        it "should NOT use built-in ruby #uniq method" do 
            expect(arr).not_to receive(:uniq)
            expect(arr).not_to receive(:uniq!)
            arr.my_uniq
        end

        it "should return an array without duplicates" do
            expect(arr.my_uniq).to eq(arr.uniq)
        end
    end

    describe "#two_sum" do 
        let(:arr) { [-1, 0, 2, -2, 1] }
        let(:arr2) { [-5, 5, 5] }
        let(:arr3) { [1,2,3,4] }
        let(:arr4) { [0, 1, 2, 0] }
        
        it "should return an Array of indices where elements add up to 0" do
            expect(arr.two_sum).to eq([[0, 4], [2, 3]])
        end

        it "should return indices in ascending order" do 
            expect(arr2.two_sum).to eq([[0,1],[0,2]])
        end

        it "should return an empty array when no pir is found" do 
            expect(arr3.two_sum).to eq([])
        end

        it "should find pairs with same element" do 
            expect(arr2.two_sum).to eq([[0,1],[0,2]])
        end

        it "will find real zero pairs" do
            expect(arr4.two_sum).to eq([[0,3]])
        end
    end

    describe "#my_transpose" do 
        let(:matrix) { [[0, 3, 6],[1, 4, 7],[2, 5, 8]] }
        
        it "should not use built in Ruby method Array#transpose" do 
            expect(matrix).not_to receive(:transpose)
            matrix.my_transpose
        end

        it "should interchange rows with columns" do 
            expect(matrix.my_transpose).to eq(matrix.transpose)
        end

    end


end

describe "#stock_picker" do
    it "should return an array of indices where first element is day to buy and second element is day to sell" do
        expect(stock_picker([5, 4, 10, 2, 1, 12, 0])).to eq([[4, 5]])
    end

    it "should return multiple arrays if buy/sell combinations are equally profitable" do
        expect(stock_picker([5, 4, 10, 2, 1, 1, 12, 0])).to eq([[4, 6], [5, 6]])
    end
end