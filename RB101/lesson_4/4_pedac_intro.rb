# START
#
#   /* Given a string named `string` */
def substring(string)

#
#   SET result = []
#   SET starting_index = 0
  results = []
  starting_index = 0

#
#   WHILE starting_index <= length of string - 2
  while starting_index <= string.length - 2

#     SET numChars = 2
    num_chars = 2

#     WHILE numChars <= length of string - starting_index
    while num_chars <= string.length - starting_index

#       SET substring = num_chars characters from string starting at index starting_index
      substring = string[starting_index, num_chars]
      
#       append substring to result array
      results << substring

#       SET num_chars = num_chars + 1
      num_chars += 1
    end
#
#     SET starting_index = starting_index + 1
    starting_index += 1
  end

#
#   RETURN result
  results

#
# END
end

def is_palindrome?(substring)
  substring == substring.reverse
end

def palindrome_substrings(string)
  result = []
  substring_arr = substring(string)
  substring_arr.each do |substring|
    result << substring if is_palindrome?(substring)
  end
  result
end

p palindrome_substrings("supercalifragilisticexpialidocious")
p palindrome_substrings("abcddcbA")
p palindrome_substrings("palindrome")
p palindrome_substrings("")

# PROBLEM:

# Given a string, write a method change_me which returns the same
# string but with all the words in it that are palindromes uppercased.

# change_me("We will meet at noon") == "We will meet at NOON"
# change_me("No palindromes here") == "No palindromes here"
# change_me("") == ""
# change_me("I LOVE my mom and dad equally") == "I LOVE my MOM and DAD equally"

##### Understand the probelm ####

# Some relevant questions:
# What is a palindrome?
# Do we have to modify the existing string or return a new one?
# Will input always be string?

# input: String
# output: String

# rules:
# Explicit requirements:
# - Return a new string, which has palindromes uppercased
# - Palindrome words are case sensitive ("Aba" is not a palindrome)
# Implicit requirements:
# - Uppercased words are returned uppercased even when the word is not a palindrome
# - If there are no palindromes (or the string is empty) return the same string

#### Algorithm ####

# Write a method change_me, which takes one String as an input.
# Given the string, split the words into an array so I could check the string word by word
# Given this array loop through it and check whether a word is a palindrome.
# If the word is a palindrome, convert it to uppercased, else leave it as it is.
# Join this array together into a string.
# Return the string.

def change_me(str)
  arr = str.split(' ')
  
  arr.map do |word|
    word.upcase! if is_palindrome?(word)
  end
  
  new_string = arr.join(' ')

end      

def is_palindrome?(word)
  word == word.reverse
end

p change_me("We will meet at noon")
p change_me("No palindromes here")
p change_me("")
p change_me("I LOVE my mom and dad equally")
