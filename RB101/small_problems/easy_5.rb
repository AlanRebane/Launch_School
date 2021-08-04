
# 1. ASCII String Value

def ascii_value(string)
  ascii_val = 0
  string.each_char { |x| ascii_val += x.ord}
  ascii_val
end

# p ascii_value('Four score') == 984
# p ascii_value('Launch School') == 1251
# p ascii_value('a') == 97
# p ascii_value('') == 0

# 2. After Midnight (Part 1)
=begin
-------------------------------------------------------------------------------
(Understand the) Problem
-------------------------------------------------------------------------------
-  Inputs: integer
-  Output: String "##:##"
---
**Problem Domain:**
Write a method that takes a time using this minute-based format and returns
the time of day in 24 hour format (hh:mm).

---
**Explicit Requirements:**
1. The method should work with any integer input
2. The format of the output is "hh:mm"

---
**Implicit Requirements:**
1. The integer can also go around the clock ("any integer input")
2. Negative integer goes back in time, positive goes forward.
3. Integer 0 signifies "00:00"

**Mental Model:**
In this method, we want 0 to point to "00:00" and negative integer going
back from "00:00" and positive going forward. Numbers will go around the
clock.
---

-------------------------------------------------------------------------------
Examples / Test Cases / Edge Cases
-------------------------------------------------------------------------------
**Examples:**
time_of_day(0) == "00:00"
time_of_day(-3) == "23:57"
time_of_day(35) == "00:35"
time_of_day(-1437) == "00:03"
time_of_day(3000) == "02:00"
time_of_day(800) == "13:20"
time_of_day(-4231) == "01:29"
---
-------------------------------------------------------------------------------
Data Structure
-------------------------------------------------------------------------------
We take an integer. First we have to see how many hours it contains, then
how many minutes. Hours is maxed out at 23 and minutes are maxed out at 59.
We need conditionals, we do not need arrays or Hashes. It makes sense to
work with divmod() or something that returns remainders.
-------------------------------------------------------------------------------
Algorithm
-------------------------------------------------------------------------------
Given an integer i that represents minutes
0. First, determine how many days fit into the minutes and then work
   only with minutes and disregard the number of days
1. Then determine how many hours fit into the integer i (minutes)
2. Then consider the remainder as minutes, now you have (hh:mm)
3. If the integer i starts with a negative sign, add 24 hours to it.
4. If hours exceeds 23, go for a new round (start with 00 and onwards)
5. Return the result in string format "hh:mm"
-------------------------------------------------------------------------------
Code
-------------------------------------------------------------------------------
=end

def add0?(string)
  string.length < 2 ? string.prepend('0') : string
end

def time_of_day(number)
  day_minutes = number % 1440 # disregard the number of days
  hours, minutes = day_minutes.divmod(60)
  
  add0?(hours.to_s) + ":" + add0?(minutes.to_s)
end

# p time_of_day(0) == "00:00"
# p time_of_day(-3) == "23:57"
# p time_of_day(35) == "00:35"
# p time_of_day(-1437) == "00:03"
# p time_of_day(3000) == "02:00"
# p time_of_day(800) == "13:20"
# p time_of_day(-4231) == "01:29"

# 3. After Midnight (Part 2)
def after_midnight(string)
  hours, minutes = string.split(':').map(&:to_i)
  time_after_midnight = (hours % 24) * 60 + minutes
end

def before_midnight(string)
  return 0 if string == '00:00'
  24 * 60 - ((string[0..1].to_i + string[-2..-1].to_i/60.0) * 60).to_i
end

# p after_midnight('00:00') == 0
# p before_midnight('00:00') == 0
# p after_midnight('12:34') == 754
# p before_midnight('12:34') == 686
# p after_midnight('24:00') == 0
# p before_midnight('24:00') == 0

# 4. Letter Swap

def swap(string)
  arr = string.split
  arr.map do |word|
    word[0], word[-1] = word[-1], word[0]
  end
    
  arr.join(' ')
end

# p swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
# p swap('Abcde') == 'ebcdA'
# p swap('a') == 'a'

# 5. Clean up the words
def cleanup(sentence)
  sentence.gsub(/[^a-z]/, " ").gsub(/[" "]{2,}/, " ")
  #sentence.gsub(/[^a-z]/, " ").squeeze(' ')
end

# p cleanup("---what's my +*& line?") == ' what s my line '

CHARACTERS = ('a'..'z').to_a

def cleanup_long(sentence)
  last_line = ''
  cleaned_string = ''
  
  sentence.each_char do |x|
    
    if CHARACTERS.include?(x)
      cleaned_string << x
      last_line = x
    elsif !CHARACTERS.include?(x) && last_line != " "
      cleaned_string << " "
      last_line = " "
    elsif x == " "
      next
      last_line = " "
    end

  end
  
  cleaned_string
end

# p cleanup_long("---what's my +*& line?")

# 6. Letter counter
=begin
PEDAC Template
==============

-------------------------------------------------------------------------------
(Understand the) Problem
-------------------------------------------------------------------------------
-  Inputs: String
-  Output: Hash (keys: length of the word, values: occurences)
---
**Problem Domain:**
The method shall take a string with one or more space separated words
and return a hash with length of the word as key and occurence as value
---
**Explicit Requirements:**
1. Work with words
2. Words are space separated
---
**Implicit Requirements:**
1. Word needs to be converted to an integer showing the length of the word
---
**Clarifying Questions:**
1.
2.
3.
---
**Mental Model:**
Given a string of words, take out all the words, count their length. Count
how many times this length occurs. Then return a hash with length as the 
key and occurence as the value.
---

-------------------------------------------------------------------------------
word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
word_sizes('') == {}
---
-------------------------------------------------------------------------------
Data Structure
-------------------------------------------------------------------------------
Take the string, split the words and add the words to an array.
String => Array of words
Using the Array => populate the Hash
-------------------------------------------------------------------------------
Algorithm
-------------------------------------------------------------------------------
1. Given a string, split it into an array of words
2. Loop through the array and check the length of a given word.
3. Add the length to a Hash as a key and value 1 signifying 1 occurence
4. If the length occurs again, add 1 to the value.
5. Return the hash
-------------------------------------------------------------------------------
Code
-------------------------------------------------------------------------------

=end

def word_sizes(sentence)
  occ_hash = Hash.new(0)

  sentence.split.each do |word|
    occ_hash[word.size] += 1
  end

  occ_hash
end

# p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
# p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
# p word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
# p word_sizes('') == {}


def word_sizes2(sentence)
  occ_hash = Hash.new(0)

  sentence.split.each do |word|
    length = word.downcase.delete("^a-z").size
    occ_hash[length] += 1
  end

  occ_hash
end

p word_sizes2('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
p word_sizes2('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
p word_sizes2("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
p word_sizes2('') == {}