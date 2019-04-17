require_relative "peg"

class Board
    attr_reader :pegs

    def initialize(n = 4)
        @pegs = []
        populate(n)
    end

    def populate(n)
        i = 1
        3.times do 
            @pegs << Peg.new(i)
            i += 1
        end
        pegs[0].stack(n)
    end
end