#1) Write a program that checks to see if the number appears in the array
arr = [1, 3, 5, 7, 9, 11]
number = 3
puts arr.include?(number)

#2) What will the programs return?
arr = ['a', 'b']
arr = arr.product(Array(1..3))
# => [['a', 1], ['a', 2], ['a', 3], ['b', 1], ['b', 2], ['b', 3]]
arr.first.delete(arr.first.last)
# => it will delete 1 from the array and return it!

arr = ['b', 'a']
arr = arr.product([Array(1..3)])
# notice that [Array(1..3)] retruns [[1,2,3]] and not [1,2,3]
# => [['b', [1,2,3]], ['a', [1,2,3]]
arr.first.delete(arr.first.last)
# => [1,2,3]

#3) How do you return 'example' from the array?
arr = [['test', 'hello', 'world'], ['example', 'mem']]
# One way to return 'example':
puts arr[1][0]
# Another way:
puts arr.dig(1,0)
# Yet another way:
puts arr.last.first

#4) What does each method return in the following example?
arr = [15, 7, 18, 5, 12, 8, 5, 1]
puts arr.index(5)
# Returns the location of the first 5
# => 3
#puts arr.index[5]
# => error
puts arr[5]
# => 8

#5) What is the value of a, b, c in the program?
string = "Welcome to America!"
a = string[6] # => 'e'
b = string[11] # => 'A'
c = string[19] # => nil or empty space
puts a, b, c

#7) Iterate through an array with the each_with_index method
arr = ['salsa', 'foo', 'moo', 'zoo']
arr.each_with_index { |val, ind| puts "#{ind}, #{val}" }

#8) Write a program that iterates over an array...
arr1 = [1, 2, 3, 4 ,5]
arr2 = arr1.map { |val| val + 2 }

p arr1
p arr2