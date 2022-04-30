=begin
Write a program that initiates a new Robot object and assigns it
a new random name. When the robot's settings are restored, a new
random name is generated. It must be so that the new random name
is not the same as the previous one.

Examples: assertions

Data Structures: generate a random string that follows the order
[str, str, int, int, int] where letters are uppercase and numbers
from 0 to 9.

Algorithm: I need 2 instance methods - robot.name and robot.reset

Robot.name shall create a new random name if a name doesn't exist,
else it will display it.

Robot.reset shall set the robot's name to nil, it shall wipe the 
robot's name.
=end

class Robot
  def name
    return robot_name if robot_name
    srand(Random.new_seed)
    self.robot_name = generate_name
  end

  def reset
    self.robot_name = nil
  end

  private
  attr_accessor :robot_name

  def generate_name
    ('A'..'Z').to_a.shuffle[0, 2].join + (0..9).to_a.shuffle[0, 3].join
  end
end
