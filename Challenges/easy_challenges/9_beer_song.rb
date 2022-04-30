=begin

write 3 functions: verse(input), lyrics and song_generator

song_generator shall be in an array and it shall contain all the lyrics

problem: write a program that generates the lyrics and can later
access the lyrics based on a verse and also print out the whole lyrics.

examples:
Note the verses 2, 1 and 0. There we don't have plural.

data structure: store the lyrics in an array, where one verse is an element
"#{num_of_beers} bottles of beer on the wall, #{num_of_beers} bottles of beer.\n
Take one down and pass it around, #{num_of_beers -1 } bottles of beer on the wall.\n"

algorithm: write a beer song lyrics generator:
1) from 99 to 3, implement a loop which populates an array with verses:
   - 99.downto(3) do |num_of_beers|
2) append the verses 2, 1 and 0 manually

3) method verse(*args) outputs the range of verses selected.
4) method lyrics outputs the whole song.
=end

class BeerSong
  def self.verse(verse_num)
    beer_song_generator[verse_num]
  end

  def self.verses(start_verse, end_verse)
    beer_song_generator[end_verse..start_verse].reverse.join("\n")
  end

  def self.lyrics
    beer_song_generator.reverse.join("\n")
  end

  class << self
    private

    def beer_song_generator
      beer_song = []
      99.downto(3) do |verse_num|
        beer_song << "#{verse_num} bottles of beer on the wall, "\
          "#{verse_num} bottles of beer.\n" \
          "Take one down and pass it around, "\
          "#{verse_num - 1} bottles of beer on the wall.\n"
      end

      beer_song += ["2 bottles of beer on the wall, 2 bottles of beer.\n"\
        "Take one down and pass it around, 1 bottle of beer on the wall.\n",
        "1 bottle of beer on the wall, 1 bottle of beer.\n"\
        "Take it down and pass it around, no more bottles of beer on the wall.\n",
        "No more bottles of beer on the wall, no more bottles of beer.\n"\
        "Go to the store and buy some more, 99 bottles of beer on the wall.\n"]

      beer_song.reverse
    end
  end
end