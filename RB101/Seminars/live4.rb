# You are given an array which contains only integers 
# (positive and negative). Your job is to sum only the numbers 
# that are the same and consecutive. The result should be one array.

# You can asume there is never an empty array and there will always 
# be an integer.

# input: array
# output: array

# When to sum? On the condition:
#   1. equal to the previous number

# 1. Create a new empty array
# 2. Create a new index variable and equal it to 0
# 3. Loop through the input array and add the element to the
#    empty array if it is different from the previous one from the input array.
# 4. If the element is equal to the previous element in the input array,
#    then reassign the last element of the output array to:
#    last element of the output array + current loop element
# 5. Return the created array

def sum_consecutives(array)
  output_arr = [array[0]]
  idx = 0

  array[1..].each do |ele|
    if array[idx] == ele
      output_arr[-1] += ele
    else
      output_arr << ele
    end
    idx += 1
  end
  
  output_arr
end

# p sum_consecutives([1,4,4,4,0,4,3,3,1, 1]) == [1,12,0,4,6,2]
# p sum_consecutives([1,1,7,7,3]) == [2,14,3]
# p sum_consecutives([-5,-5,7,7,12,0]) ==  [-10,14,12,0]

### Interview prep
# Medium 2: Matching Parentheses

=begin
Write a method that takes a string as an argument, and returns true 
if all parentheses in the string are properly balanced, false otherwise. 
To be properly balanced, parentheses must occur in matching '(' and ')' pairs.
=end

# Input: string
# Output: boolean (true/false)

# The method will return true if all parentheses are balanced, false otherwise.

# Rules:
# If no parentheses, return true.
# Equal number of parentheses for true.

# 1. Create a new empty array, where I will add the left parenthesis
# 2. Loop through the string. 
# 3. If a character is a left parenthesis, add it to the array.
# 4. If it is a right parenthesis, pop an element from the array. If pop is nil, return false!
# 5. If the array is empty return true, else false.

def balanced?(str)
  parentheses = []

  str.chars.each do |char|
    if char == '('
      parentheses << char
    elsif char == ')'
      check = parentheses.pop
      return false if check != '('
    end
  end

  parentheses.empty? ? true : false
end

# p balanced?('What (is) this?') == true
# p balanced?('What is) this?') == false
# p balanced?('What (is this?') == false
# p balanced?('((What) (is this))?') == true
# p balanced?('((What)) (is this))?') == false
# p balanced?('Hey!') == true
# p balanced?(')Hey!(') == false
# p balanced?('What ((is))) up(') == false

=begin
A triangle is classified as follows:

equilateral All 3 sides are of equal length
isosceles 2 sides are of equal length, while the 3rd is different
scalene All 3 sides are of different length

To be a valid triangle, the sum of the lengths of the two shortest sides 
must be greater than the length of the longest side, and all sides must 
have lengths greater than 0: if either of these conditions is not satisfied, 
the triangle is invalid.

Write a method that takes the lengths of the 3 sides of a triangle as arguments, 
and returns a symbol :equilateral, :isosceles, :scalene, or :invalid depending 
on whether the triangle is equilateral, isosceles, scalene, or invalid.  
=end

def valid?(arr)
  (arr[0] > 0) && ((arr[0] + arr[1]) > arr[2]) ? true : false
end

def triangle(side1, side2, side3)
  triangle = [side1, side2, side3].sort
  return :invalid if !valid?(triangle)

  hyp = triangle[2]
  ss1 = triangle[1]
  ss2 = triangle[0]

  if hyp == ss1 && hyp == ss2
    :equilateral
  elsif hyp == ss1 || hyp == ss2 || ss1 == ss2
    :isosceles
  else
    :scalene
  end
end

# p triangle(3, 3, 3) == :equilateral
# p triangle(3, 3, 1.5) == :isosceles
# p triangle(3, 4, 5) == :scalene
# p triangle(0, 3, 3) == :invalid
# p triangle(3, 1, 1) == :invalid

=begin
A featured number (something unique to this exercise) is an odd number 
that is a multiple of 7, and whose digits occur exactly once each. 
p So, for example, 49 is a featured number, but 98 is not (it is not odd), 
97 is not (it is not a multiple of 7), and 133 is not (the digit 3 
appears twice).

Write a method that takes a single integer as an argument, 
and returns the next featured number that is greater than the argument. 
Return an error message if there is no next featured number.
=end

# input: integer
# output: integer (different from input)

# Rules for determining the featured number:
# 1. Odd number
# 2. Multiple of seven
# 3. All digits must be unique

# Algorithm:
# 1. In the first loop, determine the next odd number that is a multiple of 7
# 2. Given this number, go on to the second loop
# 3. Second loop: from the input integer until the last possible number
# 4. Break if the number has unique digits
# 5. Increment the number by 14
# 6. Return the number, or an error message if such a number does not exist

def featured(int)  
  loop do
    int += 1
    break if (int.odd?) && (int % 7 == 0)
  end
  
  loop do
    return int if int.to_s.chars.uniq == int.to_s.chars
    int += 14
    break if int >= 9_999_999_999
  end

  "Sorry, no such number!"
end

# p featured(12) == 21
# p featured(20) == 21
# p featured(21) == 35
# p featured(997) == 1029
# p featured(1029) == 1043
# p featured(999_999) == 1_023_547
# p featured(999_999_987) == 1_023_456_987
# p featured(9_999_999_999) # -> There is no possible number that fulfills those requirements

#### Interview warm up
# Find the length of the longest substring in the given 
# string that contains exatly 2 characters "a" and 2 
# characters "e" in it.

# As an example, if the input was “aaee”, the substring (aaee) 
# length would be 4.
# For a string "babanctekeaa", the longest substring is 
# "babancteke" and its length is 10.

# If the length of the input string is 0, return value must 
# be -1 and if none of the substrings contain 2 "a" and "e" 
# characters return -1 as well.

# Input: String
# Output: Integer, shows the length of the longest substring

# Rules:
# 1. It must contain exactly 2 'a' and 2 'e'
# 2. The shortest possible substring is 4
# 3. If there is no 2 'a' and 2 'e', return -1

# Algorithm
# 1. Find all substring
# 2. From these substrings select only those that include 2 'a' and 2 'e'
# 3. Then select the longest substring and return its length.

def find_all_substrings(string)
  all_subs = []

  0.upto(string.length - 1) do |index_start|
    index_end = index_start + 3
    while (index_end + index_start) < (string.length + 1) do
      all_subs << string[index_start, index_end]
      index_end += 1
    end
  end

  all_subs
end

p find_all_substrings('babanctekeaa')

def longest_ae(str)
  arr_of_substrings = find_all_substrings(string)

end

# p longest_ae("aaee") == 4
# p longest_ae("babanctekeaa") == 10
# p longest_ae("xenoglossophobia") == -1
# p longest_ae("pteromerhanophobia") == 18
# p longest_ae("johannisberger") == -1
# p longest_ae("secaundogenituareabb") == 16