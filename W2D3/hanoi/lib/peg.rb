class Peg
    attr_reader :value
    attr_accessor :disks

    def initialize(value)
        @value = value
        @disks = []
    end

    def top_disk
       disks.last 
    end

    def empty?
        disks.empty?
    end

    def stack(num)
        self.disks = num.downto(1).to_a
    end
end