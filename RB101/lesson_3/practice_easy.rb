#### Practice Problems: Easy 1 ####
# Question 2
# ! vs ?
user_name = 'foxy'
!user_name

words = %w(foo zoo boo foo)
words.uniq!

true ? user_name : 'else'
!!!user_name

# Question 3
# Replace "important" with "urgent":
advice = "Few things in life are as important as house training your pet dinosaur."
advice.gsub!('important', 'urgent')

#### Practice Problems: Easy 2 ####
# Question 2
munsters_description = "The Munsters are creepy in a good way."
munsters_description.swapcase
munsters_description.capitalize
munsters_description.downcase
munsters_description.upcase

# Question 3
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10 }
additional_ages = { "Marilyn" => 22, "Spot" => 237 }

ages.merge!(additional_ages)

# Question 4
advice = "Few things in life are as important as house training your pet dinosaur."

advice.match?('Dino')
advice.match?('dino')

# Question 5
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

# Question 6
flintstones << "Dino"

# Question 7
flintstones.concat(['Dino', 'Happy'])
flintstones.push('Dino', 'Happy')

# Question 8
advice = "Few things in life are as important as house training your pet dinosaur."
advice.slice!(0, advice.index('house'))

# Question 9
statement = "The Flintstones Rock!"
statement.count("t")

# Question 10
title = "Flintstone Family Members"
title.center(40)
