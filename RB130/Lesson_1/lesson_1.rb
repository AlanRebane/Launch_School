def times(int)
  counter = 0
  while counter < int do
    yield(counter)
    counter += 1
  end

  int
end

# times(5) do |num|
#   puts num
# end

def each(array)
  for i in (0...array.size)
    yield(array[i])
  end

  array
end

# each([1, 2, 3, 4, 5]) do |num|
#   puts num
# end

array = [1, 2, 3, 4, 5]

def select(array)
  new_arr = []
  for i in (0...array.size)
    new_arr << array[i] if yield(array[i])
  end

  new_arr
end

# p select(array) { |num| num.odd? }
# p select(array) { |num| puts num }
# p select(array) { |num| num + 1 }

[1, 2, 3].reduce do |acc, num|
  acc + num
end

def reduce(array)
  acc = array[0]
  for i in (1...array.size)
    current_num = array[i]
    acc = yield(acc, current_num)
  end

  acc
end

array = [1, 2, 3, 4, 5]

# p reduce(array) { |acc, num| acc + num }                    # => 15
# p reduce(array, 10) { |acc, num| acc + num }                # => 25
# p reduce(array) { |acc, num| acc + num if num.odd? }        # => NoMethodError: undefined method `+' for nil:NilClass

p reduce(['a', 'b', 'c']) { |acc, value| acc += value }     # => 'abc'
p reduce([[1, 2], ['a', 'b']]) { |acc, value| acc + value } # => [1, 2, 'a', 'b']
