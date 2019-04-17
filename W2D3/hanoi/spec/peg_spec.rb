require 'rspec'
require 'peg'

describe Peg do 
    subject(:peg) { Peg.new(1) }

    describe "#initialize" do 
    
        it "initializes with an empty array" do 
            expect(peg.disks).to eq([])
        end

        it "accepts a value to assign to the peg" do 
            expect(peg.value).to eq(1)
        end

    end

    describe "#top" do
        it "returns top disk" do
            peg.disks << 4
            expect(peg.top_disk).to eq(4)
        end
    end

    describe "#empty?" do 

        context "when peg is empty" do 

            it "return true if peg is empty" do
                expect(peg.disks).to be_empty
            end

        end

        context "when peg is not empty" do 

            it "should return false " do 
                peg.disks << 4
                expect(peg.disks).not_to be_empty
            end
        end
    end

    describe "#stack(num)"  do 
        it "makes a full stack of disks up to the amount specified" do 
            peg.stack(10)
        
            expect(peg.disks.length).to eq(10)
        end
    end

end
