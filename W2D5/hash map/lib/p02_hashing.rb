class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    hash_arr = []
    self.each_with_index do |ele,i|
      hash_arr << ele.hash + i
    end
    # hash_arr << hash_arr.join("")
    # hash_arr.map!(&:to_i)
    hash_arr.map!.with_index { |ele, idx| ele.hash + idx}
    first_hash = hash_arr.map! { |ele| ele.to_s(2).to_i }
    # first_hash = hash_arr.inject { |acc, el| acc = acc ^ el }
    first_hash.sum.hash
  end
end

class String
  def hash
    chars = self.chars
    ords = chars.map(&:ord)
    ords.hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    hashed_values = values.map { |value| value.hash }
    hashed_keys = keys.map { |key| key.hash }
    hashed_values.sum + hashed_keys.sum
  end
end
