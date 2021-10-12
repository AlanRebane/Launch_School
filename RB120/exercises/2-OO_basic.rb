# 1. Generic greeting
class Cat
  def self.generic_greeting
    puts "Hello, I'm a cat!"
  end
end

# kitty = Cat.new
# kitty.class.generic_greeting

# 2. Hello, Chloe!
class Cat2
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def rename(new_name)
    self.name = new_name
  end
end

# kitty = Cat2.new('Sophie')
# p kitty.name
# kitty.rename('Chloe')
# p kitty.name

# 3. Identify yourself!
class Cat3
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def identify
    self
  end
end

# kitty = Cat3.new('Sophie')
# p kitty.identify

# 4. Generic Greeting (part 2)
class Cat4
  attr_accessor :name
  @@number_of_cats = 0

  def initialize(name)
    @name = name
    @@number_of_cats += 1
  end

  def self.generic_greeting
    puts "Hello, hi! I'm a cat."
  end

  def personal_greeting
    puts "Hi! My name is #{name}"
  end

  def self.total
    puts @@number_of_cats
  end
end

# kitty = Cat4.new('Sophie')
# kitty2 = Cat4.new('Meow')
# Cat.generic_greeting
# kitty.personal_greeting
# Cat4.total

# 6. Colorful Cat
class Cat
  COLOR = 'purple'
  
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def greet
    puts "Hello! My name is #{name} and I'm a #{COLOR} cat"
  end
end

# kitty = Cat.new('Sophie')
# kitty.greet

# 7. Identify yourself! (part 2)
class Cat7
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def to_s
    "I'm #{name}"
  end
end

# kitty = Cat7.new('Sophie')
# puts kitty

# 8. and 9. and 10. Secret
class Person
  attr_writer :secret

  def share_secret
    secret
  end

  def compare_secret(person_object)
    secret == person_object.secret
  end

  protected

  attr_reader :secret
end

# person1 = Person.new
# person1.secret = "Shh.. this is a secret!"
# person1.share_secret

person1 = Person.new
person1.secret = 'Shh.. this is a secret!'

person2 = Person.new
person2.secret = 'Shh.. this is a different secret!'

puts person1.compare_secret(person2)