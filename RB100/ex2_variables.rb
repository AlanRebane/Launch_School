#1) Asks the user's name and then greets her
puts "Hi, what's your first name?"
first = gets.chomp
puts "Hi, what's your last name?"
last = gets.chomp
full_name = first + " " + last
puts "Hello, #{full_name}!"

#2) Ask for the user's name and then add 10, 20, 30, 40 to it
puts "Hi, how old are you?"
age = gets.chomp.to_i
puts "In 10 years you will be:"
puts age + 10
puts "In 20 years you will be:"
puts age + 20

#3) Puts the user's name 10 times
10.times {puts "Your name is #{full_name}"}