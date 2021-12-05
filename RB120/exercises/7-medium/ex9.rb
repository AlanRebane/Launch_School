
# 9. Deck of Cards
=begin
Using the Card class from the previous exercise, create a Deck 
class that contains all of the standard 52 playing cards. 
Use the following code to start your work:
=end

class Card
  include Comparable
  attr_reader :rank, :suit

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def determine_value
    case rank
    when 'Jack' then 11
    when 'Queen' then 12
    when 'King' then 13
    when 'Ace' then 14
    else rank
    end
  end

  def <=>(other)
    determine_value <=> other.determine_value
  end

  def to_s
    "#{rank} of #{suit}"
  end
end

class Deck
  RANKS = ((2..10).to_a + %w(Jack Queen King Ace)).freeze
  SUITS = %w(Hearts Clubs Diamonds Spades).freeze

  attr_accessor :my_deck

  def initialize
    @my_deck = create_a_deck
  end

  def create_a_deck
    new_deck = []
    SUITS.each do |suit|
      RANKS.each do |rank|
        new_deck << [rank, suit]
      end
    end
    new_deck.shuffle
  end

  def draw
    self.my_deck = create_a_deck if my_deck.empty?
    new_card = self.my_deck.pop
    Card.new(new_card[0], new_card[1])
  end
end

=begin
The Deck class should provide a #draw method to 
deal one card. The Deck should be shuffled when it 
is initialized and, if it runs out of cards, it should 
reset itself by generating a new set of 52 shuffled cards.

Examples:
=end

# deck = Deck.new
# drawn = []
# 52.times { drawn << deck.draw }
# puts drawn.count { |card| card.rank == 5 } == 4
# puts drawn.count { |card| card.suit == 'Hearts' } == 13

# drawn2 = []
# 52.times { drawn2 << deck.draw }
# puts drawn != drawn2 # Almost always.

=begin
Note that the last line should almost always be true; 
if you shuffle the deck 1000 times a second, 
you will be very, very, very old before you 
see two consecutive shuffles produce the same results. 
If you get a false result, you almost certainly have something wrong.
=end
