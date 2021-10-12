# Given an array of n positive integers and a positive integer s, 
# find the minimal length of a contiguous subarray of which the 
# sum ≥ s. If there isn't one, return 0 instead.

# Input: array, integer
# Output: integer

# Rules: Subarray size can be from 1 to the size of the array

# 1. Loop through the array and consider the subarrays from size 1 to array 
#    length.
# 2. If the sum of the subarray is >= to the integer s, save the length of the
#    subarray. Else go to the next subarray.
# 3. From the saved lengths select the smallest value.

def minSubLength(arr, s)
  sum_greater_than_s = []

  0.upto(arr.size) do |starting_idx|
    ending_idx = 1
    while (starting_idx + ending_idx) <= arr.size
      sub_array = arr[starting_idx, ending_idx]
      sum_greater_than_s << sub_array.size if sub_array.sum >= s
      ending_idx += 1
    end
  end

  sum_greater_than_s.empty? ? 0 : sum_greater_than_s.min
end

# p minSubLength([2,3,1,2,4,3], 7) == 2
# p minSubLength([1, 10, 5, 2, 7], 9) == 1
# p minSubLength([1, 11, 100, 1, 0, 200, 3, 2, 1, 250], 280) == 4
# p minSubLength([1, 2, 4], 8) == 0


# Given integer array nums, return the third maximum number in this array. 
# If the third maximum does not exist, return the maximum number. 
# You are not allowed to sort the array

# input: array
# output: integer

# <=> returns 1 if greater, 0 if equal, -1 if smaller

# 1. Compare the first and second, switch the positions if the second one is 
#    greater than the first one.
# 2. Compare the second and the third, switch position if the third is greater and so on
# 3. Select the third element from the array, if it is nil, return max

# def third_max(arr)
#   return arr.max if arr.size < 3

#   loop do
#     first_idx = 0
#     second_idx = 1

#     number_of_sortings = 0
#     while second_idx < arr.length
#       if (arr[first_idx] <=> arr[second_idx]) == 1
#         arr[second_idx], arr[first_idx] = arr[first_idx], arr[second_idx]
#         number_of_sortings += 1
#       elsif (arr[first_idx] <=> arr[second_idx]) == 0
#         arr = arr.drop(second_idx)
#       end

#       first_idx += 1
#       second_idx += 1
#     end

#     break if number_of_sortings == 0
#   end
  
#   arr[-3]
# end

#       ******      ******      Another try      ******       ******

# Given integer array nums, return the third maximum number in this array. 
# If the third maximum does not exist, return the maximum number. 
# You are not allowed to sort the array

# rules: it must be smaller than 2 numbers, the largest and the second largest.
# I could get the largest number using arr.max, then loop through the array 
# and check whether there is a number corresponding to arr.max - 1. If there is,
# save it, then proceed until arr.min:

def third_max(arr)
  sorted_arr = [arr.max]

  (arr.max - 1).downto(arr.min) do |current_num|
    sorted_arr << current_num if arr.include?(current_num)
  end

  sorted_arr[2] != nil ? sorted_arr[2] : arr.max
end

# p third_max([3,2,1]) == 1
# p third_max([1,2]) == 2
# p third_max([2,2,3,1]) == 1
# p third_max([1, 3, 4, 2, 2, 5, 6]) == 4


arr = ["9", "8", "7", "10", "11"]
p (arr.sort do |x, y|
    y.to_i <=> x.to_i
  end)

# Expected output: ["11", "10", "9", "8", "7"] 
# Actual output: ["10", "11", "7", "8", "9"] 