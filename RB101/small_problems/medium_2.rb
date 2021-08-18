
# 1. Print the longest sentence
def longest_sentence(text)
  longest = text.split(/\.|\?|!/).inject do |memo, sentence|
    memo.split.size > sentence.split.size ? memo : sentence
  end
  puts longest
  puts longest.split.size
end

# 2. Now I know my ABCs
=begin
==============

-------------------------------------------------------------------------------
(Understand the) Problem
-------------------------------------------------------------------------------
-  Inputs: String - a word
-  Output: Boolean

**Problem Domain:**
Write a method that returns true if the word passed in as an argument can be
spelled from this set of blocks, false otherwise.

**Explicit Requirements:**
1. Use the blocks to determine if the word can be spelled
2. If both letters from the block are used, then return false
3. If the word does not use both letters that are in the block, return true

**Implicit Requirements:**
1. The blocks contain each letter only once.

**Clarifying Questions:**

**Mental Model:**
Given a word, use the block to determine if the word can be spelled. The blocks
are a collection of letter pairs. If one of the letter in the pair is used in
the word, then the other letter cannot occur in the word. Return a boolean

-------------------------------------------------------------------------------
Examples / Test Cases / Edge Cases
-------------------------------------------------------------------------------
**Examples:**
block_word?('BATCH') == true
block_word?('BUTCH') == false
block_word?('jest') == true

-------------------------------------------------------------------------------
Data Structure
-------------------------------------------------------------------------------
Use a nested array to represent the blocks. Given a word, check the nested
array and see if the other letter occurs in the inner array. String - a word
and I am checking the letters of this word agains a nested array.

-------------------------------------------------------------------------------
Algorithm
-------------------------------------------------------------------------------
1. Define a constant array with the spelling blocks.
2. Write a method with one argument (a word which is a string)
3. Take this word, for each letter check what letter corresponds to the pair
4. Save this pair letter into a temporary array
5. Go to the next letter, check if it occurs in the temporary array, if it does
   return false, else save the pair to the temporary array.
6. If after the loop is continued and none of the letters in the word appear
   also in the temporary array, return true.

-------------------------------------------------------------------------------
Code
-------------------------------------------------------------------------------

=end

LETTER_BLOCKS = [['b', 'o'], ['g', 't'], ['v', 'i'], ['x', 'k'], ['r', 'e'],
                 ['l', 'y'], ['d', 'q'], ['f', 's'], ['z', 'm'], ['c', 'p'],
                 ['j', 'w'], ['n', 'a'], ['h', 'u']]

def find_word_pair(character)
  pair = LETTER_BLOCKS.select do |letter_pair|
    letter_pair.include?(character)
  end
  first, second = pair.flatten[0], pair.flatten[1]
  first == character ? second : first
end

def block_word?(word)
  temp_array = []
  word.each_char do |char|
    down_char = char.downcase
    if temp_array.include?(down_char)
      return false
    else
      temp_array << find_word_pair(down_char)
    end
  end
  true
end

# LS solution:
BLOCKS = %w(BO XK DQ CP NA GT RE FS JW HU VI LY ZM).freeze

def contains_block?(string)
  up_string = string.upcase
  BLOCKS.none? { |block| up_string.count(block) >= 2 }
end

# 3. Lettercase Percentage Ratio
=begin
==============

-------------------------------------------------------------------------------
(Understand the) Problem
-------------------------------------------------------------------------------
-  Inputs: String
-  Output: A hash with three keys: lowercase, uppercase, and neither

**Problem Domain:**
Given a string calculate how many percentage of letters are lowercase, upper
case or neither. Return a hash with the result.

**Implicit Requirements:**
1. Everything in a string is considered a character (whitespaces, numbers).
2. Everything that is not a letter automatically goes to neither.

**Mental Model:**
Given a string. Determine how many elements are in the string. Now using this
total determine how many are uppercase letters, lowercase letters and neither

-------------------------------------------------------------------------------
Examples / Test Cases / Edge Cases
-------------------------------------------------------------------------------
letter_percentages('abCdef 123') == { lowercase: 50.0, uppercase: 10.0, neither: 40.0 }
letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25.0 }
letter_percentages('123') == { lowercase: 0.0, uppercase: 0.0, neither: 100.0 }

