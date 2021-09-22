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

def string_to_substrings(string)
  arr_of_substrings = []
  
  0.upto(string.length) do |index_start|
    index_end = 4

    while (index_end + index_start) <= string.length
      arr_of_substrings << string[index_start, index_end]
      index_end += 1
    end
  end
  
  arr_of_substrings
end

def longest_ae(string)
  return -1 if string.length <= 3

  array_of_substrings = string_to_substrings(string)

  array_of_substrings.select! do |element|
    element.count('a') == 2 && element.count('e') == 2
  end

  return -1 if array_of_substrings.empty?

  memory = array_of_substrings[0].length
  array_of_substrings.each { |ele| memory = ele.length if ele.length > memory}

  memory
end

# p longest_ae("aaee") == 4
# p longest_ae("babanctekeaa") == 10
# p longest_ae("xenoglossophobia") == -1
# p longest_ae("pteromerhanophobia") == 18
# p longest_ae("johannisberger") == -1
# p longest_ae("secaundogenituareabb") == 16


########## Live coding 1.1 ##########
=begin
Given a non-empty string, check if it can be constructed by taking a substring
of it and appending multiple copies of the substring together. You may assume
the given string consists of lowercase English letters only
=end

def string_to_substrings(string)
  arr_of_substrings = []
  index_end = 1
  
  while index_end <= (string.length / 2)
    arr_of_substrings << string[0, index_end]
    index_end += 1
  end

  arr_of_substrings
end


def repeated_substring_pattern(string)
  return false if string.length.odd?

  arr_of_substrings = string_to_substrings(string)

  arr_of_substrings.each do |substr|
    until substr.length >= string.length
      substr << substr
      return true if substr == string
    end
  end

  false
end

########## Live coding 1.2 ##########
# Test cases
# p repeated_substring_pattern("abab") == true
# p repeated_substring_pattern("aba") == false
# p repeated_substring_pattern("aabaaba") == false
# p repeated_substring_pattern("abaababaab") == true
# p repeated_substring_pattern("abcabcabcabc") == true

=begin
Given an array of strings made only from lowercase letters, return an array of
all characters that show up in all strings within the given array (including
duplicates). For example, if a character occurs 3 times in all strings but not
4 times, you need to include that character three times in the final answer. 
=end

# input: array of strings
# output: array of characters

# solution: given an array of words, take the first word, and check if the
# characters of this first word occur in all other words. If the character
# occurs in all other words, add it to the output array.


def common_chars(arr)
  arr = arr.map { |word| word.dup }

  chars = arr.shift.chars

  chars.select do |char|
    arr.all? { |word| word.sub!(char, '') }
  end
end

# p common_chars(["bella", "label", "roller"])
# p common_chars(['cool', 'lock', 'cook'])

########## Live coding 2.1 ##########
# You have to create a method that takes a positive integer number and returns
# the next bigger number formed by the same digits:

# 12 ==> 21
# 513 ==> 531
# 2017 ==> 2071
# If no bigger number can be composed using those digits, return -1

# Input: integer
# Output: integer

# 1. Take the integer, string it
# 2. Check if the number is already maximum, if it is, return -1
# 3. If it is not maximum, reverse the last two digits.

def next_bigger_num(int)
  str = int.to_s
  return -1 if str.chars.sort.join == str.reverse
  
  str[-2], str[-1] = str[-1], str[-2]

  str.to_i
end

# p next_bigger_num(9) == -1
# p next_bigger_num(12) == 21
# p next_bigger_num(513) == 531
# p next_bigger_num(2017) == 2071

# p next_bigger_num(111) == -1
# p next_bigger_num(531) == -1
# p next_bigger_num(123456789) == 123456798

########## Live-coding 3.1 ##########
# The maximum sum subarray problem consists in finding the maximum sum of a
# contiguous subsequence in array of integers:

# maxSequence [-2, 1, -3, 4, -1, 2, 1, -5, 4]
# -- should be 6: [4, -1, 2, 1]



def max_sequence(arr)
  return 0 if arr.empty? || arr.all? { |num| num <= 0}

  max_sum = arr.max

  2.upto(arr.size) do |sub_array_size|
    index_start = 0
    current_sum = 0
    while (index_start + sub_array_size) <= arr.size
      current_sum = arr[index_start, sub_array_size].sum
      max_sum = current_sum if current_sum > max_sum
      index_start += 1
    end
  end

  max_sum
end

# p max_sequence([]) == 0
# p max_sequence([-2, 1, -3, 4, -1, 2, 1, -5, 4]) == 6
# p max_sequence([11]) == 11
# p max_sequence([-32]) == 0
# p max_sequence([-2, 1, -7, 4, -10, 2, 1, 5, 4]) == 12

########## Live coding 3.2 ##########
# Write a method to find the longest common prefix string amongst an array
# of strings.

# If there is no common prefix, return an empty string "".

# Example 1:
# Input: ["flower", "flow", "flight"]
# Output: "fl"

# Input: Array of words
# Output: String

# 1. Sort the input array and select the shortest word
# 2. Check if all other words start with the shortest word
# 3. If not, then cut the last letter and check again
# 4. If there is, then return the common prefix
# 5. If there is no common prefix, return 0

