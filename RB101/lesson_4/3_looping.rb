produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}

#p produce.select { |key, value| value == 'Fruit'}

def select_fruit(some_hash)
  fruit_hash = {}
  counter = 0
  keys = some_hash.keys

  loop do
    break if counter >= some_hash.length
    key = keys[counter]

    if some_hash[key] == 'Fruit'
      fruit_hash[key] = 'Fruit'
    end

    counter += 1
  end

  fruit_hash
end

# select_fruit(produce)

def double_numbers(numbers)
  counter = 0

  loop do
    break if counter == numbers.size

    numbers[counter] = numbers[counter] * 2

    counter += 1
  end

end

# my_numbers = [1, 4, 3, 7, 2, 6]
# p my_numbers.object_id
# double_numbers(my_numbers) # => [2, 8, 6, 14, 4, 12]
# p my_numbers
# p my_numbers.object_id

def double_odd_numbers(numbers)
  doubled_numbers = []
  counter = 0

  loop do
    break if counter >= numbers.size

    current_number = numbers[counter]
    current_number *= 2 if counter.odd?
    doubled_numbers << current_number

    counter += 1
  end

  doubled_numbers
end

# my_numbers = [1, 4, 3, 7, 2, 6]
# p double_odd_numbers(my_numbers)  # => [2, 4, 6, 14, 2, 6]# not mutated
# p my_numbers                      # => [1, 4, 3, 7, 2, 6]


my_numbers = [1, 4, 3, 7, 2, 6]

def multiply(numbers, multiplication)
  multiplied_numbers = []
  counter = 0

  loop do
    break if counter >= numbers.size
    current_number = numbers[counter]
    current_number *= multiplication
    multiplied_numbers << current_number

    counter += 1
  end

  multiplied_numbers
end

p multiply(my_numbers, 3) # => [3, 12, 9, 21, 6, 18]
p my_numbers
p my_numbers.map { |value| value * 3}
p my_numbers