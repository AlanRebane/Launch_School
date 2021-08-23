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

# p longest_ae("aaee") == 4
# p longest_ae("babanctekeaa") == 10
# p longest_ae("xenoglossophobia") == -1
# p longest_ae("pteromerhanophobia") == 18
# p longest_ae("johannisberger") == -1
# p longest_ae("secaundogenituareabb") == 16

def substrings(str)
  arr_of_str = str.chars
  substrings = []
  index_start = 0
  index_end = 3
  
  loop do
    while index_end < str.length do
      substrings << arr_of_str[index_start..index_end]
      index_end += 1
    end
    index_start += 1
    index_end += 1
    break if index_end >= str.length
  end

  substrings.map(&:join)
end

def find_longest_a_and_e(subs)
  longest_list = []
  subs.each do |sub|
    longest_list << sub if (sub.count('a') == 2 && sub.count('e') == 2)
  end
  
  if longest_list.empty?
    -1
  else
    longest_list.sort[-1].size
  end
end

def longest_ae(string)
  subs = substrings(string)
  longest = find_longest_a_and_e(subs)
end

# p longest_ae("aaee") == 4
# p longest_ae("babanctekeaa") == 10
# p longest_ae("xenoglossophobia") == -1
# p longest_ae("pteromerhanophobia") == 18
# p longest_ae("johannisberger") == -1
# p longest_ae("secaundogenituareabb") == 16

################################## Medium 1 ###################################
# Rotate array 1
def rotate_array(arr)
  rotated_arr = arr.dup
  rotated_arr << rotated_arr[0]
  rotated_arr.shift
  rotated_arr
end

# def rotate_array(arr)
#   arr[1..-1] + arr[0]
# end

# p rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
# p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
# p rotate_array(['a']) == ['a']

# p x = [1, 2, 3, 4]
# p rotate_array(x) == [2, 3, 4, 1]   # => true
# p x == [1, 2, 3, 4]                 # => true

# Rotate array 2
def rotate_rightmost_digits(digits, int)
  arr = digits.to_s.chars
  (arr[...-int] + rotate_array(arr[-int..])).join.to_i
end

# def rotate_rightmost_digits(number, n)
#   all_digits = number.to_s.chars
#   all_digits[-n..-1] = rotate_array(all_digits[-n..-1])
#   all_digits.join.to_i
# end

# p rotate_rightmost_digits(735291, 1) == 735291
# p rotate_rightmost_digits(735291, 2) == 735219
# p rotate_rightmost_digits(735291, 3) == 735912
# p rotate_rightmost_digits(735291, 4) == 732915
# p rotate_rightmost_digits(735291, 5) == 752913
# p rotate_rightmost_digits(735291, 6) == 352917

# 735291 =(first)> 352917 =(second)> 329175 =(third)> 321759 => 321597 => 321579
def max_rotation(number)
  max_rotation = number.to_s.size
  while max_rotation > 1
    number = rotate_rightmost_digits(number, max_rotation)
    max_rotation -= 1
  end
  number
end

# p max_rotation(735291) == 321579
# p max_rotation(3) == 3
# p max_rotation(35) == 53
# p max_rotation(105) == 15 # the leading zero gets dropped
# p max_rotation(8_703_529_146) == 7_321_609_845
    
