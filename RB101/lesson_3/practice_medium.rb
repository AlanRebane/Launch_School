# Question 1
flint = "The Flintstones Rock!"
10.times { |i| puts " " * i + flint}

# Question 2
puts "the value of 40 + 2 is " + (40 + 2).to_s

# Question 3
def factors(number)
  divisor = number
  factors = []
  while divisor > 0 do
    factors << number / divisor if number % divisor == 0
    divisor -= 1
  end
  factors
end

# Question 4
def rolling_buffer1(buffer, max_buffer_size, new_element)
  buffer << new_element
  buffer.shift if buffer.size > max_buffer_size
  buffer
end

def rolling_buffer2(input_array, max_buffer_size, new_element)
  buffer = input_array + [new_element]
  buffer.shift if buffer.size > max_buffer_size
  buffer
end

buffer = [1,2,3,4,5]
max_buffer_size = 6
new_element = 6
p rolling_buffer1(buffer, max_buffer_size, new_element)
p buffer

buffer = [1,2,3,4,5]
p rolling_buffer2(buffer, max_buffer_size, new_element)
p buffer

# Question 5
limit = 15

def fib(first_num, second_num, limit)
  while first_num + second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

result = fib(0, 1, limit)
puts "result is #{result}"

# Question 6
answer = 42

def mess_with_it(some_number)
  some_number += 8
end

new_answer = mess_with_it(answer)

#p answer - 8

# Question 7
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

def mess_with_demographics(demo_hash)
  demo_hash.values.each do |family_member|
    family_member["age"] += 42
    family_member["gender"] = "other"
  end
end
# The program does not reassign demo_hash, it just uses it as-is.
# The actual hash object that is being messed with inside the method
# IS the munsters hash.

# Question 8

def rps(fist1, fist2)
  if fist1 == "rock"
    (fist2 == "paper") ? "paper" : "rock"
  elsif fist1 == "paper"
    (fist2 == "scissors") ? "scissors" : "paper"
  else
    (fist2 == "rock") ? "rock" : "scissors"
  end
end

#### Practice Problems: Medium 2 ####
# Question 3
def tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param << "rutabaga"
  puts a_string_param.object_id
  puts an_array_param.object_id
end

my_string = "pumpkins"
my_array = ["pumpkins"]
p my_string.object_id
p my_array.object_id
tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"

# Question 4
def tricky_method_two(a_string_param, an_array_param)
  a_string_param << 'rutabaga'
  an_array_param = ['pumpkins', 'rutabaga']
  puts a_string_param.object_id
  puts an_array_param.object_id
end

my_string = "pumpkins"
my_array = ["pumpkins"]
p my_string.object_id
p my_array.object_id
tricky_method_two(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"