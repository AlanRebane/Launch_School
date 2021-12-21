=begin
input => integers
output => Roman number equivalent

requirements =>
* no need to go above 3000
* the numbers are =>
I, II, III - 1 to 3
V - 5
X - 10
L - 50
C - 100
D - 500
M - 1000

Take a number and output it's Roman number equivalent

# Some examples =>
1990 is MCMXC
1000=M
900=CM
90=XC

2008 is MMVIII
2000=MM
8=VIII

1867 is MCCMXLVII

# Data Structures
Input of number, numeric object. I need to look at each digit,
convert the number to string and work with letters (which are numbers in string format)

Array of characters represents the digits

Output a String

# Algorithm
1) Given a number n, convert it to string and then to array of characters.
2) Reverse the array and start from the smallest number =>
   I - 1, X - 10, C - 100, they can be many, but not more than 3
   
   Until 3, multiply I, X, C, or M with the number
   If 4, use V - 5, L - 50, D - 500, prepended with I, X, C, or M
   If 5, use V, L, D
   If 6 to 8, append I, X, C, M * (n - 5) to V, L, D
   If 9, prepend X, C, or M with I, X, or C
   If 10, use X, C or M.

3) So the algorithm should work like so =>
Number is 1867
Get the first digit, 7, determine the Roman equivalent (VII),
Then get the second digit, 6, determine the Roman equivalent (LX) and prepend =>
'LX' + 'VII' = 'LXVII'
Then get the third digit, 8, determine the Roman equivalent (DCCC)
'DCCC' + 'LXVII' = 'DCCCLXVII'


15 XV
18 - XVIII
23 - XXIII
97 - XCVII
156 - CLVI
189 - CXXCIX
203 - CCIII
570 - DLXX
759 - DCCLIX
976 - CM

{1 => I, 2 => II, 3 => III, 4 => IV, 5 => V, 6 => VI, 7 => VII, 8 => VIII, 9 => IX, 10 => X,
20 => XX, 30 => XXX, 40 => XL, 50 => L, 60 => LX, 70 => LXX, 80 => LXXX, 90 => XC,
100 => C, 200 => CC, 300 => CCC, 400 => CD, 500 => D, 600 => DC, 700 => DCC, 800 => DCCC, 900 => CM,
1000 => M}

If 

I - 1
V - 5
X - 10
L - 50
C - 100
D - 500
M - 1000

=end

# class RomanNumeral
#   ROMANS = {0 => '', 1 => 'I', 2 => 'II', 3 => 'III', 4 => 'IV', 5 => 'V', 
#     6 => 'VI', 7 => 'VII', 8 => 'VIII', 9 => 'IX', 10 => 'X', 20 => 'XX', 
#     30 => 'XXX', 40 => 'XL', 50 => 'L', 60 => 'LX', 70 => 'LXX', 80 => 'LXXX', 
#     90 => 'XC', 100 => 'C', 200 => 'CC', 300 => 'CCC', 400 => 'CD', 500 => 'D',
#     600 => 'DC', 700 => 'DCC', 800 => 'DCCC', 900 => 'CM', 
#     1000 => 'M', 2000 => 'MM', 3000 => 'MMM'}

#   def initialize(num)
#     @num = num
#   end

#   def to_roman
#     roman_num = ''
#     num, remainder = @num.divmod(1000)
#     roman_num += ROMANS[num*1000]
#     num, remainder = remainder.divmod(100)
#     roman_num += ROMANS[num*100]
#     num, remainder = remainder.divmod(10)
#     roman_num = roman_num + ROMANS[num*10] + ROMANS[remainder]    
#   end
# end

class RomanNumeral
  attr_accessor :number

  ROMAN_NUMERALS = {
    "M" => 1000,
    "CM" => 900,
    "D" => 500,
    "CD" => 400,
    "C" => 100,
    "XC" => 90,
    "L" => 50,
    "XL" => 40,
    "X" => 10,
    "IX" => 9,
    "V" => 5,
    "IV" => 4,
    "I" => 1
  }

  def initialize(num)
    @number = num
  end

  def to_roman
    roman_num = ''
    to_convert = number

    ROMAN_NUMERALS.each do |key, value|
      multiplier, remainder = to_convert.divmod(value)
      if multiplier > 0
        roman_num += (key * multiplier)
      end
      to_convert = remainder
    end
    roman_num
  end
end
