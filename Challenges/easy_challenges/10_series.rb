=begin
input: string of digits
output: return all possible consecutive number series (specificed with an argument)

If the argument is longer than the string length, throw an error

Given a string length, return all the possible consecutive number series

Example:
"01234"
length of 3
* 012
* 123
* 234

length of 4
*0123
*1234

length of 6
* ArgumentError

Data Structure:
Input is a string, the output is an array of arrays, where the inner arrays
represent the consecutive numbers and the numbers inside are integers.

Algorithm:
1. If slices argument is greater than the length throw an ArgumentError
2. Create an empty array.
3. Given a string formated number, "01234", slice it in the length that
   is given in the argument.
4. Slice to characters and characters to digits and append the array to the main
5. Increment the start position and continue until the end position is at
   the last digit.
6. Return the main array.
=end

class Series
  def initialize(num)
    @number = num
  end

  def slices(argument)
    raise ArgumentError if argument > @number.size

    main = []

    start_idx = 0
    end_idx = argument - 1

    loop do
      break if end_idx > @number.size - 1
      slice = @number[start_idx..end_idx]
      main << slice.chars.map(&:to_i)
      start_idx += 1
      end_idx += 1
    end

    main
  end
end
