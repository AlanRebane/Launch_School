# 1. Enumerable Class Creation
class Tree
  include Enumerable

  def each

  end
end

# 2. Optional Blocks
def compute
  if block_given?
    yield
  else
    "Does not compute."
  end
end

# p compute { 5 + 3 } == 8
# p compute { 'a' + 'b' } == 'ab'
# p compute == 'Does not compute.'

# 3. Find Missing Numbers
def missing(arr)
  full_arr = (arr[0]..arr[-1]).to_a

  full_arr.select { |num| !arr.include?(num) }
end

# p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
# p missing([1, 2, 3, 4]) == []
# p missing([1, 5]) == [2, 3, 4]
# p missing([6]) == []

# 4. Divisors
def divisors(num)
  arr = (1..num).to_a

  arr.select { |ele| num % ele == 0 }
end

# p divisors(1) == [1]
# p divisors(7) == [1, 7]
# p divisors(12) == [1, 2, 3, 4, 6, 12]
# p divisors(98) == [1, 2, 7, 14, 49, 98]
# p divisors(99400891) == [1, 9967, 9973, 99400891] # may take a minute

# 5. ROT13
ALPHABET = ('a'..'z').to_a

def encrypt(name)
  name_chars = name.downcase.chars

  name_chars.map! do |char|
    if char == " "
      " "
    else
      real_char = ALPHABET.find_index(char) - 13
      real_char += 26 if real_char < 0
      ALPHABET[real_char]
    end
  end

  name_chars.join.split(' ').each { |name| name.capitalize! }.join(' ')
end

# 6. Iterators: True for Any?
def any?(arr)
  arr.each do |num|
    return true if yield(num)
  end
  false
end

# p any?([1, 3, 5, 6]) { |value| value.even? } == true
# p any?([1, 3, 5, 7]) { |value| value.even? } == false
# p any?([2, 4, 6, 8]) { |value| value.odd? } == false
# p any?([1, 3, 5, 7]) { |value| value % 5 == 0 } == true
# p any?([1, 3, 5, 7]) { |value| true } == true
# p any?([1, 3, 5, 7]) { |value| false } == false
# p any?([]) { |value| true } == false

# 7. True for All?
def all?(arr)
  arr.each { |num| return false if !yield(num) }
  true
end

# 8. True for None?
def none?(collection, &block) #  notice how we pass around the block, with & sign
  !any?(collection, &block)
end

# p none?([1, 3, 5, 6]) { |value| value.even? } == false
# p none?([1, 3, 5, 7]) { |value| value.even? } == true
# p none?([2, 4, 6, 8]) { |value| value.odd? } == true
# p none?([1, 3, 5, 7]) { |value| value % 5 == 0 } == false
# p none?([1, 3, 5, 7]) { |value| true } == false
# p none?([1, 3, 5, 7]) { |value| false } == true
# p none?([]) { |value| true } == true

# 9. Iterators: True for One?
def one?(arr)
  flag = false
  
  arr.each do |num|
    if yield(num) && !flag
      flag = true
    elsif yield(num) && flag
      return false
    end
  end

  flag
end

# p one?([1, 3, 5, 6]) { |value| value.even? }    # -> true
# p one?([1, 3, 5, 7]) { |value| value.odd? }     # -> false
# p one?([2, 4, 6, 8]) { |value| value.even? }    # -> false
# p one?([1, 3, 5, 7]) { |value| value % 5 == 0 } # -> true
# p one?([1, 3, 5, 7]) { |value| true }           # -> false
# p one?([1, 3, 5, 7]) { |value| false }          # -> false
# p one?([]) { |value| true }                     # -> false

def count(arr)
  count = 0
  arr.each { |i| count += 1 if yield(i) }
  count
end

p count([1,2,3,4,5]) { |value| value.odd? } == 3
p count([1,2,3,4,5]) { |value| value % 3 == 1 } == 2
p count([1,2,3,4,5]) { |value| true } == 5
p count([1,2,3,4,5]) { |value| false } == 0
p count([]) { |value| value.even? } == 0
p count(%w(Four score and seven)) { |value| value.size == 5 } == 2