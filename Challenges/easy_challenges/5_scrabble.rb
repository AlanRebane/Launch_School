=begin
# input: word
# output: scrabble score (score based on a table)

# Each letter in the word is assigned a scrabble score.

* Data Structures
Input a string, output an integer
Storing the scrabble score: use a hash, letter as key, value as value

* Algorithm
1) Populate the hash, where the letter is the key, and value is value
2) Next, loop through the characters of the word and sum up the score
3) Return the score.

keep in mind to not count \t and \n, tab and new line symbols
=end

class Scrabble
  SCRABBLESCORES = [[['A', 'E', 'I', 'O', 'U', 'L', 'N', 'R', 'S', 'T'], 1],
            [['D', 'G'], 2],
            [['B', 'C', 'M', 'P'], 3],
            [['F', 'H', 'V', 'W', 'Y'], 4],
            [['K'], 5],
            [['J', 'X'], 8],
            [['Q', 'Z'], 10]]

  def initialize(word)
    @word = word
  end

  def score
    clean_word
    lookup_hash = read_to_hash
    score = 0
    @word.chars.each do |char|
      score += lookup_hash[char.downcase]
    end
    score
  end


  def self.score(word)
    Scrabble.new(word).score
  end
      
  def read_to_hash
    hsh = {}
    SCRABBLESCORES.each do |in_array|
      in_array[0].each do |letter|
        hsh[letter.downcase] = in_array[1]
      end
    end
    hsh
  end

  def clean_word
    @word = '' if @word == nil
    @word.gsub!(/ \t\n/, '')
  end
end