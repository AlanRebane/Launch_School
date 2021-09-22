# 1) Madlibs Revisited
txt = File.readlines('some_text.txt').map(&:chomp)

txt.map! do |sentence|
  format(sentence, { adjective: ['quick', 'lazy', 'sleepy', 'ugly'].sample,
                     noun: ['fox', 'dog', 'head', 'leg'].sample,
                     verb: ['jumps', 'lifts', 'bites', 'licks'].sample,
                     adverb: ['easily', 'lazily', 'noisily', 'excitedly'].sample })
end

#p txt.join(' ')

# 2) Seeing Stars
def print_row(space_before, space_after)
  puts ' ' * space_before + '*' + ' ' * space_after + '*' + ' ' * space_after + '*'
end

def star(int)

  middle_point = int / 2
  
  space_before = 0
  space_after = middle_point - 1

  1.upto(middle_point) do
    print_row(space_before, space_after)
    space_before += 1
    space_after -= 1
  end
  
  puts '*' * int

  space_before = middle_point - 1
  space_after = 0

  middle_point.downto(1) do
    print_row(space_before, space_after)
    space_before -= 1
    space_after += 1
  end

end

# 3) and 4) regarding transpose
def transpose(matrix)
  rows = matrix.size
  columns = matrix[0].size

  new_matrix = []
  element = 0

  columns.times do
    new_row = []
    matrix.each do |row|
      new_row << row[element]
    end
    new_matrix << new_row
    element += 1
  end

  new_matrix
end

# 5) Rotating Matrices
def rotate90(matrix)
  rows = matrix.size
  columns = matrix[0].size

  new_matrix = []

  columns.times do |column_index|
    new_row = []
    rows.downto(1) do |row_index|
      new_row << matrix[row_index - 1][column_index]
    end
    new_matrix << new_row
  end

  new_matrix
end


# matrix1 = [
#   [1, 5, 8],
#   [4, 7, 2],
#   [3, 9, 6]
# ]

# matrix2 = [
#   [3, 7, 4, 2],
#   [5, 1, 0, 8]
# ]

# new_matrix1 = rotate90(matrix1)
# new_matrix2 = rotate90(matrix2)
# new_matrix3 = rotate90(rotate90(rotate90(rotate90(matrix2))))

# p new_matrix1 == [[3, 4, 1], [9, 7, 5], [6, 2, 8]]
# p new_matrix2 == [[5, 3], [1, 7], [0, 4], [8, 2]]
# p new_matrix3 == matrix2

# 6) Fix the bug
def my_method(array)
  if array.empty?
    []
  elsif array.size > 1
    array.map do |value|
      value * value
    end
  else
    [7 * array.first]
  end
end

# 7) Merge sorted list
def select_long_arr(arr1, arr2)
  if arr2.size > arr1.size
    long_arr = arr2
    short_arr = arr1
  else
    long_arr = arr1
    short_arr = arr2
  end
  return long_arr, short_arr
end

def merge(arr1, arr2)
  long_arr, short_arr = select_long_arr(arr1, arr2)

  short_index = 0
  long_index = 0
  merged_arr = []

  while long_index < long_arr.size
    if (short_index >= short_arr.size) || 
       (long_arr[long_index] <= short_arr[short_index])
      merged_arr << long_arr[long_index]
      long_index += 1
    else
      merged_arr << short_arr[short_index]
      short_index += 1
    end
    #binding.pry
  end

  while short_index < short_arr.size
    merged_arr << short_arr[short_index]
    short_index += 1
  end

  merged_arr
end

# 8) Merge Sort

def merge_sort(arr)
  return arr if arr.size <= 1

  arr_size = arr.size
  mid_point = arr_size / 2

  left_arr = arr.take(mid_point)
  right_arr = arr.drop(mid_point)

  sorted_left_arr = sort(left_arr)
  sorted_right_arr = sort(right_arr)

  merge

  new_arr.map { }

  new_arr
end

p merge_sort([9, 5, 7, 1])

