=begin
input: Word and List of words
output: select the correct word (the anagram) from the list and output it

if there is no word in the list output an empty list

# Data Structure
given a word and an array, select the correct word (the anagram) from the array
It's best to go through all the words in the array.

Use Strings and Arrays

# Algorithm
Given some word x, see if the list contains exact anagrams

1) Loop through the list of words
  1.1) In each loop set the 'original word' to x and convert it to array of chars
2) Take the word, break it down to chars, and loop through the chars
  2.2) If the character occurs in the 'original word', delete the char from the original word
3) If in the end of the inner loop the 'original word' array is empty, add the word to
   answer list
4) Return the answer list

=end


class Anagram
  attr_reader :word

  def initialize(word)
    @word = word.downcase
  end

  def match(word_array)
    word_array.select do |ana|
      ana.downcase != word && anagram?(ana, word)
    end
  end

  private

  def sorted_letters(str)
    str.downcase.chars.sort.join
  end

  def anagram?(word1, word2)
    sorted_letters(word1) == sorted_letters(word2)
  end
end