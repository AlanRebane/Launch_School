require 'time'

module CanTow
  def towing
    "This vehicle can tow other vehicles easily"
  end
end

class Vehicle
  attr_accessor :color, :speed
  attr_reader :model

  @@number_of_vehicles = 0

  def initialize(year, color, model)
    @year = year
    @color = color
    @model = model
    @speed = 0
    @@number_of_vehicles += 1
  end

  def speed_up(add)
    self.speed += add
    puts "Accelerating, the speed is now #{self.speed}"
  end

  def brake(subtract)
    self.speed -= 0
    puts "Breaking, the speed is now #{self.speed}"
  end

  def shut_off
    puts "The engine is shut off"
  end

  def spray_paint(new_paint)
    self.color = new_paint
  end

  def self.gas_mileage(gallons, miles)
    puts "The vehicle's mpg is #{miles / gallons}"
  end

  def self.total_vehicles
    @@number_of_vehicles
  end

  def to_s
    "Your #{year} #{model} in #{color} looks fine. It is doing #{speed} mph."
  end

  def age
    "Your #{model} is #{years_old}"
  end

  private

  def years_old
    Time.now.year - @year
  end
end

class MyCar < Vehicle
  NUMBER_OF_DOORS = 4
end

class MyTruck < Vehicle
  include CanTow
  NUMBER_OF_DOORS = 2
end

my_car = MyCar.new(2012, "blue", "Ford")
# my_car.speed_up(20)
# my_car.spray_paint('red')
# MyCar.gas_mileage(1, 35)

my_truck = MyTruck.new(2010, 'white', 'Volvo')
# my_truck.speed_up(100)
# my_truck.spray_paint('velvet')
# puts my_truck.towing

# puts Vehicle.total_vehicles

# puts "------ Method lookup ------"
# puts "* For Vehicle"
# puts Vehicle.ancestors
# puts "* For MyCar *"
# puts MyCar.ancestors
# puts "* For MyTruck *"
# puts MyTruck.ancestors

# puts my_car.age

class Student
  def initialize(name, grade)
    @name = name
    @grade = grade
  end

  def better_grade_than(someone)
    @grade >= grade(someone)
  end

  private
  
  attr_reader :grade

  def grade(object)
    object.grade
  end
end

joe = Student.new('Joe', 80)
bob = Student.new('Bob', 70)

puts "Well done!" if joe.better_grade_than(bob)
