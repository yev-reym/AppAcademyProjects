class MaxIntSet
  attr_reader :max

  def initialize(max)
    @max = max
    @store = Array.new(max, false)
  end

  def insert(num)
    @store[num - 1] = true if is_valid?(num)
  end

  def remove(num)
    @store[num - 1] = false if is_valid?(num)
  end

  def include?(num)
    @store[num - 1] if is_valid?(num)
  end

  private

  def is_valid?(num)
    unless num.between?(0, max)
      raise 'Out of bounds'
    else
      true
    end
  end

  # def validate!(num)
  # end

end


class IntSet

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    unless include?(num) 
       mod_idx = num % num_buckets
        @store[mod_idx] << num
        return true
    end
  end

  def remove(num)
    if include?(num) 
       mod_idx = num % num_buckets
        @store[mod_idx].delete(num)
        return true
    end
  end

  def include?(num)
       mod_idx = num % num_buckets
      @store[mod_idx].include?(num)    
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_accessor :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    unless include?(num) 
      if (@count + 1) > num_buckets
        resize!
      end
      self[num] << num
      @count += 1
      return true
    end
  end

  def remove(num)
    if include?(num) 
      self[num].delete(num)
      @count -= 1
      return true
    end
  end

  def include?(num)
    self[num].include?(num)  
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    mod_idx = num % num_buckets
    @store[mod_idx]
  end

  def num_buckets
    @store.length
  end

  def resize!
    num_buckets.times { @store << Array.new }
    @store.each do |bucket|
      bucket.each do |thing|
        bucket.delete(thing)
        @count -= 1
        insert(thing)
      end
    end
  end
end
