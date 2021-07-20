#1) Gather only immediate family members' names into a new array
family = {  uncles: ["bob", "joe", "steve"],
  sisters: ["jane", "jill", "beth"],
  brothers: ["frank","rob","david"],
  aunts: ["mary","sally","susan"]
}

close_fam = family[:sisters] + family[:brothers]
p close_fam

immediate_family = family.select do |k, v|
  k == :sisters || k == :brothers
end
arr = immediate_family.values.flatten
p arr

#2) Compare merge and merge!

#3) Loop through a hash
family1 = {  uncle: "bob",
  sister: "jane",
  brother: "frank",
  aunt: "susan"
}

family1.each { |key, value| puts key}

family1.each_value do |val|
  puts val
end

#5) Write a program that verifies that the value is within the hash
person = {name: 'Bob', occupation: 'web developer', hobbies: 'painting'}
puts person.value?('Bob') # to check if a value is in the hash
puts person.include?(:name) # to check if a key is in the hash