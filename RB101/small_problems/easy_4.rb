
# 1. Short Long Short

def short_long_short(string_1, string_2)
  if string_1.size < string_2.size
    string_1 + string_2 + string_1
  else
    string_2 + string_1 + string_2
  end
end

# p short_long_short('abc', 'defgh') == "abcdefghabc"
# p short_long_short('abcde', 'fgh') == "fghabcdefgh"
# p short_long_short('', 'xyz') == "xyz"

# 2. What Century is that?

def century_helper(century)
  return 'th' if [11, 12, 13].include?(century % 100)
  last_digit = century % 10

  case last_digit
  when 1 then 'st'
  when 2 then 'nd'
  when 3 then 'rd'
  else 'th'
  end
end

def century(year)
  if year.to_s[-1].to_i > 0
    century = (year/100 + 1)
  else
    century = (year/100)
  end
  century.to_s + century_helper(century)
end

# p century(2000) == '20th'
# p century(2001) == '21st'
# p century(1965) == '20th'
# p century(256) == '3rd'
# p century(5) == '1st'
# p century(10103) == '102nd'
# p century(1052) == '11th'
# p century(1127) == '12th'
# p century(11201) == '113th'

# 3. Leap Years (Part1)

def leap_year_gregorian?(year)
  case
  when year % 4 == 0 && !(year % 100 ==0 ) then true
  when year % 400 == 0 then true
  else false
  end
end

# 4. Leap Years (Part 2)
def gregorian_calender(year)
  (year % 4 == 0 && year % 100 !=0 ) || year % 400 == 0
end

def julian_calender(year)
  year % 4 == 0
end

def leap_year?(year)
  year < 1752 ? julian_calender(year) : gregorian_calender(year)
end

=begin
PEDAC, Multiples of 3 and 5
==============

-------------------------------------------------------------------------------
(Understand the) Problem
-------------------------------------------------------------------------------
-  Inputs: Integer
-  Output: Integer
---
**Problem Domain:**
Write a method that searches for all multiples of 3 or 5 that lie between 1 
and some other number, and then computes the sum of those multiples
---
**Explicit Requirements:**
1. Sum all the multiples of 3 and 5
2. Consider the integers in a range of 1 to the provided integer
---
**Implicit Requirements:**
1. Consider each integer only once (e.g. 15 is considered once)
2. The provided integer is inclusive.
---
**Mental Model:**
Take the integer that was given. List all the numbers from 1 till that
integer. Now find all numbers that are multiples of 3 and 5 from that
list. Take all of these numbers and sum them together.
---

-------------------------------------------------------------------------------
Examples / Test Cases / Edge Cases
-------------------------------------------------------------------------------
multisum(3) == 3
multisum(5) == 8
multisum(10) == 33
multisum(1000) == 234168
-------------------------------------------------------------------------------
Data Structure
-------------------------------------------------------------------------------
1. An integer is provided
2. Create a range of 1 till that integer (work with an array)
3. Extract only relevant numbers, sum them together, and output the integer
-------------------------------------------------------------------------------
Algorithm
-------------------------------------------------------------------------------
1. Take the integer and create an array from 1 till that integer
2. Loop through that array and select only numbers that are multiples of
   3 and 5.
3. Return the sum of that array.
-------------------------------------------------------------------------------
Code
-------------------------------------------------------------------------------

=end

def multisum(num)
  ((1..num).select { |x| x % 3 == 0 || x % 5 == 0}).sum
end

# p multisum(3) == 3
# p multisum(5) == 8
# p multisum(10) == 33
# p multisum(1000) == 234168

# 6. Running Totals
def running_total(array)
  array.empty? ? new_array = [] : new_array = [array[0]]

  for i in (1...array.length)
    new_array[i] = new_array[i - 1] + array[i]
  end

  new_array
end

# p running_total([2, 5, 13]) == [2, 7, 20]
# p running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
# p running_total([3]) == [3]
# p running_total([]) == []

def running_total_short(array)
  sum = 0
  array.map { |x| sum += x}
end


