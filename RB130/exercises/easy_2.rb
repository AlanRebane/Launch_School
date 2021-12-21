# 1. From-To-Step Sequence Generator
def step(start_val, end_val, step_val)
  current_val = start_val
  return_val = [start_val]
  
  loop do
    yield(current_val)
  
    break if current_val + step_val > end_val
    
    current_val += step_val
    return_val << current_val
  end

  return_val
end

#step(1, 10, 3) { |value| puts "value = #{value}" }

# 2. Zipper
def zip(arr1, arr2)
  new_arr = []

  index = 0

  arr1.each do |num|
    new_arr << [num, arr2[index]]
    index += 1
  end

  new_arr
end

#p zip([1, 2, 3], [4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]

# 3. map
def map(arr)
  new_arr = []

  arr.each { |i| new_arr << yield(i) }

  new_arr
end

# p map([1, 3, 6]) { |value| value**2 } == [1, 9, 36]
# p map([]) { |value| true } == []
# p map(['a', 'b', 'c', 'd']) { |value| false } == [false, false, false, false]
# p map(['a', 'b', 'c', 'd']) { |value| value.upcase } == ['A', 'B', 'C', 'D']
# p map([1, 3, 4]) { |value| (1..value).to_a } == [[1], [1, 2, 3], [1, 2, 3, 4]]

# 3. count
def count(*a)
  count = 0
  a.each { |num| count += 1 if yield(num) }

  count
end

# p count(1, 3, 6) { |value| value.odd? } == 2
# p count(1, 3, 6) { |value| value.even? } == 1
# p count(1, 3, 6) { |value| value > 6 } == 0
# p count(1, 3, 6) { |value| true } == 3
# p count() { |value| true } == 0
# p count(1, 3, 6) { |value| value - 6 } == 3

# 5. drop_while
def drop_while(arr)
  index = 0
  
  arr.each do
    if yield(arr[index])
      index += 1
      next
    else
      return arr[index..]
    end
  end

  []
end

# p drop_while([1, 3, 5, 6]) { |value| value.odd? } == [6]
# p drop_while([1, 3, 5, 6]) { |value| value.even? } == [1, 3, 5, 6]
# p drop_while([1, 3, 5, 6]) { |value| true } == []
# p drop_while([1, 3, 5, 6]) { |value| false } == [1, 3, 5, 6]
# p drop_while([1, 3, 5, 6]) { |value| value < 5 } == [5, 6]
# p drop_while([]) { |value| true } == []

# 6. each_with_index
def each_with_index(arr)
  index = 0
  
  arr.each do |num|
    yield(num, index)
    index += 1
  end
end

# result = each_with_index([1, 3, 6]) do |value, index|
#   puts "#{index} -> #{value**index}"
# end

# puts result == [1, 3, 6]

# 7. each_with_object
def each_with_object(arr, obj)
  arr.each { |num| yield(num, obj) }
  obj
end

# result = each_with_object([1, 3, 5], []) do |value, list|
#   list << value**2
# end
# p result == [1, 9, 25]

# result = each_with_object([1, 3, 5], []) do |value, list|
#   list << (1..value).to_a
# end
# p result == [[1], [1, 2, 3], [1, 2, 3, 4, 5]]

# result = each_with_object([1, 3, 5], {}) do |value, hash|
#   hash[value] = value**2
# end
# p result == { 1 => 1, 3 => 9, 5 => 25 }

# result = each_with_object([], {}) do |value, hash|
#   hash[value] = value * 2
# end
# p result == {}

# 8. max_by
def max_by(arr)
  return nil if arr.empty?
  index = 0
  max_value_location = 0
  highest_yield = yield(arr[max_value_location])
  
  arr.each do |num|
    current_yield = yield(num)
    if current_yield > highest_yield
      max_value_location = index 
      highest_yield = current_yield
    end
    index += 1
  end

  arr[max_value_location]
end

# p max_by([1, 5, 3]) { |value| value + 2 } == 5
# p max_by([1, 5, 3]) { |value| 9 - value } == 1
# p max_by([1, 5, 3]) { |value| (96 - value).chr } == 1
# p max_by([[1, 2], [3, 4, 5], [6]]) { |value| value.size } == [3, 4, 5]
# p max_by([-7]) { |value| value * 3 } == -7
# p max_by([]) { |value| value + 5 } == nil

# 8. each_cons (Part 1)
def each_cons(arr)
  next_one = 1
  arr[...-1].each do |current_val|
    yield(current_val, arr[next_one])
    next_one += 1
  end

  nil
end

# hash = {}
# result = each_cons([1, 3, 6, 10]) do |value1, value2|
#   hash[value1] = value2
# end
# p result == nil
# p hash == { 1 => 3, 3 => 6, 6 => 10 }

# hash = {}
# result = each_cons([]) do |value1, value2|
#   hash[value1] = value2
# end
# p hash == {}
# p result == nil

# hash = {}
# result = each_cons(['a', 'b']) do |value1, value2|
#   hash[value1] = value2
# end
# p hash == {'a' => 'b'}
# p result == nil

def each_cons(arr, total_elements)
  return if total_elements > arr.size

  arr.each_with_index do |num, index|
    break if index + total_elements > arr.size
    yield(num, *arr[(index + 1)...index + total_elements])
  end

  nil
end

hash = {}
each_cons([1, 3, 6, 10], 1) do |value|
  hash[value] = true
end
p hash == { 1 => true, 3 => true, 6 => true, 10 => true }

hash = {}
each_cons([1, 3, 6, 10], 2) do |value1, value2|
  hash[value1] = value2
end
p hash == { 1 => 3, 3 => 6, 6 => 10 }

hash = {}
each_cons([1, 3, 6, 10], 3) do |value1, *values|
  hash[value1] = values
end
p hash == { 1 => [3, 6], 3 => [6, 10] }

hash = {}
each_cons([1, 3, 6, 10], 4) do |value1, *values|
  hash[value1] = values
end
p hash == { 1 => [3, 6, 10] }

hash = {}
each_cons([1, 3, 6, 10], 5) do |value1, *values|
  hash[value1] = values
end
p hash == {}

