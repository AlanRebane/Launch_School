#1) Add two strings together
puts "Alan" + " Rebane"

#2) Take a 4 digit number and find the digit in:
puts "enter a 4 digit number"
a = 4936
#  1)thousands place
puts a/1000
#  2)hundreds place
puts (a % 1000) / 100
#  3)tens place
puts (a % 100) / 10
#  4)ones place
puts a % 10

#3) Write a program that uses a hash to store a list
moviez = Hash.new
moviez[:matrix] = 1999
moviez[:inception] = 2000
moviez[:interstellar] = 2014
moviez[:parasite] = 2019

moviez.each_value { |val| puts val}

#4) Use the dates and store them in an array
dates = []
moviez.each_value { |val| dates.push(val) }

#5) Outputting the factorial of the numbers 5,6,7 and 8
def factorial(nums)
  puts "Factorial of #{nums} is:"
  ans = nums * (nums - 1) if nums > 1
  nums -= 1
  while
    nums-1 > 1
    nums -= 1
    ans *= nums
  end
  puts ans
end

factorial(5)
factorial(6)
factorial(7)
factorial(8)

def factorial2(nums)
  puts "Factorial of #{nums} is:"
  my_array = (1..nums).to_a
  ans = 1
  my_array.each { |number| ans *= number}
  puts ans
end

factorial2(8)

#6) Calculating the squares of 3 float numbers
def squarer(x)
  puts x**2
end

squarer(4.1)
squarer(6.3)
squarer(7.4)