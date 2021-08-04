
# Problem 1
flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

def to_hash(some_hash)
  counter = 0
  
  some_hash.each_with_object({}) do |obj, hash|
    hash[obj] = counter
    counter += 1
    hash
  end

end

#p to_hash(flintstones)

# Problem 2
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
#p ages.values.sum
#p ages.values.inject(:+)

# Problem 3
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
#p ages.reject! { |_, value| value > 100}

# Problem 4
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

minimum_age = ages["Herman"]
ages.each do |_, value|
  minimum_age = value if value < minimum_age
end
#p minimum_age
#p ages.values.min

# Problem 5
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

index = nil
flintstones.each_with_index do |value, idx|
  index = idx if value[0, 2] == "Be"
end

#p index
#p flintstones.index { |flints| flints[0, 2] == 'Be'}

# Problem 6
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
#p flintstones.map! { |name| name[0, 3]}

# Problem 7
statement = "The Flintstones Rock"
array_of_statement = statement.chars

test = array_of_statement.each_with_object({}) do |letter, hash|
  hash[letter] = array_of_statement.count(letter)
end

# p test

result = {}
letters = ('A'..'Z').to_a + ('a'..'z').to_a
letters.each do |letter|
  letter_frequency = statement.scan(letter).count
  result[letter] = letter_frequency if letter_frequency > 0
end

# p result

# Problem 8
# notes

# Problem 9
def titleize(string)
  (string.split.map { |word| word.capitalize }).join(' ')
end

words = "the flintstones rock"
#p titleize(words)

# Problem 10
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

def age_grouper(age)
  case age
  when (0..17)
    'kid'
  when (18..64)
    'adult'
  else
    'senior'
  end
end

# munsters.each_key do |key|
#   munsters[key]['age_group'] = age_grouper(munsters[key]['age'])
# end

# p munsters

munsters.each do |key, details|
  case details['age']
  when (0..17)
    details['age_group'] = 'kid'
  when (18..64)
    details['age_group'] = 'adult'
  else
    details['age_group'] = 'senior'
  end
end

# p munsters
