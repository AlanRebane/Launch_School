require 'pry'
# 1. Rotation (part 1)
def rotate_array(array)
  new_array = []
  for i in (1..array.size-1)
    new_array << array[i]
  end
  new_array << array[0]
end

# LS:
def rotation(arr)
  arr[1..-1] + [arr[0]]
end

# 2. Rotation (part 2)
def rotate_rightmost_digits_weak(digits, n)
  str = digits.to_s
  if n == str.size
    rotation(str).to_i
  elsif n == 1
    digits
  else
    (str[0...-n] + str[(-n + 1)..] + str[-n]).to_i
  end
end

# LS (you only work with a sub-array, you rotate the sub-array):
def rotate_rightmost_digits(number, n)
  all_digits = number.to_s.chars
  all_digits[-n..-1] = rotation(all_digits[-n..-1])
  all_digits.join.to_i
end

# 3. Rotation (part 3)
def max_rotation_weak(number)
  num_size = number.to_s.size
  new_number = number.dup
  num_size.times do
    new_number = rotate_rightmost_digits(new_number, num_size)
    num_size -= 1
  end
  new_number
end

# LS:
def max_rotation(number)
  number_digits = number.to_s.size
  number_digits.downto(2) do |n|
    number = rotate_rightmost_digits(number, n)
  end
  number
end

# 4.
=begin
1000 Lights
==============

-------------------------------------------------------------------------------
(Understand the) Problem
-------------------------------------------------------------------------------
-  Inputs: The total number of switches (integer)
-  Output: An array of the lights that are on (array)

**Problem Domain:**
You have a bank of switches before you, numbered from 1 to n. 
Each switch is connected to exactly one light that is initially off. 
You walk down the row of switches and toggle every one of them. 
You go back to the beginning, and on this second pass, 
you toggle switches 2, 4, 6, and so on. On the third pass, 
you go back again to the beginning and toggle switches 3, 6, 9, and so on. 
You repeat this process and keep going until you have been through n repetitions.

**Implicit Requirements:**
* You find the switches which are toggled if the remainder when dividing
* with the number is 0. You increment the number each round until it has
* reached the total number of switches.

**Clarifying Questions:**
1. Will the switches that I toggle on and off go up by 1 each round? Yes

**Mental Model:**
Go through the bank of switches (1 to n) n times. Each time increment the
number which determines the switches that are toggled by 1. To toggle the
switches each round you have to find the switches whose remainder is 0
when divided by the number.

-------------------------------------------------------------------------------
Examples / Test Cases / Edge Cases
-------------------------------------------------------------------------------
1) input  n = 5, output [1, 4]
1) input n = 10, output [1, 4, 9]

-------------------------------------------------------------------------------
Data Structure
-------------------------------------------------------------------------------
Start with creating an array of 1 to n. Now you have the original array with
all the lights on. 1 round is finished. It might make sense to work with nested
arrays or Hashes. Nested arrays like so: [[1,2,3,4,5], []] where the first
subarray shows all the lights that are turned on and the second subarray shows
all the lights that are turned off. Now each round you pass the lights around.

-------------------------------------------------------------------------------
Algorithm
-------------------------------------------------------------------------------
1. Create an array of 1 to n
2. Create a nested array [[], []] where the first one contains lights that are
   on and the second one contains lights that are off.
3. Loop through the nested array n times.
4. At each iteration determine if the light is divisible by the number n
5. If it is, toggle it (change its location from one subarray to the other)
6. If it is not, do nothing.
7. In the end, return the first array of the nested array (the lights which are
   on).

-------------------------------------------------------------------------------
Code
-------------------------------------------------------------------------------

=end

# 5. Bank of lights
def switcher(int)
  all_lights = (1..int).to_a
  on_lights = all_lights.dup
  
  2.upto(int) do |i|
    switchable_lights = []
    all_lights.each { |x| switchable_lights << x if x % i == 0 }
    switchable_lights.each do |light|
      on_lights.include?(light) ? on_lights.delete(light) : on_lights << light
    end
  end
  
  on_lights
end

