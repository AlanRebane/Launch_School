require_relative 'ex9.rb'

# 10. Poker!

=begin
In the previous two exercises, you developed a 
Card class and a Deck class. You are now going to 
use those classes to create and evaluate poker hands. 
Create a class, PokerHand, that takes 5 cards from a 
Deck of Cards and evaluates those cards as a Poker hand. 
If you've never played poker before, you may find this overview 
of poker hands useful.

You should build your class using the following code skeleton:
=end

# Include Card and Deck classes from the last two exercises.

class PokerHand
  attr_accessor :hand
  attr_reader :ranks, :suits

  def initialize(deck)
    @hand = deal_hand(deck)
    @ranks = ranks
    @suits = suits
  end

  def deal_hand(deck)
    drawn = []
    5.times { drawn << deck.draw }
    drawn.sort
  end

  def ranks
    ranks = []
    hand.each { |card| ranks << card.determine_value }
    ranks
  end

  def suits
    suits = []
    hand.each { |card| suits << card.suit }
    suits
  end

  def print
    hand.each { |card| puts card.to_s }
  end

  def evaluate
    case
    when royal_flush?     then 'Royal flush'
    when straight_flush?  then 'Straight flush'
    when four_of_a_kind?  then 'Four of a kind'
    when full_house?      then 'Full house'
    when flush?           then 'Flush'
    when straight?        then 'Straight'
    when three_of_a_kind? then 'Three of a kind'
    when two_pair?        then 'Two pair'
    when pair?            then 'Pair'
    else                       'High card'
    end
  end

  private

  def royal_flush?
    (ranks == [10, 11, 12, 13, 14]) && flush?
  end

  def straight_flush?
    straight? && flush?
  end

  def four_of_a_kind?
    ranks.each { |rank| return true if ranks.count(rank) == 4 }
    false
  end

  def full_house?
    three_of_a_kind? && ranks.uniq.size == 2
  end

  def flush?
    suits.uniq.size == 1
  end

  def straight?
    ranks[...-1].each_with_index do |rank, idx| 
      return false if (ranks[idx + 1] - rank) != 1
    end
    true
  end

  def three_of_a_kind?
    ranks.each { |rank| return true if ranks.count(rank) == 3 }
    false
  end

  def two_pair?
    ranks.uniq.size == 3
  end

  def pair?
    ranks.uniq.size == 4
  end
end

# Testing your class

hand = PokerHand.new(Deck.new)
#hand.print
#puts hand.evaluate

# Danger danger danger: monkey
# patching for testing purposes.
class Array
  alias_method :draw, :pop
end

# Test that we can identify each PokerHand type.
hand = PokerHand.new([
  Card.new(10,      'Hearts'),
  Card.new('Ace',   'Hearts'),
  Card.new('Queen', 'Hearts'),
  Card.new('King',  'Hearts'),
  Card.new('Jack',  'Hearts')
])
p hand.ranks
puts hand.evaluate == 'Royal flush'

hand = PokerHand.new([
  Card.new(8,       'Clubs'),
  Card.new(9,       'Clubs'),
  Card.new('Queen', 'Clubs'),
  Card.new(10,      'Clubs'),
  Card.new('Jack',  'Clubs')
])
puts hand.evaluate == 'Straight flush'

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(3, 'Diamonds')
])
puts hand.evaluate == 'Four of a kind'

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(5, 'Hearts')
])
puts hand.evaluate == 'Full house'

hand = PokerHand.new([
  Card.new(10, 'Hearts'),
  Card.new('Ace', 'Hearts'),
  Card.new(2, 'Hearts'),
  Card.new('King', 'Hearts'),
  Card.new(3, 'Hearts')
])
puts hand.evaluate == 'Flush'

hand = PokerHand.new([
  Card.new(8,      'Clubs'),
  Card.new(9,      'Diamonds'),
  Card.new(10,     'Clubs'),
  Card.new(7,      'Hearts'),
  Card.new('Jack', 'Clubs')
])
puts hand.evaluate == 'Straight'

hand = PokerHand.new([
  Card.new('Queen', 'Clubs'),
  Card.new('King',  'Diamonds'),
  Card.new(10,      'Clubs'),
  Card.new('Ace',   'Hearts'),
  Card.new('Jack',  'Clubs')
])
puts hand.evaluate == 'Straight'

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(6, 'Diamonds')
])
puts hand.evaluate == 'Three of a kind'

hand = PokerHand.new([
  Card.new(9, 'Hearts'),
  Card.new(9, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(8, 'Spades'),
  Card.new(5, 'Hearts')
])
puts hand.evaluate == 'Two pair'

hand = PokerHand.new([
  Card.new(2, 'Hearts'),
  Card.new(9, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(9, 'Spades'),
  Card.new(3, 'Diamonds')
])
puts hand.evaluate == 'Pair'

hand = PokerHand.new([
  Card.new(2,      'Hearts'),
  Card.new('King', 'Clubs'),
  Card.new(5,      'Diamonds'),
  Card.new(9,      'Spades'),
  Card.new(3,      'Diamonds')
])
puts hand.evaluate == 'High card'

# # Output:
# =begin
# 5 of Clubs
# 7 of Diamonds
# Ace of Hearts
# 7 of Clubs
# 5 of Spades
# Two pair
# true
# true
# true
# true
# true
# true
# true
# true
# true
# true
# true
# true
# true
# =end

# =begin
# The exact cards and the type of hand will vary with each run.

# Most variants of Poker allow both Ace-high (A, K, Q, J, 10) and 
# Ace-low (A, 2, 3, 4, 5) straights. For simplicity, your 
# code only needs to recognize Ace-high straights.

# If you are unfamiliar with Poker, please see this 
# description of the various hand types. Since we won't 
# actually be playing a game of Poker, it isn't necessary 
# to know how to play.
# =end