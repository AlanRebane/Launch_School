# Question 3
def mess_with_vars(one, two, three)
  one = two
  two = three
  three = one
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}" # => one
puts "two is: #{two}" # => two
puts "three is: #{three}" # => three

def mess_with_vars(one, two, three)
  one = "two"
  two = "three"
  three = "one"
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}" # => one
puts "two is: #{two}" # => two
puts "three is: #{three}" # => three

def mess_with_vars(one, two, three)
  one.gsub!("one","two")
  two.gsub!("two","three")
  three.gsub!("three","one")
end

one = "one"
two = "two"
three = "three"

mess_with_vars(one, two, three)

puts "one is: #{one}" # => two
puts "two is: #{two}" # => three
puts "three is: #{three}" # => one

# Question 4
def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  return false unless dot_separated_words.length == 4

  dot_separated_words.all? { |word| is_an_ip_number?(word) }
end

def is_an_ip_number?(number_string)
  (0...250).include? number_string.to_i
end

p dot_separated_ip_address?("10.4.11.160")