def bad_two_sum?(arr, target_sum)
    (0...arr.length).each do |i|
        (i+1...arr.length).each do |j|
            return true if arr[i] + arr[j] == target_sum
        end
    end
    false
end

# arr = [0, 1, 5, 7]
# p bad_two_sum?(arr, 6) # => should be true
# p bad_two_sum?(arr, 10) # => should be false

def ok_two_sum?(arr, target_sum)
    sorted_arr = ok_mergesort(arr)
    sorted_arr.each_with_index do |ele, idx|
        diff = target_sum - ele
        return true unless ok_bsearch(sorted_arr[idx+1..-1], diff).nil?
    end
    false
end
def ok_mergesort(arr)
    return arr if arr.size <= 1

    half = arr.size / 2
    left = ok_mergesort(arr.take(half))
    right = ok_mergesort(arr.drop(half))

    ok_merge(left,right)

end
def ok_merge(left,right)
    sorted = []

    until left.empty? || right.empty?
        left_first = left.first
        right_first = right.first
        left_first < right_first ? sorted << left.shift : sorted << right.shift
    end

    sorted + left + right
end
def ok_bsearch(arr, target)
    mid = arr.length/2
    return mid if arr[mid] == target
    return nil if arr.length <= 1
    left = arr[0...mid]
    right = arr[mid+1..-1]
    if target < arr[mid]
        ok_bsearch(left, target)
    else
        right_idx = ok_bsearch(right, target)
        right_idx.nil? ? nil : right_idx + mid + 1
    end
end

# arr = [9, 5, 7, 8]
# p ok_two_sum?(arr, 16)

def hash_two_sum?(arr, target)
    hash_count = {}

    arr.each { |el| hash_count[el] = true }

    hash_count.each_key do |key|
        return true unless hash_count[target - key].nil?
    end

    false
    
end

arr = [9, 5, 7, 8]
p hash_two_sum?(arr,17)
p hash_two_sum?(arr,1)
p hash_two_sum?(arr,12)

