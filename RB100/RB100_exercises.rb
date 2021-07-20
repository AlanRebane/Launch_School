#1) Use the each method of Array to iterate over 
#   [1, 2, 3, 4, 5, 6, 7, 8, 9, 10], and print out each value.
puts "\nExercise 1"
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
arr.each { |num| puts num }

#2) Same as above, but only print out values greater than 5.
puts "\nExercise 2"
arr.each { |num| puts num if num > 5 }

#3) Now, using the same array from #2, use the select method 
#   to extract all odd numbers into a new array.
puts "\nExercise 3"
puts arr.select { |num| (num > 5) && (num % 2 != 0)}

#4) Append 11 to the end of the original array. 
#   Prepend 0 to the beginning.
puts "\nExercise 4"
arr.push(11) # mutates the caller
arr.unshift(0) # mutates the caller
puts arr

#5) Get rid of 11. And append a 3.
puts "\nExercise 5"
arr.pop # mutates the caller
arr.push(3)
puts arr

#6) Get rid of duplicates without specifically removing 
#   any one value.
puts "\nExercise 6"
puts arr.uniq! # to mutate the caller use !

#8) Create a Hash, with one key-value pair, 
#   using both Ruby syntax styles.
puts "\nExercise 8"
oldsyn_hash = {:name => 'Bob'}
newsyn_hash = {name: 'Bob'}
puts oldsyn_hash
puts newsyn_hash

# Another way to create a hash:
hashok = Hash.new
hashok[:name] = 'Bob'
puts hashok

#9) Suppose you have a hash 
h = {a:1, b:2, c:3, d:4}
puts "\nExercise 9"
# 1. Get the value of key ':b'
puts h[:b]
# 2. Add to this hash the key:value pair `{e:5}`
h[:e] = 5
puts h
# 3. Remove all key:value pairs whose value is less than 3.5
h.delete_if {|key, value| value < 3.5}
puts h

#10) Can hash values be arrays? Can you have an array of hashes?
puts "\nExercise 10"
hash1 = {:a => [1,2,3]}
puts hash1

arr1 = [{:a => 1}, {:b => 2}]
puts arr1

#11) Given the following data structures, write a program that
#copies the information from the array into the empty hash that 
#applies to the correct person.
puts "\nExercise 11"
contact_data = [["joe@email.com", "123 Main st.", "555-123-4567"], ["sally@email.com", "404 Not Found Dr.", "123-234-3454"]]

contacts = {"Joe Smith" => {}, "Sally Johnson" => {}}

contacts["Joe Smith"][:email] = contact_data.first[0]
contacts["Joe Smith"][:address] = contact_data.first[1]
contacts["Joe Smith"][:phone] = contact_data.first[2]

contacts["Sally Johnson"][:email] = contact_data.last[0]
contacts["Sally Johnson"][:address] = contact_data.last[1]
contacts["Sally Johnson"][:phone] = contact_data.last[2]

puts contacts

# 12) How to access Joe's email and Sally's phone?
puts "\nExercise 12"
puts contacts["Joe Smith"][:email]
puts contacts["Sally Johnson"][:phone]

#13) Delete all of the strings that begin with an "s" in the 
#following array
puts "\nExercise 13"
arr = ['snow', 'winter', 'ice', 'slippery', 'salted roads', 'white trees']
arr.delete_if { |element| element.start_with?('s') }
puts arr

arr = ['snow', 'winter', 'ice', 'slippery', 'salted roads', 'white trees']
arr.delete_if { |element| element.start_with?('s', 'w') }
puts arr

#14) Manipulate the array. Split the words.
puts "\nExercise 14"
a = ['white snow', 'winter wonderland', 'melting ice',
  'slippery sidewalk', 'salted roads', 'white trees']

a.map! { |e| e.split}
a.flatten!
p a

#15) What will the following program output?
puts "\nExercise 15"
hash1 = {shoes: "nike", "hat" => "adidas", :hoodie => true}
hash2 = {"hat" => "adidas", :shoes => "nike", hoodie: true}

if hash1 == hash2
  puts "These hashes are the same!"
else
  puts "These hashes are not the same!"
end
# If hashes are compared, the order does not matter,
# therefore it will return that the hashes are the same

#16) Write a loop to populate contact information inside a hash.
puts "\nExercise 16"
contact_data = [["joe@email.com", "123 Main st.", "555-123-4567"], ["sally@email.com", "404 Not Found Dr.", "123-234-3454"]]
contacts = {"Joe Smith" => {}, "Sally Johnson" => {}}
fields = [:email, :address, :phone]

# Loop over the hash
i = 0
contacts.each_key do |key|
  # Loop over all the different contact information
  fields.each_index do |index|
    contacts[key][fields[index]] = contact_data[i][index]
  end
  # Select the data for the next person in the contact_data array
  i += 1
end
puts contacts

# Suggested solution
contact_data = [["joe@email.com", "123 Main st.", "555-123-4567"], ["sally@email.com", "404 Not Found Dr.", "123-234-3454"]]
contacts = {"Joe Smith" => {}, "Sally Johnson" => {}}

contacts.each_with_index do |(name, hash), idx|
  fields.each do |field|
    hash[field] = contact_data[idx].shift
  end
end
puts contacts