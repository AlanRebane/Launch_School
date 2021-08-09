
# 1. Cute angles
DEGREE = "\xC2\xB0"

def dms(angle)
  if angle > 360
    loop do
      angle -= 360
      break if angle <= 360
    end
  end

  degrees, remainder_degrees = angle.divmod(1)
  minutes, remainder_minutes = (remainder_degrees * 60).divmod(1)
  seconds = (remainder_minutes * 60).floor

  format(%(#{degrees}#{DEGREE}%02d'%02d"), minutes, seconds)
  #"%(" + degrees + DEGREE + minutes + "'" + seconds + "\")"
end

# 2. Delete vowels
VOWELS = %w(a e i o u )

def remove_vowels(array_of_strings)
  new_arr = array_of_strings.map do |word|
    word = word.chars.select { |letter| !VOWELS.include?(letter.downcase) }
    word.join
  end
  new_arr
end

def remove_vowels2(strings)
  strings.map { |string| string.delete('aeiouAEIOU') }
end


# 3. Fibonacci Number Location By Length
def find_fibonacci_index_by_length(digits)
  fibonacci_series = [1, 1]
  while fibonacci_series[-1].to_s.size < digits
    fibonacci_series << fibonacci_series[-1] + fibonacci_series[-2]
  end
  fibonacci_series.length
end

# 4. Reversed Arrays (Part 1)
def rvrs(array)
  temp_array = []
  
  for i in (1..array.length)
    temp_array << array[-i]
  end

  for i in (0..(array.length - 1))
    array[i] = temp_array[i]
  end

  array
end

# You can also make use of Ruby's parallel assignment (a handy idiom to remember!)
def reverse!(array)
  left_index = 0
  right_index = -1

  while left_index < array.size / 2
    array[left_index], array[right_index] = array[right_index], array[left_index]
    left_index += 1
    right_index -= 1
  end

  array
end

# 5. Reversed Arrays (Part 2)
def reverse(array)
  new_arr = []
  index = -1
  while new_arr.size < array.size
    new_arr << array[index]
    index -= 1
  end
  new_arr
end

# Consider also using reverse_each, like so:
def reverse(array)
  new_arr = []
  array.reverse_each { |x| new_arr << x }
  new_arr
end

# 6. Combining Arrays
def merge(arr1, arr2)
  index = 0
  new_arr = arr1.dup
  while arr2.size > index
    new_arr << arr2[index] unless arr1.include?(arr2[index])
    index += 1
  end
  new_arr
end

# Consider using the Ruby method that gives the set union of two arrays:
def merge(arr1, arr2)
  arr1 | arr2
end

# 7. Halvsies
def halvsies(arr)
  half = (arr.size/2.0).round
  [arr[0..half], arr[(half)..]]
end

# 8. Find the Duplicate
def find_dup(arr)
  duplicate = nil
  index = 1
  arr.each do |num|
    for i in arr[index..]
      duplicate = num if num == i
    end
    index += 1
    break if duplicate
  end

  duplicate
end

# Or use array.find:
def find_dup(array)
  array.find { |element| array.count(element) == 2 }
end

# 9. Does My List Include This?
def include?(array, value)
  check = false
  array.each do |x|
    check = true if x == value
  end
  check
end

p include?([1,2,3,4,5], 3) == true
p include?([1,2,3,4,5], 6) == false
p include?([], 3) == false
p include?([nil], nil) == true
p include?([], nil) == false

# A more neat way to do it:
def include?(arr, val)
  !!arr.find_index(val) # !! forces a boolean
end

# And another...
def include?(arr, val)
  arr.each { |element| return true if value == element }
  false
end

# 10. Triangle
def triangle(int)
  (int + 1).times { |i| puts ("*" * i).rjust(int)}
end

triangle(5)