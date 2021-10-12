# 1. Fix the Program - Mailable
module Mailable
  def print_address
    puts "#{name}"
    puts "#{address}"
    puts "#{city}, #{state} #{zipcode}"
  end
end

class Customer
  include Mailable

  attr_reader :name, :address, :city, :state, :zipcode
end

class Employee
  include Mailable

  attr_reader :name, :address, :city, :state, :zipcode
end

# betty = Customer.new
# bob = Employee.new
# betty.print_address
# bob.print_address

# 2. Fix the Program - Drivable
module Drivable
  def drive
  end
end

class Car
  include Drivable
end

# bobs_car = Car.new
# bobs_car.drive

# 3. Complete the Program - Houses
class House
  include Comparable
  attr_reader :price

  def initialize(price)
    @price = price
  end

  def <=>(other)
    self.price <=> other.price
  end
end

home1 = House.new(100_000)
home2 = House.new(150_000)

# puts "Home 1 is cheaper" if home1 < home2
# puts "Home 2 is more expensive" if home2 > home1

# 4. Reverse Engineering
class Transform
  attr_reader :str
  
  def initialize(str)
    @str = str
  end

  def uppercase
    self.str.upcase
  end

  def self.lowercase(str)
    str.downcase
  end
end

# my_data = Transform.new('abc')
# puts my_data.uppercase          # <= instance method uppercase
# puts Transform.lowercase('XYZ') # <= Class method lowercase

# 6. Comparing Wallets
class Wallet
  include Comparable

  def initialize(amount)
    @amount = amount
  end

  def <=>(other_wallet)
    amount <=> other_wallet.amount
  end

  protected

  attr_reader :amount
end

# bills_wallet = Wallet.new(500)
# pennys_wallet = Wallet.new(465)
# if bills_wallet > pennys_wallet
#   puts 'Bill has more money than Penny'
# elsif bills_wallet < pennys_wallet
#   puts 'Penny has more money than Bill'
# else
#   puts 'Bill and Penny have the same amount of money.'
# end

# 7. Pet Shelter
class Pet
  attr_reader :type, :pet_name

  def initialize(type, pet_name)
    @type = type
    @pet_name = pet_name
  end
end

class Owner
  attr_reader :name
  attr_accessor :number_of_pets

  def initialize(name)
    @name = name
    @number_of_pets = 0
  end
end

class Shelter
  def initialize
    @adopters = {}
  end

  def adopt(owner, pet)
    if @adopters[owner.name] == nil
      @adopters[owner.name] = [[pet.type, pet.pet_name]]
    else
      @adopters[owner.name] << [pet.type, pet.pet_name]
    end
    owner.number_of_pets += 1
  end

  def print_adoptions
    @adopters.each do |key, value|
      puts "#{key} has adopted the following pets:"
      value.each do |pet_array|
        puts "a #{pet_array[0]} named #{pet_array[1]}"
      end
      puts ""
    end
  end
end

butterscotch = Pet.new('cat', 'Butterscotch')
pudding      = Pet.new('cat', 'Pudding')
darwin       = Pet.new('bearded dragon', 'Darwin')
kennedy      = Pet.new('dog', 'Kennedy')
sweetie      = Pet.new('parakeet', 'Sweetie Pie')
molly        = Pet.new('dog', 'Molly')
chester      = Pet.new('fish', 'Chester')

phanson = Owner.new('P Hanson')
bholmes = Owner.new('B Holmes')

# shelter = Shelter.new
# shelter.adopt(phanson, butterscotch)
# shelter.adopt(phanson, pudding)
# shelter.adopt(phanson, darwin)
# shelter.adopt(bholmes, kennedy)
# shelter.adopt(bholmes, sweetie)
# shelter.adopt(bholmes, molly)
# shelter.adopt(bholmes, chester)
# shelter.print_adoptions
# puts "#{phanson.name} has #{phanson.number_of_pets} adopted pets."
# puts "#{bholmes.name} has #{bholmes.number_of_pets} adopted pets."

# 8. Fix the program - Expander
class Expander
  def initialize(string)
    @string = string
  end

  def to_s
    expand(3)
  end

  private

  def expand(n)
    @string * n
  end
end

# expander = Expander.new('xyz')
# puts expander

# 9. Moving
module Movable
  def walk
    puts "#{@name} #{gait} forward."
  end
end

class Person
  include Movable
  attr_reader :name

  def initialize(name)
    @name = name
  end

  private

  def gait
    "strolls"
  end
end

class Cat
  include Movable
  attr_reader :name

  def initialize(name)
    @name = name
  end

  private

  def gait
    "saunters"
  end
end

class Cheetah
  include Movable
  attr_reader :name

  def initialize(name)
    @name = name
  end

  private

  def gait
    "runs"
  end
end

# mike = Person.new("Mike")
# mike.walk
# # => "Mike strolls forward"

# kitty = Cat.new("Kitty")
# kitty.walk
# # => "Kitty saunters forward"

# flash = Cheetah.new("Flash")
# flash.walk
# # => "Flash runs forward"

# 10. Nobility
class Noble
  attr_reader :title

  include Movable

  def initialize(name, title)
    @name = title + ' ' + name
    @name_only = name
    @title = title
  end

  def name
    @name_only
  end

  private

  def gait
    "struts"
  end
end

byron = Noble.new("Byron", "Lord")
p byron.walk

puts byron.name
puts byron.title