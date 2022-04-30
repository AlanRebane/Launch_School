=begin
Take a letter as an input and output a diamond that is horizontally
and vertically symmetric

examples:
input: "C"
  A
 B B
C   C
 B B
  A
input: "E"
    A
   B B
  C   C
 D     D
E       E
 D     D
  C   C
   B B
    A

note that input is always an upper case letter

data structures:
Represent the alphabet as an array that is a constant

I have to work with an array, loop until the letter, and then loop back

algorithm:
1) Create a constant array from "A" to "Z"
2) Given the letter, determine its index in the alphabet and store it as "index"
3) Now loop until that index, and during each step do:
   a) puts the letter and prepend index number of spaces before it 
      then the letter at current iteration
      then index - 
   and reduce index by 1
4) Once that loop is done, start another one. This time up to the index number
   puts every letter and prepend the index amount of spaces. Increment index
   by one at each step.
=end

class Diamond
  ALPHABET = ("A".."Z").to_a

  def self.make_diamond(letter)
    idx = ALPHABET.find_index(letter)

    first_and_last = " " * idx + ALPHABET[0] + " " * idx
    string = [first_and_last]
    loop_idx = idx - 1

    1.upto(idx) do |current_idx|
      string << build_row(current_idx, loop_idx) 
      loop_idx -= 1
    end

    loop_idx = 1

    (idx - 1).downto(1) do |current_idx|
      string << build_row(current_idx, loop_idx)
      loop_idx += 1
    end

    string << first_and_last if idx > 0
    string.join("\n") + ("\n")
  end

  def self.build_row(current_idx, loop_idx)
    cur_letter = ALPHABET[current_idx]
    space_before = " " * loop_idx
    middle = " " * (current_idx * 2 - 1)  
    space_before + cur_letter + middle + cur_letter + space_before
  end
end