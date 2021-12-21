=begin
PEDAC Template
==============

-------------------------------------------------------------------------------
(Understand the) Problem
-------------------------------------------------------------------------------
-  Inputs: 2 strings
-  Output: integer
---
**Problem Domain:**
Write a program that can calculate the Hamming distance between two DNA strands.
---
**Explicit Requirements:**
---
**Implicit Requirements:**
--- If the 2 inputs are not the same length, slice the longer one to the length of 
    the shorter one.
**Clarifying Questions:**
1. Is it always upper-case letters?
2. Do I have to deal with inputs that are not strings?
3. 
---
**Mental Model:**
Count the number of differences that occur in the two strings
---

-------------------------------------------------------------------------------
Examples / Test Cases / Edge Cases
-------------------------------------------------------------------------------
**Examples:**
-  Example 1
  -  Inputs:
  -  Output:
-  Example 2
  -  Inputs:
  -  Output:
---
_Your Test Cases:_
-  Example 3
  -  Inputs:
  -  Output:
---
_Your Edge Cases:_
-  Example 4
  -  Inputs:
  -  Output:
  ---
-------------------------------------------------------------------------------
Data Structure
-------------------------------------------------------------------------------
Break the two strings into arrays of characters, then work with these arrays
-------------------------------------------------------------------------------
Algorithm
-------------------------------------------------------------------------------
1) Create a class DNA that takes 1 argument: DNA strand
2) Create an instance method hamming_distance that takes 1 argument
3) Inside the instance method:
   3.0 set index at 0 and sum at 0
   3.1 Find the the shorter strand and start looping through it.
   3.2 At each iteration compare the letter of both strands. If equal add 1 to sum
4) Return sum
-------------------------------------------------------------------------------
Code
-------------------------------------------------------------------------------

=end

class DNA
  def initialize(strand)
    @strand = strand
  end

  def hamming_distance(distance)
    arr = [@strand, distance].sort_by { |ele| ele.size }
    return 0 if arr[0].empty?
    shortest = arr.first.chars
    longest = arr.last.chars

    index = 0
    sum = 0

    shortest.each do |letter|
      sum += 1 if letter != longest[index]
      index += 1
    end

    sum
  end
end