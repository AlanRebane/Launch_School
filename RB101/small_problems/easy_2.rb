
# 1. How old is Teddy?
#p "Teddy is #{rand(20..200)} years old!"

# 2. How big is the room?
SQMETERS_TO_SQFEET = 10.7639

# puts "How long is the room?"
# length = gets.chomp.to_f
# puts "How wide is the room?"
# width = gets.chomp.to_f
# sqm = (length * width).round(2)
# sqf = (sqm * SQMETERS_TO_SQFEET).round(2)

# puts "The area of the room is #{sqm} square meters (#{sqf} square feet)."

# 4. When will I retire?
# puts "What's your age?"
# age = gets.chomp.to_i
# puts "At what age would you like to retire?"
# retire_age = gets.chomp.to_i

# current_time = Time.new.year
# retire_year = current_time + (retire_age - age)

# puts "It's #{current_time}. You will retire in #{retire_year}."

# 5. Greeting a user
# puts "What is your name?"
# name = gets.chomp

# if name[-1] == '!'
#   puts "HELLO #{name.chop.upcase}. WHY ARE WE SCREAMING?"
# else
#   puts "Hello #{name.capitalize}."
# end

# 6. Odd Numbers
# for i in (1..99)
#   puts i if i.even?
# end

# 7. Sum or product
def sum_integers(int)
  (1..int).to_a.sum
end

def integer_products(int)
  (1..int).to_a.inject(:*)
end

# puts "Please enter an integer greater than 0:"
# entered_integer = gets.chomp.to_i
# puts "Enter 's' to compute the sum, 'p' to compute the product."
# sum_or_product = gets.chomp

# p sum_integers(5)
# p integer_products(6)