# 6. Draw a diamond
def diamond(odd_int)
  1.upto(odd_int - 1) do |i|
    puts ("*" * i).center(odd_int) if i.odd?
  end

  puts "*" * odd_int

  (odd_int - 1).downto(1) do |i|
    puts ("*" * i).center(odd_int) if i.odd?
  end
end

# 7. Stack Machine Interpretation
def execute_command(command, stack, register)
  case command
  when 'PRINT' then puts register
  when 'PUSH' then stack.push(register)
  when 'ADD' then register = stack.pop + register
  when 'SUB' then register = register - stack.pop
  when 'MULT' then register = register * stack.pop
  when 'DIV' then register = register / stack.pop
  when 'MOD' then register = register % stack.pop
  when 'POP' then register = stack.pop
  else register = command.to_i
  end
  return register, stack
end

def minilang(commands)
  command_list = commands.split

  stack = []
  register = 0

  command_list.each do |command|
    register, stack = execute_command(command, stack, register)
  end
end

# LS solution
def minilang_ls(program)
  stack = []
  register = 0
  program.split.each do |token|
    case token
    when 'ADD'   then register += stack.pop
    when 'DIV'   then register /= stack.pop
    when 'MULT'  then register *= stack.pop
    when 'MOD'   then register %= stack.pop
    when 'SUB'   then register -= stack.pop
    when 'PUSH'  then stack.push(register)
    when 'POP'   then register = stack.pop
    when 'PRINT' then puts register
    else              register = token.to_i
    end
  end
end

#minilang_ls('3 PUSH 5 MOD PUSH 7 PUSH 4 PUSH 5 MULT SUB PUSH 3 ADD DIV PRINT') => 8

# 8. Word to Digit
def string_digit(string)
  case string
  when 'one'   then "1"
  when 'two'   then "2"
  when 'three' then "3"
  when 'four'  then "4"
  when 'five'  then "5"
  when 'six'   then "6"
  when 'seven' then "7"
  when 'eight' then "8"
  when 'nine'  then "9"
  when 'zero'  then "0"
  end
end

STRING_INTEGER = %w(one two three four five six seven eight nine zero)

def word_to_digit(sentence)
  STRING_INTEGER.each do |number|
    sentence.gsub!(/\b#{number}\b/, string_digit(number))
  end
  sentence
end

# LS
DIGIT_HASH = {
  'zero' => '0', 'one' => '1', 'two' => '2', 'three' => '3', 'four' => '4',
  'five' => '5', 'six' => '6', 'seven' => '7', 'eight' => '8', 'nine' => '9'
}.freeze

def word_to_digit(words)
  DIGIT_HASH.keys.each do |word|
    words.gsub!(/\b#{word}\b/, DIGIT_HASH[word])
  end
  words
end

# 9. Fibonacci Numbers (Recursion)
# F(n) = F(n - 1) + F(n - 2) where n > 2

# def fibonacci(n)
#   return 1 if n <= 2
#   fibonacci(n - 1) + fibonacci(n - 2)
# end

def fibonacci_tail(nth, acc1, acc2)
  if nth == 1
    acc1
  elsif nth == 2
    acc2
  else
    fibonacci_tail(nth - 1, acc2, acc2 + acc1)
  end
end

def fibonacci(nth)
  fibonacci_tail(nth, 1, 1)
end

# 10. Fibonacci Numbers (Procedural)
def fibo_procedural(int)
  ans = [1, 1]
  3.upto(int) do
    ans << (ans[-1] + ans[-2])
    # puts "last element " + ans[-1].to_s
    # puts "second to last element " + ans[-2].to_s
    # puts ans.inspect
  end
  ans[-1]
end

# Note that there is no need to carry the array around!
def fibo_procedural2(nth)
  first, last = [1, 1]
  3.upto(nth) do
    first, last = [last, first + last]
  end

  last
end

# 10. Fibonacci Numbers (Last Digit)
def fibonacci_last(nth)
  first, last = [1, 1]
  3.upto(nth) do
    first, last = [last, (first + last) % 10]
  end

  last
end

p fibonacci_last(1234)
# p fibonacci_last(15)
# p fibonacci_last(20)
# p fibonacci_last(100)