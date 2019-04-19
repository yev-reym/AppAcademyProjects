class Node
  # include Enumerable

  attr_reader :key
  attr_accessor :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous link to next link
    # and removes self from list.
  end
end

class LinkedList
  include Enumerable

  attr_reader :head, :tail

  def initialize
    @head = Node.new
    @tail = Node.new
    @head.next = @tail
    @tail.prev = @head
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    (@head.next == @tail) ? nil : @head.next
  end

  def last
    (@tail.prev == @head) ? nil : @tail.prev
  end

  def empty?
    @head.next == @tail
  end

  def get(key)
    self.each do |node|
      if node.key == key
        return node.val
      end
    end
    nil
  end

  def include?(key)
    # get(key)
    self.each { |node| return true if node.key == key }
    false
  end

  def append(key, val)
    new_node = Node.new(key, val)
    new_node.prev = @tail.prev
    new_node.next = @tail
    @tail.prev.next = new_node
    @tail.prev = new_node
  end

  def update(key, val)
    if include?(key)
      self.each { |node| node.val = val if node.key == key }
    else
      nil
    end
  end

  def remove(key)
    if include?(key)
      self.each do |node| 
        if node.key == key 
          node.prev.next = node.next
          node.next.prev = node.prev
        end
      end
    else
      nil
    end
  end

  def each
    current_node = @head
    until current_node.next == @tail
      current_node = current_node.next
      proc.call(current_node)
    end
  end

  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  # end
end
