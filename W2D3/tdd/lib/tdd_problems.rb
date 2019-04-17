require "byebug"

class Array
    def my_uniq
        unique = []
        self.each {|ele| unique << ele unless unique.include?(ele)}
        unique
    end

    def two_sum
        pairs = []
        self.each_with_index do |el1,i|
            self.each_with_index do |el2,j|
                pairs << [i,j] if el1 + el2 == 0 && i < j
            end
        end
        pairs
    end

    def my_transpose
        transposed = Array.new(self.length) {Array.new}

        (0...self.length).each do |row|
            (0...self.length).each do |col| 
                transposed[row] << self[col][row]
            end   
        end

        transposed
    end
end


def stock_picker(stocks)
    result = []
    profits = []
 
    (0...stocks.size-1).each do |i|
        (i+1...stocks.size).each do |j|
            profit = stocks[j] - stocks[i]
            if result.empty?
                result = [profit, i, j] 
            else 
                case profit <=> result.first 
                when 1
                    result = [profit, i, j]
                    profits = [[i,j]]  
                when 0 
                    profits << [i,j]
                end
            end
        end
    end

    profits
    
end



