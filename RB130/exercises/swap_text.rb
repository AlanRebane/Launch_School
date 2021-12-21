class Text
  def initialize(text)
    @text = text
  end

  def swap(letter_one, letter_two)
    @text.gsub(letter_one, letter_two)
  end

  def word_count
    @text.split.count
  end
end

# txt_file = File.open('sample_text2.txt', 'r')

# text_obj = Text.new(txt_file.read)
# text_obj.swap('a', 'e')

# txt_file.close
