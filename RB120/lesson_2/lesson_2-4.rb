class Dog
  def speak
    'bark!'
  end

  def swim
    'swimming'
  end
end

class Bulldog < Dog
  def swim
    "can't swim!"
  end
end

# karl = Bulldog.new
# puts karl.speak
# puts karl.swim

class Pet
  def run
    'Running'
  end

  def jump
    'jumping'
  end
end

class Dog_2 < Pet
  def speak
    'speaking'
  end

  def swim
    'swimming!'
  end

  def fetch
    'fetching!'
  end
end

class Cat < Pet
  def speak
    'speaking'
  end
end
