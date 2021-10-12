=begin

1. The game flow goes like this:
  a) the user makes a choice
  b) the computer makes a choice
  c) the winner is displayed

2. Classical approach to OOP is:
  a) Write a textual description of the proble or exercise
  b) Extract the major nouns and verbs from the description
  c) Organize and associate the verbs with the nouns
  d) The nouns are the classes and the verbs are the behaviors or methods

**Step 1**
--------------
Like this:
Rock, Paper, Scissors is a two-player game where each player chooses
one of three possible moves: rock, paper, or scissors. The chosen moves
will then be compared to see who wins, according to the following rules:

- rock beats scissors
- scissors beats paper
- paper beats rock

If the player chose the same move, then it's a tie.
--------------

**Step 2**
--------------
Let's now look at the above description, and try to extract the major nouns
and verbs.

Nouns: player, move (which includes "rock", "paper", or "scissors"), rule
Verbs: choose, compare
--------------

**Step 3**
--------------
Here it's not obvious where the 'compare' verb goes if nouns are classes
and verbs are behaviors.

Player
  - choose
Move
Rule

  - compare

=end

class Player
  attr_accessor :move, :name, :score

  def initialize
    # @move = nil, this will be initialized to nil anyway (as in attr_accessor)
    set_name
    @score = 0
    # maybe a "name"? what about a "move"?
  end
end

class Human < Player
  def set_name
    n = ""
    loop do
      puts "What's your name?"
      n = gets.chomp
      break unless n.empty?
      puts "Sorry, must enter a value."
    end
    self.name = n
  end

  def choose
    choice = nil

    loop do
      puts "Please choose rock, paper, or scissors:"
      choice = gets.chomp
      break if Move::VALUES.include?(choice)
      puts "Sorry, invalid choice."
    end

    self.move = Move.new(choice)
  end
end

class Computer < Player
  def set_name
    self.name = ['R2D2', 'Hal', 'Chappie', 'Sonny', 'Number 5'].sample
  end

  def choose
    self.move = Move.new(Move::VALUES.sample)
  end
end

class Move
  VALUES = ['rock', 'paper', 'scissors']

  def initialize(value)
    @value = value
    # we need something to keep track of the choice...
    # a move object can be "paper", "rock", or "scissors"
  end

  def scissors?
    @value == 'scissors'
  end

  def rock?
    @value == 'rock'
  end

  def paper?
    @value == 'paper'
  end

  def >(other_move)
    (rock? && other_move.scissors?) ||
      (paper? && other_move.rock?) ||
      (scissors? && other_move.paper?)
  end

  def <(other_move)
    (rock? && other_move.paper?) ||
      (paper? && other_move.scissors?) ||
      (scissors? && other_move.rock?)
  end

  def to_s
    @value
  end
end

=begin
Now we need an "engine" of some sort to orchestrate the objects.
This is where the procedural program flow should be. Let's call the
"engine" class RPSGame. We want an easy interface to kick things off,
so perhaps to play the game, we just instantiate an object and call
a method called play:
=end

class RPSGame
  WINNING_SCORE = 3
  attr_accessor :human, :computer

  def initialize
    @human = Human.new
    @computer = Computer.new
  end

  def display_welcome_message
    puts "Welcome to Rock, Paper, Scissors! The game is played" \
         " until #{WINNING_SCORE} points."
  end

  def display_goodbye_message
    puts "Thanks for playing Rock, Paper, Scissors. Good bye!"
  end

  def display_moves
    puts "#{human.name} chose #{human.move}."
    puts "#{computer.name} chose #{computer.move}."
  end

  def display_winner
    if human.move > computer.move
      puts "#{human.name} won!"
      human.score += 1
    elsif human.move < computer.move
      puts "#{computer.name} won!"
      computer.score += 1
    else
      puts "It's a tie!"
    end
  end

  def display_score
    puts "#{human.name} has #{human.score} points"
    puts "#{computer.name} has #{computer.score} points"
  end

  def win?
    human.score >= WINNING_SCORE || computer.score >= WINNING_SCORE
  end

  def congratulate_winner
    puts ""
    if human.score >= WINNING_SCORE
      puts "*** Congratulations! You won the RPS tournament! ***"
    else
      puts "*** Better luck next time in the RPS tournament! ***"
    end
  end

  def play_again?
    answer = nil

    loop do
      puts ""
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp
      break if ['y', 'n'].include? answer.downcase
      puts "Sorry, must be 'y' or 'n'"
    end

    return false if answer.downcase == 'n'
    return true if answer.downcase == 'y'
  end

  def play
    display_welcome_message

    loop do
      puts ""
      human.choose
      computer.choose
      display_moves
      display_winner
      display_score
      next if !win?
      congratulate_winner
      break unless play_again?
    end

    display_goodbye_message
  end
end

RPSGame.new.play
