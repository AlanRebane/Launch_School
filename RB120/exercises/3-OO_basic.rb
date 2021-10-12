# # 1. Inherited Year
# class Vehicle
#   attr_reader :year

#   def initialize(year)
#     @year = year
#   end
# end

# class Truck < Vehicle
# end

# class Car < Vehicle
# end

# truck1 = Truck.new(1994)
# # puts truck1.year

# car1 = Car.new(2006)
# # puts car1.year

# # 2. Start the Engine
# class Vehicle
#   attr_reader :year

#   def initialize(year)
#     @year = year
#   end
# end

# class Truck < Vehicle
#   def initialize(year)
#     super
#     start_engine
#   end

#   def start_engine
#     puts 'Ready to go!'
#   end
# end

# # truck1 = Truck.new(1994)
# # puts truck1.year

# # 3. Only Pass the Year
# class Vehicle
#   attr_reader :year

#   def initialize(year)
#     @year = year
#   end
# end

# class Truck < Vehicle
#   attr_reader :bed_type

#   def initialize(year, bed_type)
#     super(year)
#     @bed_type = bed_type
#   end
# end

# class Car < Vehicle
# end

# truck1 = Truck.new(1994, 'Short')
# puts truck1.year
# puts truck1.bed_type

# 4. Start the Engine (Part 2)
# class Vehicle
#   def start_engine
#     'Ready to go!'
#   end
# end

# class Truck < Vehicle
#   def start_engine(speed)
#     super() + " Drive #{speed}, please!"
#   end
# end

# truck1 = Truck.new
# puts truck1.start_engine('fast')

# 5. Towable (Part 1)
# module Towable
#   def tow
#     puts "I can tow a trailer"
#   end
# end

# class Vehicle
#   attr_reader :year

#   def initialize(year)
#     @year = year
#   end
# end 

# class Truck < Vehicle
#   include Towable
# end

# class Car < Vehicle
# end

# truck1 = Truck.new(1994)
# puts truck1.year
# truck1.tow

# car1 = Car.new(2006)
# puts car1.year

# 9. Method Lookup (Part 3)
# module Flyable
#   def fly
#     "I'm flying!"
#   end
# end

# class Animal
#   attr_reader :color

#   def initialize(color)
#     @color = color
#   end
# end

# class Cat < Animal
# end

# class Bird < Animal
#   include Flyable
# end

# bird1 = Bird.new('Red')
# bird1.color

# 10. Transportation

class Vehicle
  attr_reader :year

  def initialize(year)
    @year = year
  end
end 

class Truck < Vehicle
end

class Car < Vehicle
end

module Transportation
  Vehicle
  Truck
  Car
end