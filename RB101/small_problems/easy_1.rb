=begin
PEDAC for 3. List of Digits
==============

------------------------------------------------------------------------------
(Understand the) Problem
-------------------------------------------------------------------------------
-  Inputs: A positive integer
-  Output: An array
---
**Problem Domain:**
Write a method that takes a positive integer and returns a list of the digits
in the number
---
**Explicit Requirements:**
1. Return an array containing the digits of the integer.
---
**Implicit Requirements:**
1. Break the input integer down to separate integers
2. The returned array has at least 1 integer in it.
---
**Mental Model:**
Given an integer break it down and add each of the digits into an array
---

-------------------------------------------------------------------------------
Examples / Test Cases / Edge Cases
-------------------------------------------------------------------------------
**Examples:**
puts digit_list(12345) == [1, 2, 3, 4, 5]     # => true
puts digit_list(7) == [7]                     # => true
puts digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
puts digit_list(444) == [4, 4, 4]             # => true

-------------------------------------------------------------------------------
Data Structure
-------------------------------------------------------------------------------
Start with an integer. Convert the integer to a string. Add these digits to a
new array. 3 kinds of data structures: integers, string, and arrays
-------------------------------------------------------------------------------
Algorithm
-------------------------------------------------------------------------------
1. Create a new empty array called result.
2. Convert the integer to a string
3. Add each "letter" to the result array.
4. Repeat 2 & 3 until the string has no more digits left.
5. Return the result array.

** Step 2 detailed **

-------------------------------------------------------------------------------
Code
-------------------------------------------------------------------------------

=end

def digit_list(integer)
  result = []
  string = integer.to_s

  string.each_char do |letter|
    result << letter.to_i
  end

  result
end

def digit_list_short(integer)
  integer.to_s.chars.map(&:to_i)
end

=begin
PEDAC for 4. How Many?
==============

------------------------------------------------------------------------------
(Understand the) Problem
-------------------------------------------------------------------------------
-  Inputs: An array
-  Output: A hash
---
**Problem Domain:**
Write a method that counts the number of occurences of each element in a given
array.
---
**Explicit Requirements:**
1. Return the element and its number of occurence alongside it
2. Words in the array are case sensitive
---
**Implicit Requirements:**
1. The return of the method must be printed to the screen
2. And it must be in this format " 'element' => frequency "
3. The given array contains elements in a random order
---
**Clarifying Questions:**
1. Are the occurences always string elements?
2. Does the method need to return some object also in addition to printing out
   the frequency values?
---
**Mental Model:**
Take each unique value from the array and count its occurence in the array.
Then print the element and its frequency of occurence to the screen
---

-------------------------------------------------------------------------------
Examples / Test Cases / Edge Cases
-------------------------------------------------------------------------------
**Examples:**
vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]

count_occurrences(vehicles)

car => 4
truck => 3
SUV => 1
motorcycle => 2
-------------------------------------------------------------------------------
Data Structure
-------------------------------------------------------------------------------
Start with the given array. Then populate a hash with the element as key and 
its occurence as value.
-------------------------------------------------------------------------------
Algorithm
-------------------------------------------------------------------------------
1. Create an empty hash called occurences.
2. Populate the occurences hash keys with the unique elements from the array.
3. Now, take a key from the occurences hash and loop through the array.
4. In each iteration count how many times this key occurs in the array.
5. Return the value and add it to the occurences hash and to the right key.
6. Repeat steps 3, 4, 5 until there is no more keys left in the occurences hash.
7. Print out the value as is required.

-------------------------------------------------------------------------------
Code
-------------------------------------------------------------------------------
=end

def count_occurrences(some_array)
  occurences = Hash[some_array.uniq.map {|x| [x, 0]}]

  occurences.each_key do |key|
    counter = some_array.count(key)
    occurences[key] = counter
  end

  return occurences
end

vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]

p count_occurrences(vehicles)

# Easy version:
def count_occurrences_short(some_array)
  occurences = Hash.new
  some_array.uniq.each do |element|
    occurences[element] = some_array.count(element)
  end
  occurences
end

p count_occurrences_short(vehicles)

