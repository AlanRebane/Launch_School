def convert(str, &block)
  return str.dup if !block_given?

  str.chars.map do |letter|
    block.call(letter)
  end.join
end

p convert('a string')