# 6. Convert a String to a Number!
NUMBERS = { '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4,
            '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9 }

def string_to_integer(string)
  number = 0
  power = string.length - 1
  string.chars.each do |letter|
    number += NUMBERS[letter] * (10 ** power)
    power -= 1
  end
  number
end

p string_to_integer('4321') #== 4321
p string_to_integer('570') #== 570

def string_to_integer_real(string)
  number = 0
  string.chars.each do |letter| 
    number = 10 * number + NUMBERS[letter]
  end
  number
end

# p string_to_integer_real('4321') #== 4321
# p string_to_integer_real('570') #== 570

# 7. Convert a String to a Signed Number!

def string_to_signed_integer(string)
  case
  when string[0] == '-' then -1 * string_to_integer_real(string.delete('-'))
  when string[0] == '+' then string_to_integer_real(string.delete('+'))
  else string_to_integer_real(string)
  end
end

p string_to_signed_integer('4321') == 4321
p string_to_signed_integer('-570') == -570
p string_to_signed_integer('+100') == 100


# 8. Convert a number to a string!
=begin
Examples / Test Cases / Edge Cases
-------------------------------------------------------------------------------
**Examples:**
integer_to_string(4321) == '4321'
integer_to_string(0) == '0'
integer_to_string(5000) == '5000'
-------------------------------------------------------------------------------
Data Structure
-------------------------------------------------------------------------------
Integer => Array
4321    => [4, 0, 3, 2, 1]
LETTERS => ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0"]
LETTERS[Array[0] - 1] = 4
LETTERS[Array[1] - 1] = 0
...
-------------------------------------------------------------------------------
Algorithm
-------------------------------------------------------------------------------
1. Take the integer and convert it into an array
4321 % 10 = 1
first = 1
4321 -  1 = 4320

4320 % 100 = 20
second = 20 / (100/10) = 2
4320 - 20 = 4300

4300 % 1000 = 300
third = 300 / (1000/10) = 3
4300 - 300 = 4000

4000 % 10000 = 4000
fourth = 4000 / (10000/10) = 4
4000 - 4000 = 0

break if number is 0
-------------------------------------------------------------------------------
Code
-------------------------------------------------------------------------------

=end

LETTERS = %w{ 1 2 3 4 5 6 7 8 9 0 }

def integer_to_string(some_number)
  first_int = some_number % 10
  array_of_nums = [first_int]
  some_number -= first_int

  power = 2
  while some_number > 0
    divider = 10 ** power
    extracted_value = some_number % divider
    array_of_nums.unshift(extracted_value / (divider / 10))
    
    some_number -= extracted_value
    power += 1
  end

  string = ''
  array_of_nums.each_with_index do |num, idx|
    string += LETTERS[array_of_nums[idx] - 1]
  end

  string
end

p integer_to_string(4321) == '4321'
p integer_to_string(0) == '0'
p integer_to_string(5000) == '5000'

# Write the same method using divmod
LETTERS_DIVMOD = %w{ 0 1 2 3 4 5 6 7 8 9 }

def integer_to_string_divmod(number)
  string = ''

  loop do
    number, int = number.divmod(10)
    string.prepend(LETTERS_DIVMOD[int])
    break if number == 0
  end

  string
end

p integer_to_string_divmod(4321)
p integer_to_string_divmod(0)
p integer_to_string_divmod(5000)

# 9. Signed number to a string!
def signed_integer_to_string(number)
  if number < 0
    '-' + integer_to_string_divmod(-number)
  elsif number > 0
    '+' + integer_to_string_divmod(number)
  else
    '0'
  end
end

p signed_integer_to_string(4321) == '+4321'
p signed_integer_to_string(-123) == '-123'
p signed_integer_to_string(0) == '0'

# LS version:
# def signed_integer_to_string(number)
#   case number <=> 0
#   when -1 then "-#{integer_to_string(-number)}"
#   when +1 then "+#{integer_to_string(number)}"
#   else         integer_to_string(number)
#   end
# end

def signed_integer_to_string_short(number)
  return '0' if number == 0
  string = integer_to_string_divmod(number.abs)
  number < 0 ? '-' + string : '+' + string
end

p signed_integer_to_string_short(4321) == '+4321'
p signed_integer_to_string_short(-123) == '-123'
p signed_integer_to_string_short(0) == '0'