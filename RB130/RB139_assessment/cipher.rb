class Cipher
  ALPHABET = ('a'..'z').to_a
  FIRST_HALF = ('a'..'m').to_a
  SECOND_HALF_REVERSED = ('n'..'z').to_a.reverse

  def self.encode(str)
    arr = clean_up(str).chars
    new_str = ''
    counter = 0

    arr.each do |letter|
      new_str << ' ' if counter % 5 == 0 && counter != 0
      new_str << find_encrypted_letter(letter)
      counter += 1
    end

    new_str
  end

  def self.clean_up(str)
    str.downcase.gsub(/\W/, '')
  end

  def self.find_encrypted_letter(letter)
    idx = ALPHABET.find_index(letter)

    return letter if idx.nil?

    if idx < 13
      SECOND_HALF_REVERSED[idx]
    else
      FIRST_HALF[25 - idx]
    end
  end
end