-------------------------------------------------------------------------------
Data Structure
-------------------------------------------------------------------------------
Given a string, output a hash. Work with a string, loop through each element
within the string. I will also use regex to test what element it is.

-------------------------------------------------------------------------------
Algorithm
-------------------------------------------------------------------------------
1. Define 2 helper functions: is_uppercase?(letter) and is_lowercase?(letter)
2. Now, the main method letter_percentages.
3. define 3 variables equate them to zero: lowercase, uppercase, neither
4. Given a string, go through each element of the string.
5. Check whether the element is uppercase, if it is, add one to uppercase and
   go to the next element.
6. Calculate the percentages and populate a hash
7. return the hash

-------------------------------------------------------------------------------
Code
-------------------------------------------------------------------------------

=end

def letter_percentages(string)
  cases = [0, 0, 0]
  total = string.size.to_f

  string.each_char do |char|
    case
    when char.match?(/[a-z]/) then cases[0] += 1
    when char.match?(/[A-Z]/) then cases[1] += 1
    else                           cases[2] += 1
    end
  end
  
  perc = cases.map { |num| ((num / total) * 100).round(1) }

  { lowercase: perc[0], uppercase: perc[1], neither: perc[2] }
end


# 4. Matching Parentheses?
=begin
==============

-------------------------------------------------------------------------------
(Understand the) Problem
-------------------------------------------------------------------------------
-  Inputs: string
-  Output: boolean

**Problem Domain:**
Write a method that takes a string and checks if the parentheses within the
string are properly balanced, that is, '(' must be followed by ')'. Return
true false accordingly

**Implicit Requirements:**
1. Some edge cases are strings within strings: ((What) (is this))
2. Each ( must be followed by ), no matter the location, but it must occur
   somewhere inside the string

**Mental Model:**
Take a string, check whether the string has a matching pair of parentheses

-------------------------------------------------------------------------------
Examples / Test Cases / Edge Cases
-------------------------------------------------------------------------------
balanced?('What (is) this?') == true
balanced?('What is) this?') == false
balanced?('What (is this?') == false
balanced?('((What) (is this))?') == true
balanced?('((What)) (is this))?') == false
balanced?('Hey!') == true
balanced?(')Hey!(') == false
balanced?('What ((is))) up(') == false

-------------------------------------------------------------------------------
Data Structure
-------------------------------------------------------------------------------
The easiest would be to just work with regex and find a pattern of parentheses.
However, some strings do not contain parentheses at all, for them return true.

-------------------------------------------------------------------------------
Algorithm
-------------------------------------------------------------------------------
1. Given a string, populate an array with the parentheses.
2. First condition must be that the length of the array must be even
3. Second condition is that the first part of the array must only contain '('
   parentheses and the second part must only contain ')'

-------------------------------------------------------------------------------
Code
-------------------------------------------------------------------------------

=end

def balanced?(text)
  text_dup = text.dup
  while text_dup.slice(/\([a-z|\s]*\)/i) != nil
    text_dup.slice!(/\([a-z|\s]*\)/i)
  end
  !text_dup.match?(/\(|\)/)
end

def balanced_2?(text)
  count = 0
  
  text.each_char do |char|
    count += 1 if char == "("
    count += -1 if char == ")"
    return false if count < 0
  end

  count.zero?
end

# 5. Triangle Sides
=begin
==============

-------------------------------------------------------------------------------
(Understand the) Problem
-------------------------------------------------------------------------------
-  Inputs: three integers
-  Output: symbol :equilateral, :isosceles, :scalene, or :invalid

**Problem Domain:**
Take the three numbers and determine if the triangle is either of the four:
:equilateral, :isosceles, :scalene, or :invalid

**Explicit Requirements:**
:equilateral All 3 sides are of equal length
:isosceles 2 sides are of equal length, while the 3rd is different
:scalene All 3 sides are of different length
:invalid if the sum of the shortest 2 sides is less than the longest side

**Clarifying Questions:**
It doesn't matter which order the numbers are given.

**Mental Model:**
Take the three numbers, determine which is the longest and which are the
shortest. Now determine what the triangle is from the 4 different types.

