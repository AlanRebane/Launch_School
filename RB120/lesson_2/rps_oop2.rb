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
  VALUES = ['rock', 'paper', 'scissors']
  attr_accessor :move, :name, :score
  attr_reader :all_moves_history

  def initialize
    # @move = nil, this will be initialized to nil anyway (as in attr_accessor)
    set_name
    @score = 0
    @all_moves_history = []
    # maybe a "name"? what about a "move"?
  end

  private

  def save_move(choice)
    @all_moves_history << choice
  end

  def choose_move(choice)
    case choice
    when 'rock'     then Rock.new
    when 'paper'    then Paper.new
    when 'scissors' then Scissors.new
    end
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
      break if VALUES.include?(choice)
      puts "Sorry, invalid choice."
    end

    self.move = choose_move(choice)
    save_move(choice)
  end
end

class Computer < Player
  def set_name
    self.name = ['R2D2', 'Hal', 'Chappie', 'Sonny', 'Number 5'].sample
  end

  def choose
    choice = VALUES.sample
    self.move = choose_move(choice)
    save_move(choice)
  end
end

class Rock
  def >(other_move)
    other_move.to_s == 'scissors'
  end

  def <(other_move)
    other_move.to_s == 'paper'
  end

  def to_s
    'rock'
  end
end

class Paper
  def >(other_move)
    other_move.to_s == 'rock'
  end

  def <(other_move)
    other_move.to_s == 'scissors'
  end

  def to_s
    'paper'
  end
end

class Scissors
  def >(other_move)
    other_move.to_s == 'paper'
  end

  def <(other_move)
    other_move.to_s == 'rock'
  end

  def to_s
    'scissors'
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

  def players_choose
    puts ""
    human.choose
    computer.choose
  end

  def display_moves_and_scores
    display_moves
    display_winner
    display_score
  end

  def display_historical_choices
    rounds = 1
    human.all_moves_history.each do |move|
      puts "In round number #{rounds} you chose #{move} and the computer" \
      " chose #{computer.all_moves_history[rounds - 1]}"
      rounds += 1
    end
  end

  def play
    display_welcome_message

    loop do
      players_choose
      display_moves_and_scores
      next if !win?
      display_historical_choices
      congratulate_winner
      break unless play_again?
    end

    display_goodbye_message
  end
end

RPSGame.new.play
