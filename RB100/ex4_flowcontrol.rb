#1) Test the expressions
puts (32 * 4) >= 129 #false
puts false != !true #false
puts true == 4 #false
puts false == (847 == '874') #true
puts (!true || (!(100/5) == 20) || ((328/4) ==82)) || false #true

#2) Write a method that takes a string as an argument
def all_caps(string)
  if string.length >= 10
    puts string.upcase
  else
    puts string
  end
end

all_caps("Hello world!")
all_caps("Hello!")

#3) A method that reports back the range of number
def number_checker
  puts "Please provide a number in the range of 0 to 100"
  num = gets.chomp.to_i
  if 0 <= num && num <= 50
    puts "Your number is between 0 and 50"
  elsif 51 <= num && num <= 100
    puts "Your number is between 51 and 100"
  else
    puts "You clearly did not understand the instructions."
  end
end

#number_checker()

#4) Check the expressions
# Snippet 1
puts '4' == 4 ? puts("TRUE") : puts("FALSE") 
# Output: false

# Snippet 2
x = 2
if ((x * 3) / 2) == (4 + 4 - x - 3)
  puts "Did you get it right?"
else
  puts "Did you?"
end
# Output: "Did you get it right?"

# Snippet 3
y = 9
x = 10
if (x + 1) <= (y)
  puts "Alright."
elsif (x + 1) >= (y)
  puts "Alright now!"
elsif (y + 1) == x
  puts "ALRIGHT NOW!"
else
  puts "Alrighty!"
end
# Output: "Alright now!"

#6) Check the expressions 3
#(32 * 4) >= "129" #Error
#847 == '874' #Error
puts '847' < '846' #False
puts '847' > '846' #True
puts '847' > '8478' #False
puts '847' < '8478' #True