=begin
input: a natural number, or a set of numbers
output: sum of the multiples of given numbers or 3 and 5

problem - Given a number find all the multiples of 3 and 5 (or other) and
then get the sum.

Data Structures: arrays, create an array of 3 up to the argument and loop through
the array and loop each element again against an array of divisors-

Algorithm
1. Given a divisor, add all elements to the new array until the number
   is greater than the input number
2. Do the same for the next element.
3. Call the unique method on the array to remove duplicates
4. Return the sum of the new array.

=end

class SumOfMultiples
  attr_accessor :divisors

  def initialize(*args)
    @divisors = args
  end

  def self.to(num)
    SumOfMultiples.new(3, 5).to(num)
  end

  def to(num)
    new_arr = []

    divisors.each do |divisor|
      my_num = divisor
      while my_num < num
        new_arr << my_num
        my_num += divisor
      end
    end

    new_arr.uniq.sum
  end
end