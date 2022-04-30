=begin
Implement octal to decimal conversion.
Input: Octal string
Output: Decimal number

Decimal is a base-10 system

Octal is a base-8 system

Given an octal number, convert it to decimal.

Examples:
Given '10', output  8
Given '17', output 15
Given '11', output  9

decimal 15 = octal 17:
1 * (8 ** 1) + 7 * (8 ** 0) = 15

data structure:
Take the input and convert it to an array of integer.
Reduce the sum of the array to an integer.

algorithm:
1. Check for invalidity - conditions when it is invalid - it contains letters, one number is above 7
2. Split the characters to an array, convert them to integers
3. Perform the operation:
  - Get the array size
  - Array size down to 0 do the following:
    given the number, multiply it by 8 to the power of current index in the loop
    add the number to the sum
4. Return the sum
=end

class Octal
  def initialize(start)
    @octal = start
  end

  def to_decimal
    return 0 unless valid?

    arr = @octal.chars.map(&:to_i)

    sum = 0
    arr_index = 0
    (arr.size - 1).downto(0) do |index|
      sum += arr[arr_index] * (8 ** index)
      arr_index += 1
    end
    
    sum
  end

  private

  def valid?
    @octal == @octal.gsub(/[8-9a-zA-Z]/, '')
  end
end