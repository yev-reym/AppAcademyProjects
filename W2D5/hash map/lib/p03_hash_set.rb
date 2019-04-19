class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    unless include?(key) 
      if (@count + 1) > num_buckets
        resize!
      end
      self[key] << key
      @count += 1
      return true
    end
  end

  def include?(key)
    self[key].include?(key)  
  end

  def remove(key)
     if include?(key) 
      self[key].delete(key)
      @count -= 1
      return true
    end
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
     mod_idx = num.hash % num_buckets
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