# Advanced version
def count_occurrences_advanced(some_array)
  occurences = Hash[some_array.uniq.map { |x| [x, some_array.count(x)] }]
  occurences.each { |key, value| puts "#{key} => #{value}"}
end

count_occurrences_advanced(vehicles)

=begin
PEDAC for 5. Reverse It (part 1)
==============

------------------------------------------------------------------------------
(Understand the) Problem
-------------------------------------------------------------------------------
-  Inputs: A string
-  Output: A String
---
**Problem Domain:**
Write a method that takes a string and returns a new string with the words in
reverse order
---
**Explicit Requirements:**
1. Return a new string with the words in reverse order.
---
**Implicit Requirements:**
1. The case is not important (i.e. the new string does not have to be 
   capitalized)
2. Words are split by " ".
3. The length of the new string is equal to the length of the input string.
4. Empty string results in an empty string
5. Any number of spaces results in an empty string
---
**Clarifying Questions:**
1. 
---
**Mental Model:**
Take the sentence, split it to words, and then reverse those words into a new
sentence.
---

-------------------------------------------------------------------------------
Examples / Test Cases / Edge Cases
-------------------------------------------------------------------------------
**Examples:**
puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'
puts reverse_sentence('') == ''
puts reverse_sentence('    ') == '' # Any number of spaces results in ''

-------------------------------------------------------------------------------
Data Structure
-------------------------------------------------------------------------------
Input a string. Output a string. Use an array in between to change the order
of the words.

-------------------------------------------------------------------------------
Algorithm
-------------------------------------------------------------------------------
1. Split the string into an array of words.
2. Reverse the array.
3. Convert the array back to a string where the elements contain a space
   in-between.

-------------------------------------------------------------------------------
Code
-------------------------------------------------------------------------------
=end

def reverse_sentence(string)
  arr = string.split(" ").reverse!
  new_string = arr.join(" ")
end

# 6. Reverse It (Part 2)
def reverse_words(string)
  arr = string.split
  arr.map { |word| word.reverse! if word.length >= 5}
  arr.join(" ")
end

=begin
7. Stringy Strings
==============

-------------------------------------------------------------------------------
(Understand the) Problem
-------------------------------------------------------------------------------
-  Inputs: A positive integer
-  Output: A string
---
**Problem Domain:**
Write a method that takes one argument, a positive integer, and returns a
string of alternating 1s and 0s, alway starting with 1. The length of the
string should match the given integer.
---
**Explicit Requirements:**
1. The method takes one argument, a positive integer
2. The returned string always starts with 1
3. The returned string alternates between 1s and 0s
4. The length of the string matches the given integer
---
**Mental Model:**
The method should output a string of alternating 1s and 0s where the length of
this string is given in the method arguments.
---

-------------------------------------------------------------------------------
Examples / Test Cases / Edge Cases
-------------------------------------------------------------------------------
puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'
-------------------------------------------------------------------------------
Data Structure
-------------------------------------------------------------------------------
The method takes in a single positive integer and outputs a string, where the
length of this string is equal to the given positive integer.
-------------------------------------------------------------------------------
Algorithm
-------------------------------------------------------------------------------
1. Start the string with the value 1
2. Then append the value 0
3. Then append the value 1
4. Repeat steps 2 and 3 until the length of the string is equal to the integer
   value
5. Return the string
-------------------------------------------------------------------------------
Code
-------------------------------------------------------------------------------

=end

def stringy(int)
  str = '1'

  loop do
    return str if str.length == int
    str << '0'
    return str if str.length == int
    str << '1'
  end

end

# 8. Array Average
def average(array)
  array.sum / array.length
end

# 9. Sum of Digits
def sum(number)
  total = 0
  number.to_s.chars.each do |element|
    total += element.to_i
  end
  total
end

# -- A more concise method
def sum(number)
  number.to_s.chars.map(&:to_i).reduce(:+)
end

# 10. What's my bonus?

def calculate_bonus(salary, bonus)
  bonus ? salary/2 : 0
end

puts calculate_bonus(2800, true) == 1400
puts calculate_bonus(1000, false) == 0
puts calculate_bonus(50000, true) == 25000