-------------------------------------------------------------------------------
Examples / Test Cases / Edge Cases
-------------------------------------------------------------------------------
triangle(3, 3, 3) == :equilateral
triangle(3, 3, 1.5) == :isosceles
triangle(3, 4, 5) == :scalene
triangle(0, 3, 3) == :invalid
triangle(3, 1, 1) == :invalid

-------------------------------------------------------------------------------
Data Structure
-------------------------------------------------------------------------------
Take the three numbers, put it into an array and sort it. Use the two smallest
numbers as sides and the longest as the hypothenus.

-------------------------------------------------------------------------------
Algorithm
-------------------------------------------------------------------------------
1. Put the number arguments into an array.
2. Sort the array and determine sides and hypothenus
3. Perform tests whether it is a valid triangle.
4. If it is a valid triangle, determine what it is from the 3 different types.
5. Return the type as a symbol.

-------------------------------------------------------------------------------
Code
-------------------------------------------------------------------------------

=end

def triangle(num1, num2, num3)
  arr = [num1, num2, num3].sort

  return :invalid if (arr[0] + arr[1]) < arr[2] || arr.include?(0)

  if arr.all?(arr[0])
    :equilateral
  elsif arr[0] == arr[1] || arr[1] == arr[2]
    :isosceles
  else
    :scalene
  end
end

# 6. Tri-Angles
=begin
  
Algorithm:
1. Put the angles into an array, no need to sort it
1. Check whether the tri-angle is valid
   * No angle can be 0 degrees
   * The sum of the angles must be exactly 180 degrees.
2. If the triangle is valid, proceed. Else return :invalid
3. Determine if the 
  
=end

def triangle(angle1, angle2, angle3)
  arr = [angle1, angle2, angle3]

  return :invalid if arr.sum != 180 || arr.include?(0)

  if arr.any? { |angle| angle > 90}
    :obtuse
  elsif arr.any? { |angle| angle == 90}
    :right
  else
    :acute
  end
end

# 7. Unlucky Days
=begin
==============

-------------------------------------------------------------------------------
(Understand the) Problem
-------------------------------------------------------------------------------
-  Inputs: year (Integer)
-  Output: number of days (Integer)

**Problem Domain:**
Given the year, determine how many friday 13th are/were in that year. Return
the number of days

**Implicit Requirements:**


**Mental Model:**
Take the year, check the 13th date of each month. Sum all the fridays.

-------------------------------------------------------------------------------
Examples / Test Cases / Edge Cases
-------------------------------------------------------------------------------
friday_13th(2015) == 3
friday_13th(1986) == 1
friday_13th(2019) == 2

-------------------------------------------------------------------------------
Data Structure
-------------------------------------------------------------------------------
Given a year, take the months.

-------------------------------------------------------------------------------
Algorithm
-------------------------------------------------------------------------------
1. Initiate count at 0
2. Go through each month (1-12) and determine the 13th date
3. if that day is friday, add 1 to count
4. else go to the next month.
5. return the count

-------------------------------------------------------------------------------
Code
-------------------------------------------------------------------------------

=end
require 'date'

def friday_13th(year)
  count = 0
  thirteenth = Date.new(year, 1, 13)
  12.times do
    count += 1 if thirteenth.friday?
    thirteenth = thirteenth.next_month
  end
  count
end

def friday_count(year)
  months_with_5fridays = 0
  month = 1
  day = 1
  
  t = Date.new(year, month, day)
  
  until t.friday? do
    t = t.next_day
  end
  
  count_of_fridays = 1

  while t.year == year do
    months_with_5fridays += 1 if count_of_fridays >= 5
    count_of_fridays = 0 if t.next_day(7).month - t.month == 1
    
    t = t.next_day(7)
    count_of_fridays += 1
    
  end

  months_with_5fridays
end

# 8. Next Featured Number Higher than a Given Value
=begin
==============

-------------------------------------------------------------------------------
(Understand the) Problem
-------------------------------------------------------------------------------
-  Inputs: Integer
-  Output: Integer

**Problem Domain:**

**Explicit Requirements:**
1. Returns the next featured number that is greater than the argument
2. A featured number is:
  a) odd
  b) multiple of 7
  c) digits occur once each
3. If there is no next featured argument, return an error.

**Implicit Requirements:**
1. At some point, we will run out of featured numbers

