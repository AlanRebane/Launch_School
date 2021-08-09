
# 1. Combine Two Lists

def interleave(arr1, arr2)
  new_arr = []
  index = 0

  while index < arr1.size
    new_arr << arr1[index]
    new_arr << arr2[index]
    index += 1
  end

  new_arr
end

# You can also add elements to a list on a single line:

def interleave2(arr1, arr2)
  new_arr = []
  arr1.each_with_index do |element, index|
    new_arr << element << arr2[index]
  end
  new_arr
end

# Zip does the thing the easiest!
#p [1, 2, 3].zip(['a', 'b', 'c']).flatten

# 2. Lettercase Counter
UPPERCASE_CHARACTERS = ("A".."Z").to_a
LOWERCASE_CHARACTERS = ("a".."z").to_a

def letter_case_count(string)
  hash = { lowercase: 0, uppercase: 0, neither: 0}

  string.each_char do |char|
    if UPPERCASE_CHARACTERS.include?(char)
      hash[:uppercase] += 1
    elsif LOWERCASE_CHARACTERS.include?(char)
      hash[:lowercase] += 1
    else
      hash[:neither] += 1
    end
  end
  hash
end

# 3. Capitalize Words
def word_cap(string) 
  string.split.map { |word| word.capitalize }.join(' ')
end

# It is better to use map(&:capitalize), like so:
def word_cap(words)
  words.split.map(&:capitalize).join(' ')
end

# 4. Swap Case
def swapcase(string)
  new_string = string.chars.map do |char|
    UPPERCASE_CHARACTERS.include?(char) ? char.downcase : char.upcase
  end
  
  new_string.join
end

# 5. Staggered Caps (Part 1)
def staggered_case(sentence)
  index = 0
  new_sentence = ''
  sentence.each_char do |char|
    if index.even?
      new_sentence << char.upcase
    elsif index.odd?
      new_sentence << char.downcase
    else
      new_sentence << char
    end
    index += 1
  end
  
  new_sentence
end

# p staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
# p staggered_case('ALL_CAPS') == 'AlL_CaPs'
# p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'

# Consider LS solution and toggling true and false after each iteration:
def staggered_case(string)
  result = ''
  need_upper = true
  string.chars.each do |char|
    if need_upper
      result += char.upcase
    else
      result += char.downcase
    end
    need_upper = !need_upper
  end
  result
end

# 6. Staggered Caps (Part 2)
ALL_CHARACTERS = UPPERCASE_CHARACTERS + LOWERCASE_CHARACTERS

def staggered_case(sentence)
  index = 0
  new_sentence = ''
  sentence.each_char do |char|
    if ALL_CHARACTERS.include?(char) && index.even?
      new_sentence << char.upcase
      index += 1
    elsif ALL_CHARACTERS.include?(char) && index.odd?
      new_sentence << char.downcase
      index += 1
    else
      new_sentence << char
    end
  end
  
  new_sentence
end

# p staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
# p staggered_case('ALL CAPS') == 'AlL cApS'
# p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'

# 7. Multiplicative Average
def show_multiplicative_average(array)
  multiplication = array.inject(:*)
  average = multiplication / array.length.to_f
  puts format(%(The result is: %#.3f), average)
end

# 8. Multiply Lists
def multiply_list(arr1, arr2)
  new_arr = []
  arr1.each_with_index do |num, i|
    new_arr << num * arr2[i]
  end
  new_arr
end

# Use Array#zip method instead!
a = [3, 5, 7]
b = [9, 10, 11]
def multiply_list(arr1, arr2)
  arr1.zip(arr2).map { |sub_array| sub_array.inject(:*) }
end

# 9. Multiply All Pairs
def multiply_all_pairs(arr1, arr2)
  new_arr = []
  arr1.each do |element|
    arr2.each do |element2|
      new_arr << element * element2
    end
  end
  new_arr.sort
end

def multiply_all_pairs(arr1, arr2)
  arr1.product(arr2).map { |pair| pair.inject(:*) }.sort
end

# 10. The End Is Near But Not Here
def penultimate(strings)
  strings.split[-2]
end

p penultimate('last word') == 'last'
p penultimate('Launch School is great!') == 'is'