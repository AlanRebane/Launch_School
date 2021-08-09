
# 1. Sum of Sums
def sum_of_sums(arr)
  index = 1
  sum = arr[0]
  while index < arr.size
    sum += arr[0..index].sum
    index += 1
  end
  sum
end

# Launch School solutions:
def sum_of_sums(numbers)
  sum_total = 0
  accumulator = 0

  numbers.each do |num|
    accumulator += num
    sum_total += accumulator
  end

  sum_total
end

def sum_of_sums(numbers)
  sum_total = 0
  1.upto(numbers.size) do |count|
    sum_total += numbers.slice(0, count).reduce(:+)
  end
  sum_total
end

# 2. Madlibs
def madlibs
  print "Enter a noun: "
  n = gets.chomp
  print "Enter a verb: "
  v = gets.chomp
  print "Enter an adjective: "
  adj = gets.chomp
  print "Enter an adverb: "
  adv = gets.chomp

  print "Do you #{v} your #{adj} #{n} #{adv}? That's Hilarious"
end

# 3. leading substrings
def leading_substrings(string)
  new_arr = []
  substring = ''
  
  string.chars do |char|
    substring += char
    new_arr << substring
  end

  new_arr
end

# LS solution
def leading_substrings(string)
  result = []
  0.upto(string.size - 1) do |index|
    result << string[0..index]
  end
  result
end

# 4. All Substrings
def substrings(string)
  result = []
  0.upto(string.size - 1) do |index|
    result += leading_substrings(string[index..])
  end
  result
end

# 5. Palindromic Substrings
def palindromes(string)
  all_substrings = substrings(string)
  palindromes = all_substrings.select do |substring|
    substring == substring.reverse && substring.size > 1
  end
  palindromes
end

# 6. fizzbuzz
def fizzbuzz(int_first, int_last)
  int_first.upto(int_last) do |current_int|
    if current_int % 3 == 0 && current_int % 5 == 0
      print "FizzBuzz, "
    elsif current_int % 3 == 0
      print "Fizz, "
    elsif current_int % 5 == 0
      print "Buzz, "
    else
      print "#{current_int}, "
    end
  end
end
# Lazy solution, because it doesn't deal with the last comma

# A better way to deal with commas is to use an array and join elements
# together later using ", "!
def fizzbuzz(starting_number, ending_number)
  result = []
  starting_number.upto(ending_number) do |number|
    result << fizzbuzz_value(number)
  end
  puts result.join(', ')
end

def fizzbuzz_value(number)
  case
  when number % 3 == 0 && number % 5 == 0
    'FizzBuzz'
  when number % 5 == 0
    'Buzz'
  when number % 3 == 0
    'Fizz'
  else
    number
  end
end

# 7. Double Char (Part 1)
def repeater(string)
  new_string = ''
  string.each_char do |char|
    new_string << char * 2
  end
  new_string
end

# 8. Double Char (Part 2)
CONSONANTS = 'bcdfghjklmnpqrstvwxyz'

def double_consonants(string)
  new_string = ''
  string.each_char do |char|
    if CONSONANTS.include?(char.downcase)
      new_string << char * 2
    else 
      new_string << char
    end
  end
  new_string
end

# LS solutions which is pretty cool
def double_consonants(string)
  result = ''
  string.each_char do |char|
    result << char
    result << char if CONSONANTS.include?(char.downcase)
  end
  result
end

# 9. Reverse the Digits In a Number
def reversed_number(int)
  int.to_s.reverse.to_i
end

# 10. Get The Middle Character
def center_of(str)
  str.size.odd? ? str[str.size / 2] : str[str.size / 2 - 1, 2]
end
