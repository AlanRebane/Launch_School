require "date"

class Meetup
  attr_accessor :my_date

  DAYS = {"monday"    => 1,
          "tuesday"   => 2,
          "wednesday" => 3,
          "thursday"  => 4,
          "friday"    => 5,
          "saturday"  => 6,
          "sunday"    => 7}
  
  FIRST_TO_FIFTH = ['first', 'second', 'third', 'fourth', 'fifth']

  def initialize(year, month)
    @my_date = Date.new(year, month)
  end

  def day(weekday, descriptor)
    weekday = DAYS[weekday.downcase]
    descriptor = descriptor.downcase

    if FIRST_TO_FIFTH.include?(descriptor)
      first_to_fifth(weekday, FIRST_TO_FIFTH.find_index(descriptor) + 1)
    elsif descriptor == 'last'
      select_from_teenth_or_last(weekday, -7, -1)
    else
      select_from_teenth_or_last(weekday, 13, 19)
    end
  end

  private

  def first_to_fifth(weekday, descriptor)
    to_date = Date.new(my_date.year, my_date.month, -1)

    counter = 1
    
    (my_date..to_date).each do |day|
      if day.cwday == weekday && descriptor == counter
        return change_day(day.day)
      end
      counter += 1 if day.cwday == weekday
    end

    nil
  end

  def select_from_teenth_or_last(weekday, from, to)
    from_date = Date.new(my_date.year, my_date.month, from)
    to_date = Date.new(my_date.year, my_date.month, to)

    (from_date..to_date).each do |day|
      return change_day(day.day) if day.cwday == weekday
    end
    nil
  end
  
  def change_day(new_day)
    self.my_date = Date.new(my_date.year, my_date.month, new_day)
  end
end