def common_prefix(arr)
  arr = arr.sort_by { |word| word.length }

  prefix_word = arr.shift

  while prefix_word.size > 0
    return prefix_word if arr.all? { |word| word.start_with?(prefix_word)}
    prefix_word = prefix_word[..-2]
  end

  ""
end

# p common_prefix(["flower", "flow", "flight"]) == 'fl'
# p common_prefix(["dog", "racecar", "car"]) == ''
# p common_prefix(["interspecies", "interstellar", "interstate"]) == 'inters'
# p common_prefix(["throne", "dungeon"]) == ''
# p common_prefix(["throne", "throne"]) == 'throne'



########## Live coding 4.1 ##########
=begin
Given 2 strings, your job is to find out if there is a substring that
appears in both strings. You will return true if you find a substring
that appears in both strings, or false if you do not. We only care about
substrings that are longer than one letter long.
=end

# Input - 2 strings
# Output - true/false

# 1. Take the first string, find all substrings that are at least 2 letters
# 2. Check if the second string contains any of the substrings, return true
# 3. Else return false

def string_to_substrings(string)
  arr_of_substrings = []

  0.upto(string.length) do |index_start|
    index_length = 2
    while (index_start + index_length) <= string.length do
      arr_of_substrings << string[index_start, index_length]
      index_length += 1
    end
  end

  arr_of_substrings
end

def substring_test(string1, string2)
  arr_of_substrings = string_to_substrings(string1.downcase)

  string2 = string2.downcase

  arr_of_substrings.each do |substring|
    return true if string2.include?(substring)
  end

  false
end

# p substring_test('Something', 'Fun') == false
# p substring_test('Something', 'Home') == true
# p substring_test('Something', '') == false
# p substring_test('', 'Something') == false
# p substring_test('BANANA', 'banana') == true
# p substring_test('1234567', '541265') == true

########## Live coding 4.2 ##########
=begin
Write a function scramble(str1, str2) that returns true if a portion of str1
characters can be rearranged to match str2, otherwise return false.

Examples:
str1 is 'rkqodlw' and str2 is 'world' the output should return true
=end

# Input: 2 strings
# Output: true/false

# 1. Split the first string into an array of characters
# 2. Loop through each character and check if it occurs in the second string
# 3. If it occurs, sub the character out of string2.
# 4. If string2 is empty, return true, else false

def scramble(str1, str2)
  str2 = str2.dup

  str1.chars.each do |char|
    str2.sub!(char, '') if str2.include?(char)
    return true if str2.empty?
  end

  false
end

# p scramble('javaass', 'jjss') == false
# p scramble('rkqodlw', 'world') == true
# p scramble('katas', 'steak') == false


########## Live coding 5.1 ##########
# Find the length of the longest substring in the given string that is the
# same in reverse

# Input: string
# Output: integer, substring length

# rules
#   If the length of the input string is 0, return 0
#   substrings can also be of length 1

# 1. Find all substrings in the string, and put them into an array
# 2. Select only those substrings that are palindromes (same in reverse)
# 3. Convert the array into substring length and return the highest number

def find_all_substrings(string)
  substring_array = []

  0.upto(string.length) do |current_index|
    substring_length = 1
    while (current_index + substring_length) <= string.length
      substring_array << string[current_index, substring_length]
      substring_length += 1
    end
  end

  substring_array
end

def longest_palindrome(string)
  substring_array = find_all_substrings(string)

  substring_array.select! { |substr| substr == substr.reverse }

  substring_array.map! { |substr| substr.length }

  substring_array.max
end

# p longest_palindrome('a') == 1
# p longest_palindrome('aa') == 2
# p longest_palindrome('baa') == 2
# p longest_palindrome('racecar') == 7

########## Live coding 6.1
=begin 
You are goin to be given an array of integers. Your job is to take that
array and find an index N where the sum of the integers to the left of N
is equal to the sum of the integers to the right of N. If there is no index
that would make this happen, return -1.
=end

# rules:
#   when I take the index, I do not use the value at that index for caluclation
#   empty array is equal to 0
#   what if I don't have an index where left and right are equal? return -1

# input: array of integers
# output: an integer (refers to an index)

# 1. Check if the sum of the array is 0, if it is, return 0
# 2. Start looping through the array. During each iteration calculate
#    the right hand side value and the left hand side value.
# 3. Check if the values match, if they do, return the index number.
#    If they don't, go to the next iteration.
# 4. If from the loop you can't find such an index, return -1.

def find_even_index(array)
  return 0 if array.sum == 0

  array.each_with_index do |val, idx|
    right_hand_side = array[0...idx].sum
    left_hand_side = array[(idx + 1)..].sum
    return idx if right_hand_side == left_hand_side
  end

  -1
end

# p find_even_index([1,2,3,4,3,2,1]) == 3
# p find_even_index([1,100,50,-51,1,1]) == 1
# p find_even_index([1,2,3,4,5,6]) == -1
# p find_even_index([20,10,30,10,10,15,35]) == 3
# p find_even_index([20,10,-80,10,10,15,35]) == 0
# p find_even_index([10,-80,10,10,15,35,20]) == 6
# p find_even_index([-1,-2,-3,-4,-3,-2,-1]) == 3