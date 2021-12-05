=begin
Create an object-oriented number guessing class for 
numbers in the range 1 to 100, with a limit of 7 guesses per game. 
The game should play like this:

Note that a game object should start a new game with a new number 
to guess with each call to #play.

* Number guessing game is a game that is played by one player. First,
a number is initialized between 1 and 100 and then the player must try
to guess the number. The player has 7 guesses per game. After each guess
the game will tell whether the guess was too low or too high. The player
wins if the number is guessed. *

Nouns:
Game
Player

Verbs:
Give feedback (too high/too low)
Guess
Win

Associations:
Game
- give feedback

Player
- guess
- win
=end

class Player
  attr_accessor :num_guess

  def guess(range)
    puts "Enter a number between #{range.min} and #{range.max}:"
    loop do
      self.num_guess = gets.chomp.to_i
      break if (range).include?(num_guess)
      puts "Invalid guess. Enter a number between 1 and 100:"
    end
  end
end

class GuessingGame
  attr_accessor :winning_number, :num_of_guesses
  attr_reader :player, :range, :original_num_of_guesses

  def initialize(min, max)
    @player = Player.new
    @range = (min..max)
    @original_num_of_guesses = Math.log2(max - min).to_i + 1
  end

  def give_feedback
    if player.num_guess > winning_number
      puts "Your guess is too high."
    elsif player.num_guess < winning_number
      puts "Your guess is too low."
    else
      puts "Congratulations! You guessed the number!"
    end
  end

  def win?
    player.num_guess == winning_number
  end

  def out_of_guesses?
    num_of_guesses == 0
  end

  def reset_game
    self.num_of_guesses = original_num_of_guesses
    self.winning_number = rand(range)
  end

  def display_guesses
    puts ""
    puts "You have #{num_of_guesses} guesses remaining."
  end

  def play
    reset_game

    loop do
      display_guesses
      player.guess(range)
      self.num_of_guesses -= 1
      give_feedback

      break if win? || out_of_guesses?
    end
    puts "You have no more guesses. You lost!" if out_of_guesses? && !win?
  end
end

game = GuessingGame.new(501, 1500)
game.play

=begin
You have 7 guesses remaining.
Enter a number between 1 and 100: 104
Invalid guess. Enter a number between 1 and 100: 50
Your guess is too low.

You have 6 guesses remaining.
Enter a number between 1 and 100: 75
Your guess is too low.

You have 5 guesses remaining.
Enter a number between 1 and 100: 85
Your guess is too high.

You have 4 guesses remaining.
Enter a number between 1 and 100: 0
Invalid guess. Enter a number between 1 and 100: 80

You have 3 guesses remaining.
Enter a number between 1 and 100: 81
That's the number!

You won!
=end

#game.play

=begin
You have 7 guesses remaining.
Enter a number between 1 and 100: 50
Your guess is too high.

You have 6 guesses remaining.
Enter a number between 1 and 100: 25
Your guess is too low.

You have 5 guesses remaining.
Enter a number between 1 and 100: 37
Your guess is too high.

You have 4 guesses remaining.
Enter a number between 1 and 100: 31
Your guess is too low.

You have 3 guesses remaining.
Enter a number between 1 and 100: 34
Your guess is too high.

You have 2 guesses remaining.
Enter a number between 1 and 100: 32
Your guess is too low.

You have 1 guesses remaining.
Enter a number between 1 and 100: 32
Your guess is too low.

You have no more guesses. You lost!
=end
