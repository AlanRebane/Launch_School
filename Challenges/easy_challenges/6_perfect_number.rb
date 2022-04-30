=begin
input: takes an integer
output: 3 options - "abundant", "perfect", "deficient"

Problem: Take a number, take the sum of its divisors and determine if
the sum is smaller, equal or greater to the original integer

Data structure: create an array of numbers from 1 till input/2

Algorithm:
1. Test whether the integer is below 1, if it is raise Standard Error
2. create an array of numbers from 1 till input/2 [1, 2, 3, ...]
3. Select the numbers that don't have a remainder when dividing
4. Calculate the sum of the array
5. Write a long case/if statement for the output

=end

class PerfectNumber
  def self.classify(int)
    raise StandardError if int < 1

    array = (1..(int / 2)).to_a.select { |n| int % n == 0 }
    array_sum = array.sum

    if array_sum < int
      'deficient'
    elsif array_sum == int
      'perfect'
    else
      'abundant'
    end
  end
end
