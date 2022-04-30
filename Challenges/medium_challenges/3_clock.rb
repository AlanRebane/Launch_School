=begin
Create a clock that is independent of date
The clock is represented in a string like so: "00:00"
It must be possible to add and subtract minutes!

Examples:

Data Structure: Time must be represented in a string
format where it is "HH:MM", the class method #at takes
two arguments: hours and minutes, if minutes are not given,
then minutes are 00. Hours go from 0 to 23 and minutes go
from 0 to 59.

Algorithm: 

=end

class Clock
  def self.at(hh, mm = 0)
    @hours = hh
    @minutes = mm
    current_time = self.to_s
    
    @flag = (@previous_time && @previous_time == current_time)
    @previous_time = self.to_s
    
    self
  end

  def self.+(add_minutes)
    hours, minutes = minutes_to_hours(add_minutes)
    @hours += hours
    @minutes += minutes
    adjust_clock

    self.at(@hours, @minutes)
  end

  def self.-(sub_minutes)
    hours, minutes = minutes_to_hours(sub_minutes)
    @hours -= hours
    @minutes -= minutes
    adjust_clock

    self.at(@hours, @minutes)
  end

  def self.==(other)
    @flag
  end

  def self.to_s
    "%02d" % @hours + ":" + "%02d" % @minutes
  end

  class << self
    private
    
    def minutes_to_hours(given_minutes)
      hours, minutes = given_minutes.divmod(60)
      hours = hours.divmod(24)[1]
      return hours, minutes
    end

    def adjust_if_negative
      if @minutes < 0
        @hours -= 1
        @minutes += 60
      end
      @hours += 24 if @hours < 0
    end

    def adjust_if_over_24
      @hours -= 24 if @hours >= 24 
    end

    def adjust_clock
      adjust_if_negative
      adjust_if_over_24
    end
  end
end