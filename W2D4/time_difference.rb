def my_min_1(arr)
    sorted = false
    while sorted == false
        sorted = true
        (0...(arr.length-1)).each do |i|
            if arr[i] < arr[i+1]
                arr[i], arr[i+1] = arr[i+1], arr[i]
                sorted = false
            end
        end
    end
    arr.last
end


def my_min_2(arr)
    smallest_el = arr.first

   arr[1..-1].each do |el|
       smallest_el = el if el < smallest_el
   end

   smallest_el
end

# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# p my_min_1(list)
# p my_min_2(list)

def largest_contiguous_subsum_1(arr)
    sub_arr = []
    (0...arr.length).each do |i|
        (i+1...arr.length).each do |j|
            sub_arr << arr[i..j]
        end
    end
    sub_arr.map {|ele| ele.sum}.max
end


def largest_contiguous_subsum_2(arr)
    current_max = 0
    accumulated_max = 0

    return arr.max if arr.all? { |num| num < 0 }

    (0...arr.length).each do |i|
        current_max += arr[i]

        current_max = 0 if current_max < 0
     
        accumulated_max = current_max if accumulated_max < current_max
    end
    accumulated_max
end

# list = [2, 3, -6, 7, -6, 7]
# p largest_contiguous_subsum_1(list)
# p largest_contiguous_subsum_2(list)

def first_anagram?(str1, str2)
    arr1 = str1.split("")
    anagrams = arr1.permutation.to_a
    arr2 = str2.split("")
    anagrams.include?(arr2)
end

def second_anagram?(str1, str2)
    
    str1.each_char do |char|
        index = str2.index(char)
        return false if index.nil?
        str2[index] = "" 
    end

    str2.empty?
end

# p first_anagram?("gizmoadrgasef", "sallydgdfgrg")    #=> false
# p first_anagram?("elvis", "lives")    #=> true

# p second_anagram?("gizmofdfffn", "sallyxfghfgnxgn")    #=> false
# p second_anagram?("elvis", "lives")  #=> true

def third_anagram?(str1, str2)
    sorted1 = str1.split("").sort
    sorted2 = str2.split("").sort
    sorted1 == sorted2
end


# p third_anagram?("gizmo", "sally")    #=> false
# p third_anagram?("elvis", "lives")  #=> true

def fourth_anagram?(str1, str2)
    return false if str1.length != str2.length
    anagram_hash = Hash.new(0)

    str1.each_char { |char| anagram_hash[char] += 1 }
    str2.each_char { |char| anagram_hash[char] -= 1 }

    anagram_hash.values.all? { |val| val == 0 }


end

p fourth_anagram?("gizmo", "sally")    #=> false
p fourth_anagram?("elvis", "lives")  #=> true
