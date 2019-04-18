def windowed_max_range(arr, w)
    current_max_range = nil
    window_arr = arr.dup

    ((arr.length-w)+1).times do 
    current_window = window_arr.take(w)


    max = current_window.max
    min = current_window.min
    diff = max - min

    if current_max_range.nil
        current_max_range = diff
    elsif current_max_range < diff
        current_max_range = diff
    end

    window_arr.shift

    end

    current_max_range


end

p windowed_max_range([1, 0, 2, 5, 4, 8], 2) == 4 # 4, 8
p windowed_max_range([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
p windowed_max_range([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
p windowed_max_range([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 4, 8