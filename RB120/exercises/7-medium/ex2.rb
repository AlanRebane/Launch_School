# 2. Fixed Array
# A fixed-length array is an array that always has a 
# fixed number of elements. Write a class that implements a 
# fixed-length array, and provides the necessary methods to 
# support the following code:

# The below code should output true 16 times.
class FixedArray
  def initialize(arr_size)
    @arr = Array.new(arr_size)
  end

  def [](position)
    arr[position] if index_within_range?(position)
  end

  def to_a
    arr
  end

  def []=(position, value)
    self.arr[position] = value if index_within_range?(position)
  end

  def to_s
    arr.to_s
  end

  def index_within_range?(position)
    if (position < arr.size && position >= 0) || (position >= -arr.size && position < 0)
      true
    else
      raise IndexError
    end
  end
  
  private

  attr_accessor :arr
end

fixed_array = FixedArray.new(5)
puts fixed_array[3] == nil
puts fixed_array.to_a == [nil] * 5

fixed_array[3] = 'a'
puts fixed_array[3] == 'a'
puts fixed_array.to_a == [nil, nil, nil, 'a', nil]

fixed_array[1] = 'b'
puts fixed_array[1] == 'b'
puts fixed_array.to_a == [nil, 'b', nil, 'a', nil]

fixed_array[1] = 'c'
puts fixed_array[1] == 'c'
puts fixed_array.to_a == [nil, 'c', nil, 'a', nil]

fixed_array[4] = 'd'
puts fixed_array[4] == 'd'
puts fixed_array.to_a == [nil, 'c', nil, 'a', 'd']
puts fixed_array.to_s == '[nil, "c", nil, "a", "d"]'

puts fixed_array[-1] == 'd'
puts fixed_array[-4] == 'c'

begin
  fixed_array[6]
  puts false
rescue IndexError
  puts true
end

begin
  fixed_array[-7] = 3
  puts false
rescue IndexError
  puts true
end

begin
  fixed_array[7] = 3
  puts false
rescue IndexError
  puts true
end
