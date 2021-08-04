
def sum_even_number_row(row_number)
  rows = [[2]]
  (2..row_number).each do |current_row_number|
    start_integer = rows.last.last + 2
    rows << create_row(start_integer, current_row_number)
  end
  rows.last.sum # TODO: sum the final row and return the sum
end

def create_row(start_integer, row_length)
  row = []
  current_integer = start_integer
  # steps 2-4
  loop do
    row << current_integer
    current_integer += 2
    break if row.length == row_length
  end
  row
end

# Test cases for sum_even_number_row:
p sum_even_number_row(1) == 2 # true
p sum_even_number_row(2) == 10
p sum_even_number_row(4) == 68

# Test cases for create_row(start_integer, row_length):
# p create_row(2, 1) == [2] 
# p create_row(4, 2) == [4, 6]
# p create_row(8, 3) == [8, 10, 12]
