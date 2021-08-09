
# Problem 1
arr = ['10', '11', '9', '7', '8']

# arr.map(&:to_i).sort { |a, b| b <=> a} # Returns integers, but we want strings
# arr.sort { |a, b| b.to_i <=> a.to_i }  # Return string

# Problem 2
books = [
  {title: 'One Hundred Years of Solitude', author: 'Gabriel Garcia Marquez', published: '1967'},
  {title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', published: '1925'},
  {title: 'War and Peace', author: 'Leo Tolstoy', published: '1869'},
  {title: 'Ulysses', author: 'James Joyce', published: '1922'}
]

# p books.sort { |a, b| a[:published].to_i <=> b[:published].to_i }
# p books.sort_by { |book| book[:published] } # Note that no conversion is needed

# Problem 3
arr1 = ['a', 'b', ['c', ['d', 'e', 'f', 'g']]]
#p arr1[2][1][-1]

arr2 = [{first: ['a', 'b', 'c'], second: ['d', 'e', 'f']}, {third: ['g', 'h', 'i']}]
#p arr2[1][:third][0]

arr3 = [['abc'], ['def'], {third: ['ghi']}]
#p arr3[-1][:third][0][0]

hsh1 = {'a' => ['d', 'e'], 'b' => ['f', 'g'], 'c' => ['h', 'i']}
#p hsh1['b'][-1]

hsh2 = {first: {'d' => 3}, second: {'e' => 2, 'f' => 1}, third: {'g' => 0}}
#p hsh2[:third].key(0)

# Problem 4
arr1 = [1, [2, 3], 4]
arr1[1][-1] = 4
#p arr1

arr2 = [{a: 1}, {b: 2, c: [7, 6, 5], d: 4}, 3]
arr2[-1] = 4
#p arr2

hsh1 = {first: [1, 2, [3]]}
hsh1[:first][-1][0] = 4
#p hsh1

hsh2 = {['a'] => {a: ['1', :two, 3], b: 4}, 'b' => 5}
hsh2[['a']][:a][-1] = 4
#p hsh2

# Problem 5
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

sum = 0
munsters.each_value do |value|
  sum += value["age"] if value["gender"] == "male"
end
#p sum

# Problem 6
# munsters.each do |key, details|
#   puts "#{key} is a #{details["age"]}-year-old #{details["gender"]}."
# end

# Problem 8
VOWELS = %w[a e i o u]

hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}

# hsh.each_value do |value|
#   value.each do |word|
#     word.chars do |char|
#       puts char if VOWELS.include?(char)
#     end
#   end
# end

# Problem 9
arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]

arr2 = arr.map do |subarray|
  subarray.sort { |a, b| b <=> a}
end

#p arr2

# Problem 10
arr = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]

new_arr = arr.map do |element|
  element2 = element.dup

  element2.dup.map do |key, value|
    element2[key] = value + 1
  end

  element2
end

# puts "Old array"
# p arr
# puts "New array"
# p new_arr

# Problem 11
arr = [[2], [3, 5, 7], [9], [11, 13, 15]]

arr3 = arr.map do |sub_array|
  sub_array.select do |num|
    num % 3 == 0
  end
end

# Problem 12
arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]
# expected return value: {:a=>1, "b"=>"two", "sea"=>{:c=>3}, {:a=>1, :b=>2, :c=>3, :d=>4}=>"D"}

hsh = arr.each_with_object({}) do |inner_array, hash|
  hash[inner_array[0]] = inner_array[1]
end

# Problem 13
arr = [[1, 6, 7], [1, 4, 9], [1, 8, 3]]

sorted_arr = arr.sort_by do |inner_array|
  inner_array.select { |num| num.odd? }
end

# Problem 14
hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}

colors_and_size = []

hsh.each_value do |details|
  if details[:type] == 'fruit'
    colors_and_size << details[:colors].map { |color| color.capitalize}
  elsif details[:type] == 'vegetable'
    colors_and_size << details[:size].upcase
  end
end


# Problem 15
arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]

even_integer_array = arr.select do |inner_hash|
  inner_hash.values.flatten.all? { |x| x.even? }
end

# Problem 16 
HEX = (0..9).to_a.map(&:to_s) + ("a".."f").to_a
DASH_POSITION = [9, 14, 19, 24]

def uuid_single_generator
  uuid = ""
  36.times do |i| 
    if DASH_POSITION.include? i
      uuid << "-"
    else
      uuid << HEX.sample
    end
  end
  uuid
end

def uuid_generator(amount = 1)
  if amount <= 1
    uuid_single_generator
  else
    result = []
    amount.times { result << uuid_single_generator}
    result
  end
end

def generate_UUID
  uuid = ""
  sections = [8, 4, 4, 4, 12]
  sections.each_with_index do |section, index|
    section.times { uuid << HEX.sample }
    uuid += '-' unless index >= sections.size - 1
  end

  uuid
end