**Mental Model:**
Given a number, find the next number that fulfills the 3 requirements, if there
is no such number anymore, return an error message.

-------------------------------------------------------------------------------
Examples / Test Cases / Edge Cases
-------------------------------------------------------------------------------
featured(12) == 21
featured(20) == 21
featured(21) == 35
featured(997) == 1029
featured(1029) == 1043
featured(999_999) == 1_023_547
featured(999_999_987) == 1_023_456_987

featured(9_999_999_999) # -> There is no possible number that fulfills those requirements

-------------------------------------------------------------------------------
Data Structure
-------------------------------------------------------------------------------
I have an integer. I need to find the next integer that fulfills the 3 requirements.
I could increment the number by one and each time check the 3 requirements.
Let's say, I am not using any collections, and only work with integers.

-------------------------------------------------------------------------------
Algorithm
-------------------------------------------------------------------------------
1. Given the number increment it by 1 until you find a multiple of seven
2. Check to see if it fulfills the requirements (odd and each digit appears
   only once).
3. If it does, return it, if it does not, increment the number by 7.
4. Increment the number until there is no possible number that fulfills the 
   requirements.

-------------------------------------------------------------------------------
Code
-------------------------------------------------------------------------------

=end

def detect_featured_number?(number)
  number.odd? && (number.to_s.chars.uniq == number.to_s.chars)
end

def find_multiple_of_seven(num)
  num += 1
  until num % 7 == 0 do
    num += 1
  end
  num
end

def eleven_digit?(num)
  num.to_s.size > 10
end

def featured(num)
  featured_num = find_multiple_of_seven(num)

  return featured_num if detect_featured_number?(featured_num)

  until detect_featured_number?(featured_num) || eleven_digit?(featured_num) do
    featured_num += 7
  end

  if eleven_digit?(featured_num)
    puts "There is no possible number anymore" 
  else
    featured_num
  end

end

# LS solution:
def featured(number)
  number += 1
  number += 1 until number.odd? && number % 7 == 0

  loop do
    number_chars = number.to_s.split('')
    return number if number_chars.uniq == number_chars
    number += 14
    break if number >= 9_876_543_210
  end

  'There is no possible number that fulfills those requirements.'
end

# 9. Bubble Sort
def bubble_sort!(arr)
  loop do
    swapped = false
    pos = 0

    loop do
      if arr[pos] > arr[pos + 1]
        arr[pos], arr[pos + 1] = arr[pos + 1], arr[pos]
        swapped = true
      end

      pos += 1

      break if pos >= arr.size - 1
    end

    break unless swapped
  end

end

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
bubble_sort!(array)
p array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
  
# 10. Sum Square - Square Sum
=begin
==============

-------------------------------------------------------------------------------
(Understand the) Problem
-------------------------------------------------------------------------------
-  Inputs: integer
-  Output: integer

**Problem Domain:**
Calculate the difference between the square of the sum of the first n positive
integers and the sum of the squares of the first n positive integers

**Mental Model:**
First, sum everything from 1 till the integer and square it
Second, take the square of all the numbers from 1 till the integer and sum it
Thirs, subtract the second number from the first

-------------------------------------------------------------------------------
Examples / Test Cases / Edge Cases
-------------------------------------------------------------------------------
sum_square_difference(3) == 22
   # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
sum_square_difference(10) == 2640
sum_square_difference(1) == 0
sum_square_difference(100) == 25164150

-------------------------------------------------------------------------------
Data Structure
-------------------------------------------------------------------------------
Create an array from 1 till the integer.

-------------------------------------------------------------------------------
Algorithm
-------------------------------------------------------------------------------
1. Create an array from 1 till the integer.
2. Compute the first number which is the sum of the array squared
3. Compute the second number which is the sum of each of the array element
   squared.
4. Subtract the second number from the first number and return the result

-------------------------------------------------------------------------------
Code
-------------------------------------------------------------------------------

=end

def sum_square_difference(int)
  arr = (1..int).to_a
  (arr.sum ** 2) - (arr.map { |x| x ** 2 }).sum
end

p sum_square_difference(3) == 22
   # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
p sum_square_difference(10) == 2640
p sum_square_difference(1) == 0
p sum_square_difference(100) == 25164150
