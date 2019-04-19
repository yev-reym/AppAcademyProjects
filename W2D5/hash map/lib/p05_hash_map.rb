require_relative 'p04_linked_list'
require 'byebug'

class HashMap
  include Enumerable 

  attr_accessor :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { LinkedList.new }
    @count = 0
  end

  def include?(key)
    bucket(key).include?(key)
  end

  def set(key, val)
    if bucket(key).include?(key)
      bucket(key).update(key, val)
    else
      if (@count + 1) > num_buckets
        resize!
      end
      bucket(key).append(key, val)
      @count += 1
    end
  end

  def get(key)
    bucket(key).get(key)
  end

  def delete(key)
    bucket(key).remove(key)
    @count -= 1
  end

  def each
    num_buckets.times do |idx|
      bucket = @store[idx]
      bucket.each { |node| proc.call(node.key, node.val) }
    end
  end

  # uncomment when you have Enumerable included
  # def to_s
  #   pairs = inject([]) do |strs, (k, v)|
  #     strs << "#{k.to_s} => #{v.to_s}"
  #   end
  #   "{\n" + pairs.join(",\n") + "\n}"
  # end

  alias_method :[], :get
  alias_method :[]=, :set

  private

  def num_buckets
    @store.length
  end

  def resize!
    old_store = @store
    @store = Array.new(2*num_buckets) { LinkedList.new }
    @count = 0
    
    old_store.each do |bucket|
      bucket.each do |thing|
        set(thing.key, thing.val)
      end
    end
  end

  def bucket(key)
    # optional but useful; return the bucket corresponding to `key`
    hashed_key = key.hash
    idx = hashed_key % num_buckets
    bucket = @store[idx]
  end
end
