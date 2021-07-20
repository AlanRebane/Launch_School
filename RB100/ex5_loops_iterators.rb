#2) Write a while loop
input = "gogogo"
while input != "STOP"
  puts "Tell me something!"
  input = gets.chomp
  puts "That is you: #{input}"
end

x = ""
while x != "STOP" do
  puts "Hi how are you?"
  ans = gets.chomp
  puts "Want me to ask you again?"
  x = gets.chomp
end

#3) A method that counts down to zero using recursion
def count_to_zero(start)
  if start <= 0
    puts "I am at #{start} now!"
  else
    puts "Going down, next up #{start - 1}"
    count_to_zero(start - 1)
  end
end

count_to_zero(2000)