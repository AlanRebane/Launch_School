=begin
==============
Write a program to determine whether a triangle is equilateral, isosceles, or scalene.

An equilateral triangle has all three sides the same length.

An isosceles triangle has exactly two sides of the same length.

A scalene triangle has all sides of different lengths.

Note: For a shape to be a triangle at all, all sides must be of length > 0, 
      and the sum of the lengths of any two sides must be greater than the length 
      of the third side.
-------------------------------------------------------------------------------
(Understand the) Problem
-------------------------------------------------------------------------------
-  Inputs: 3 integers
-  Output: either of the three: [an equilateral, an isosceles, a scalene]
---
**Problem Domain:**

---
**Explicit Requirements:**
---
**Implicit Requirements:**
--- Verify that the shape is a proper triangle.
**Clarifying Questions:**
1. How to deal with false inputs?
2. 
3.
---
**Mental Model:**
Given 3 sides, determine whether it is an equilateral, an isosceles or a scalene triangle
---

-------------------------------------------------------------------------------
Examples / Test Cases / Edge Cases
-------------------------------------------------------------------------------
**Examples:**
-  Example 1
  -  Inputs: (3, 3, 3)
  -  Output: 'equilateral'
-  Example 2
  -  Inputs: (3, 2, 2)
  -  Output: 'isosceles'
-  Example 3
  -  Inputs: (4, 2, 3)
  -  Output: 'scalene'

---
_Your Test Cases:_
-  Example 3
  -  Inputs:
  -  Output:
---

_Your Edge Cases:_
-  Example 4
  -  Inputs: (4, 2, 1)
  -  Output: 'invalid'
-  Example 5
  -  Inputs: (4, 2, 1)
  -  Output: 'invalid'
  ---
-------------------------------------------------------------------------------
Data Structure
-------------------------------------------------------------------------------
numeric inputs, string output, define the triangle as an array to find the
hypothenus and sides.
-------------------------------------------------------------------------------
Algorithm
-------------------------------------------------------------------------------
1. If all sides are equal then output 'scalene' and return
2. Then, create an array and sort it
3. Check if the sum of the two smallest values is greater than the largest
4. If not, raise ArgumentError
5. Check if the smallest sides are equal, if yes, output "isosceles"
6. Last line, return 'scalene'
-------------------------------------------------------------------------------
Code
-------------------------------------------------------------------------------

=end

class Triangle
  def initialize(side1, side2, side3)
    @triangle = [side1, side2, side3].sort
    if (@triangle.any? { |num| num <= 0 }) || ((@triangle[0] + @triangle[1]) <= @triangle[2])
      raise ArgumentError
    end
  end

  def kind
    return "equilateral" if @triangle.all?(@triangle[0])
    return "isosceles" if @triangle[-1] == @triangle[-2] || @triangle[0] == @triangle[1]
    'scalene'
  end

end