
# 1. Welcome Stranger
def greetings(name, occ)
  full_name = name.join(' ')
  full_occ = occ[:title] + " " + occ[:occupation]
  puts "Hello, #{full_name}! Nice to have a #{full_occ} around."
end

#greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })

# 2. Double Doubles
def twice(int)
  if int.to_s.size.odd?
    int * 2
  elsif int.to_s[..int.to_s.size/2 - 1] == int.to_s[int.to_s.size/2..]
    int
  else
    int * 2
  end
end

# 3. Always Return Negative
def negative(int)
  int > 0 ? -int : int
end

# 4. Counting Up
def sequence(int)
  (1..int).to_a
end

# 5. Uppercase Check
LOWERCASE_CHARS = ('a'..'z').to_a

def uppercase?(string)
  answer = true
  string.each_char { |char| answer = false if LOWERCASE_CHARS.include?(char) }
  answer
end

# The neat trick from Launch School:
def uppercase?(string)
  string == string.upcase
end

# 6. How long are you?
def word_lengths(words)
  ans = []
  words.split.each do |word|
    ans << word + " " + word.size.to_s
  end
  ans
end

# A very nice and concise solution from LS:
def word_lengths(string)
  string.split.map { |word| "#{word} #{word.length}" }
end

# 7. Name Swapping
def swap_name(name)
  all_names = name.split
  all_names[-1] + ", " + all_names[0]
end

def swap_name(name)
  name.split.reverse.join(', ')
end

# 8. Sequence Count
def sequence(int1, int2)
  new_arr = []
  1.upto(int1) do |index|
    new_arr << int2 * index
  end
  new_arr
end

def sequence2(count, first)
  (1..count).map { |num| num * first }
end

# 9. Grade book
def find_letter_value(score)
  case 
  when 90 <= score && score <= 100 then 'A'
  when 80 <= score && score < 90 then 'B'
  when 70 <= score && score < 80 then 'C'
  when 60 <= score && score < 70 then 'D'
  when  0 <= score && score < 60 then 'F'
  end
end

def get_grade(grade1, grade2, grade3)
  find_letter_value((grade1 + grade2 + grade3) / 3)
end

# A more concise way from Launch School
def get_grade(s1, s2, s3)
  result = (s1 + s2 + s3)/3

  case result
  when 90..100 then 'A'
  when 80..89  then 'B'
  when 70..79  then 'C'
  when 60..69  then 'D'
  else              'F'
  end
end

# 10. Grocery List
def buy_fruit(arr)
  new_arr = []
  arr.each do |inner_arr|
    inner_arr.last.times {new_arr << inner_arr.first}
  end
  new_arr
end

# Yet again, a very nice solution from Launch School
def buy_fruit(list)
  list.map { |fruit, quantity| [fruit] * quantity }.flatten
end

# 11. Group Anagrams
words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
  'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
  'flow', 'neon']

index = 0
words.each do |word|
  anagrams = []
  for i in (index..words.size-1)
    anagrams << words[i] if word.chars.sort == words[i].chars.sort
  end
  puts anagrams.inspect if anagrams.size > 1
  index += 1
end

# Launch School solution with hash:
result = {}

words.each do |word|
  key = word.split('').sort.join
  if result.has_key?(key)
    result[key].push(word)
  else
    result[key] = [word]
  end
end

result.each do |k, v|
  puts "------"
  p k
  p v
end
