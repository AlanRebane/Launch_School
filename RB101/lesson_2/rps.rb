VALID_CHOICES = { r: 'rock',
                  p: 'paper',
                  sc: 'scissors',
                  l: 'lizard',
                  sp: 'spock' }

WIN_COLLECTION = { 'scissors' => ['paper', 'lizard'],
                   'paper' => ['rock', 'spock'],
                   'rock' => ['lizard', 'scissors'],
                   'lizard' => ['spock', 'paper'],
                   'spock' => ['scissors', 'rock'] }

def prompt(message)
  puts "=> #{message}"
end

def win?(first, second)
  WIN_COLLECTION[first].include?(second)
end

def display_result(player, computer)
  if win?(player, computer)
    prompt("You WON the game!")
  elsif win?(computer, player)
    prompt("Computer won the game.")
  else
    prompt("It's a tie")
  end
end

def score_counter(player, computer, player_score, computer_score)
  if win?(player, computer)
    player_score += 1
  elsif win?(computer, player)
    computer_score += 1
  end
  return player_score, computer_score
end

prompt("Let's play rock-paper-scissors-lizard-spock to 3 wins!")

# The meat of the program:
loop do
  # Initialize scores, the game is played until 3 wins.
  player_score = 0
  computer_score = 0

  loop do
    choice = '' # variable needs to be in scope!
    loop do
      prompt("Choose one:")
      VALID_CHOICES.each do |key, value|
        puts "=>   #{key} for #{value}"
      end
      selection = gets.chomp.to_sym
      # map the user selection to the correct value
      choice = VALID_CHOICES[selection]

      if VALID_CHOICES.values.include?(choice)
        break
      else
        prompt("That's not a valid choice.")
      end
    end

    computer_choice = VALID_CHOICES.values.sample

    prompt("You chose #{choice}; Computer chose #{computer_choice}")

    display_result(choice, computer_choice)
    player_score, computer_score = score_counter(choice, computer_choice,
                                                 player_score, computer_score)
    prompt("After the round, your score is #{player_score}")
    prompt("and the computer score is #{computer_score}")
    puts("")
    break if player_score == 3 || computer_score == 3
  end

  if player_score > computer_score
    prompt("Congratulations, you won the competition!")
  else
    prompt("The computer won the competition. Better luck next time!")
  end

  prompt("Do you want to play again? y for again")
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt("Thanks for playing. Good bye :)")
