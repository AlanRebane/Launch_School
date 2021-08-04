#### EASY 3 exer
# Exclusive Or
def xor?(arg1, arg2)
  (arg1 == true && arg2 == false) || (arg1 == false && arg2 == true)
end

# p xor?(5.even?, 4.even?) == true
# p xor?(5.odd?, 4.odd?) == true
# p xor?(5.odd?, 4.even?) == false
# p xor?(5.even?, 4.odd?) == false
# p xor?(5.even?, 4.odd?) == false

# A more Rubyian way to solve this problem:
def xor_2?(arg1, arg2)
  !!((arg1 && !arg2) || (!arg1 && arg2))
end
# Here !! forces a boolean and ! takes the opposite

# Oddities
def oddities(arr)
  array_with_odd_indices = []
  arr.each_with_index do |element, index|
    array_with_odd_indices << element if index.even?
  end
  array_with_odd_indices
end

# p oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
# p oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
# p oddities(['abc', 'def']) == ['abc']
# p oddities([123]) == [123]
# p oddities([]) == []

# Palindrome Strings
def palindrome?(input)
  input == input.reverse
end

# p palindrome?('madam') == true
# p palindrome?('Madam') == false          # (case matters)
# p palindrome?("madam i'm adam") == false # (all characters matter)
# p palindrome?('356653') == true

# Palindrome Strings (Part 2)
=begin
PEDAC Template
==============

-------------------------------------------------------------------------------
(Understand the) Problem
-------------------------------------------------------------------------------
-  Inputs: String
-  Output: Boolean
---
**Problem Domain:**
Write a method that returns true if the string passed as an argument is
a palinrome, false otherwise.
---
**Explicit Requirements:**
1. Method should be case insensitive
2. It should ignore all non-alphanumeric characters.
---
**Implicit Requirements:**
1. Letters and numbers can be mixed
---
**Mental Model:**
Take a string, check if the words and numbers are in the same order
backwards as they are forwards. Return true/false accordingly.
---

-------------------------------------------------------------------------------
Examples / Test Cases / Edge Cases
-------------------------------------------------------------------------------
real_palindrome?('madam') == true
real_palindrome?('Madam') == true           # (case does not matter)
real_palindrome?("Madam, I'm Adam") == true # (only alphanumerics matter)
real_palindrome?('356653') == true
real_palindrome?('356a653') == true
real_palindrome?('123ab321') == false
-------------------------------------------------------------------------------
Data Structure
The input is a string with length whatever:
"Madam, I'm Adam", the output returns true if this same string is the same
reversed. "Madam, I'm Adam" => "madamimadam" == "madamimadam"
* The best way to manipulate the string "Madam, I'm Adam" so that it reads
  "madamimadam" is to convert it into an array and loop through each item.
-------------------------------------------------------------------------------
Algorithm
-------------------------------------------------------------------------------
1. First of all take the string, lower it.
2. Next, create an array that contains only numbers and letters
3. Take the string, put it into a new array, and loop through all of the 
   elements
    3.1 Inside of the loop, check if the element is in the array that
        that contains the numbers and letters. If it is, leave it, else
        throw it out.
    3.2 Return the array
4. Perform the check whether the array reads the same backwards and
   forwards. Return the boolean value.
-------------------------------------------------------------------------------
Code
-------------------------------------------------------------------------------

=end

def real_palindrome_long?(string)
  valid_chars = ("a".."z").to_a + (0..9).to_a  
  string_arr = string.downcase.chars

  string_arr.select! { |char| valid_chars.include?(char)}
  string_arr == string_arr.reverse
end

# Now, a more neat solution
def real_palindrome?(string)
  string = string.downcase.delete('^a-z0-9')
  palindrome?(string)
end

p real_palindrome?('madam') == true
p real_palindrome?('Madam') == true           # (case does not matter)
p real_palindrome?("Madam, I'm Adam") == true # (only alphanumerics matter)
p real_palindrome?('356653') == true
p real_palindrome?('356a653') == true
p real_palindrome?('123ab321') == false