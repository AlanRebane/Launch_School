require "pry"

KINDS = ['H', 'D', 'S', 'C']
CARDS = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']

def prompt(msg)
  puts "=> #{msg}"
end

def initialize_deck
  KINDS.product(CARDS).shuffle
end

def select_card_from_deck!(deck)
  deck.pop
end

def initial_deal(deck)
  player_hand = []
  dealer_hand = []
  2.times do
    player_hand << select_card_from_deck!(deck)
    dealer_hand << select_card_from_deck!(deck)
  end
  return player_hand, dealer_hand
end

def total(hand)
  values = hand.map { |card| card[1] }

  sum = 0
  values.each do |value|
    if value == "A"
      sum += 11
    elsif ['J', 'Q', 'K'].include?(value)
      sum += 10
    else
      sum += value.to_i
    end
  end

  values.flatten.count('A').times do
    sum -= 10 if sum > 20
  end

  sum
end

def busted?(hand)
  total(hand) > 21
end

def determine_winner(player_hand, dealer_hand)
  if busted?(player_hand)
    "dealer"
  elsif busted?(dealer_hand)
    "player"
  elsif total(player_hand) > total(dealer_hand)
    "player"
  elsif total(player_hand) < total(dealer_hand)
    "dealer"
  else
    "tie"
  end
end

loop do
  system 'clear'
  prompt "Welcome to the game of 21!"
  deck = initialize_deck
  player_hand, dealer_hand = initial_deal(deck)

  prompt "The player's turn!"
  prompt "The dealers hand is: #{[dealer_hand[0]] + [['hidden']]} "
  loop do
    prompt "Your hand is: #{player_hand}. Value is #{total(player_hand)}."
    prompt "Do you want to hit or stay? (enter for hit, type 's' for stay)"
    answer = gets.chomp
    break if answer.start_with?('s')
    player_hand << select_card_from_deck!(deck)
    break if busted?(player_hand)
  end

  puts ""

  if busted?(player_hand)
    prompt "Your hand is #{player_hand} with a value of #{total(player_hand)}."
    prompt "You got bust! The dealer won"

    winner = "dealer"
  else
    prompt "You chose to stay. Now it's the dealer's turn!"
    loop do
      puts "The dealer's hand is #{dealer_hand}."
      puts "The value of dealer's hand is: #{total(dealer_hand)}."
      break if total(dealer_hand) >= 17 ||
               total(dealer_hand) > total(player_hand)
      dealer_hand << select_card_from_deck!(deck)
      sleep(2)
    end

    winner = determine_winner(player_hand, dealer_hand)
  end

  prompt "The winner of the game is the #{winner}!"
  puts ""
  prompt "Do you want to play again? (y or n)"
  play_again = gets.chomp
  break if play_again.start_with?('n')
end
