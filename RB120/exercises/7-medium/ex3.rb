# 3. Students
=begin
  Below we have 3 classes: Student, Graduate, and Undergraduate. 
  The implementation details for the #initialize methods in Graduate 
  and Undergraduate are missing. Fill in those missing details so that 
  the following requirements are fulfilled:

  Graduate students have the option to use on-campus parking, 
  while Undergraduate students do not.

  Graduate and Undergraduate students both have a name and 
  year associated with them.
  
  Note, you can do this by adding or altering no more than 5 lines of code.
=end

class Student
  def initialize(name, year)
    @name = name
    @year = year
  end
end

class Graduate < Student # altered
  def initialize(name, year, parking)
    super(name, year) # altered
    @parking = parking # added
  end
end

class Undergraduate < Student # altered
  def initialize(name, year)
    super(name, year) # added
  end
end

Graduate.new("Alan", 2021, "Parking spot 28")
Undergraduate.new("Alan", 2018)