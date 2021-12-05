# 1. Privacy
# Modify this class so both flip_switch and the setter 
# method switch= are private methods.

class Machine
  attr_writer :switch

  def start
    self.flip_switch(:on)
  end

  def stop
    self.flip_switch(:off)
  end

  def flip_switch(desired_state)
    self.switch = desired_state
  end
end

###############################################################################
# 2. Fixed Array
# A fixed-length array is an array that always has a 
# fixed number of elements. Write a class that implements a 
# fixed-length array, and provides the necessary methods to 
# support the following code:

# The below code should output true 16 times.

fixed_array = FixedArray.new(5)
puts fixed_array[3] == nil
puts fixed_array.to_a == [nil] * 5

fixed_array[3] = 'a'
puts fixed_array[3] == 'a'
puts fixed_array.to_a == [nil, nil, nil, 'a', nil]

fixed_array[1] = 'b'
puts fixed_array[1] == 'b'
puts fixed_array.to_a == [nil, 'b', nil, 'a', nil]

fixed_array[1] = 'c'
puts fixed_array[1] == 'c'
puts fixed_array.to_a == [nil, 'c', nil, 'a', nil]

fixed_array[4] = 'd'
puts fixed_array[4] == 'd'
puts fixed_array.to_a == [nil, 'c', nil, 'a', 'd']
puts fixed_array.to_s == '[nil, "c", nil, "a", "d"]'

puts fixed_array[-1] == 'd'
puts fixed_array[-4] == 'c'

begin
  fixed_array[6]
  puts false
rescue IndexError
  puts true
end

begin
  fixed_array[-7] = 3
  puts false
rescue IndexError
  puts true
end

begin
  fixed_array[7] = 3
  puts false
rescue IndexError
  puts true
end

###############################################################################
# 3. Students
=begin
  Below we have 3 classes: Student, Graduate, and Undergraduate. 
  The implementation details for the #initialize methods in Graduate 
  and Undergraduate are missing. Fill in those missing details so that 
  the following requirements are fulfilled:

  Graduate students have the option to use on-campus parking, 
  while Undergraduate students do not.

  Graduate and Undergraduate students both have a name and 
  year associated with them.
  
  Note, you can do this by adding or altering no more than 5 lines of code.
=end

class Student
  def initialize(name, year)
    @name = name
    @year = year
  end
end

class Graduate
  def initialize(name, year, parking)
  end
end

class Undergraduate
  def initialize(name, year)
  end
end

###############################################################################
# 4. Circular Queue
=begin
A circular queue is a collection of objects stored in a buffer 
that is treated as though it is connected end-to-end in a circle. 
When an object is added to this circular queue, it is added to the 
position that immediately follows the most recently added object, 
while removing an object always removes the object that has been 
  in the queue the longest.

This works as long as there are empty spots in the buffer. 
If the buffer becomes full, adding a new object to the queue 
requires getting rid of an existing object; with a circular queue, 
the object that has been in the queue the longest is discarded 
and replaced by the new object.

Assuming we have a circular queue with room for 3 objects, 
the circular queue looks and acts like this:

//see photo in LS folder//

Your task is to write a CircularQueue class that implements a 
circular queue for arbitrary objects. The class should obtain 
the buffer size with an argument provided to CircularQueue::new, 
and should provide the following methods:

enqueue to add an object to the queue
dequeue to remove (and return) the oldest object in the queue. 
It should return nil if the queue is empty.

You may assume that none of the values stored in the queue are 
nil (however, nil may be used to designate empty spots in the buffer).

The below code should display true 15 times.

hint: https://en.wikipedia.org/wiki/Circular_buffer
=end

queue = CircularQueue.new(3)
puts queue.dequeue == nil

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil

queue = CircularQueue.new(4)
puts queue.dequeue == nil

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 4
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil

###############################################################################
# 5. Stack Machine Interpretation
=begin
This is one of the hardest exercises in this exercise set. 
It uses both exceptions and Object#send, neither of which 
we've discussed in detail before now. Think of this exercise 
as one that pushes you to learn new things on your own, 
and don't worry if you can't solve it.

You may remember our Minilang language from back in the RB101-RB109 Medium exercises. We return to that language now, but this time we'll be using OOP. If you need a refresher, refer back to that exercise.

Write a class that implements a miniature stack-and-register-based programming language that has the following commands:

n Place a value n in the "register". Do not modify the stack.
PUSH Push the register value on to the stack. Leave the value in the register.
ADD Pops a value from the stack and adds it to the register value, storing the result in the register.
SUB Pops a value from the stack and subtracts it from the register value, storing the result in the register.
MULT Pops a value from the stack and multiplies it by the register value, storing the result in the register.
DIV Pops a value from the stack and divides it into the register value, storing the integer result in the register.
MOD Pops a value from the stack and divides it into the register value, storing the integer remainder of the division in the register.
POP Remove the topmost item from the stack and place in register
PRINT Print the register value
All operations are integer operations (which is only important with DIV and MOD).

Programs will be supplied to your language method via a string passed in as an argument. Your program should produce an error if an unexpected item is present in the string, or if a required stack value is not on the stack when it should be (the stack is empty). In all error cases, no further processing should be performed on the program.

You should initialize the register to 0.

Examples:
=end
Minilang.new('PRINT').eval
# 0

Minilang.new('5 PUSH 3 MULT PRINT').eval
# 15

Minilang.new('5 PRINT PUSH 3 PRINT ADD PRINT').eval
# 5
# 3
# 8

Minilang.new('5 PUSH 10 PRINT POP PRINT').eval
# 10
# 5

Minilang.new('5 PUSH POP POP PRINT').eval
# Empty stack!

Minilang.new('3 PUSH PUSH 7 DIV MULT PRINT ').eval
# 6

Minilang.new('4 PUSH PUSH 7 MOD MULT PRINT ').eval
# 12

Minilang.new('-3 PUSH 5 XSUB PRINT').eval
# Invalid token: XSUB

Minilang.new('-3 PUSH 5 SUB PRINT').eval
# 8

Minilang.new('6 PUSH').eval
# (nothing printed; no PRINT commands)

=begin
For error handling, you will likely need exceptions. S
ee the Ruby documentation for handling exceptions and 
for the Exception class. 
  
You may also find this blog article on 
Getting Started With Ruby Exceptions helpful.
https://launchschool.medium.com/getting-started-with-ruby-exceptions-d6318975b8d1

Custom exceptions are usually derived from the StandardError exception class, like so:
=end

class MyCustomError < StandardError; end

=begin
 You may also find Object#send to be useful when evaluating the Minilang code.
 If you have a variable str that points to a string, 
 and you want to determine if it is a number, 
 you can use a regular expression in an if statement, like this:
=end

if str =~ /\A[-+]?\d+\z/
  puts "It's a number!"
else
  puts "It's not a number."
end

=begin
Regular expressions (regex) are very useful for string operations, 
but we don't cover them in any detail until RB130. 
If you haven't already read our book, 
Introduction to Regular Expressions, you may do so now, 
but it isn't necessary - this hint is all you need to know about 
regex for this problem.
=end

###############################################################################
# 6. Number Guesser Part 1

=begin
Create an object-oriented number guessing class for 
numbers in the range 1 to 100, with a limit of 7 guesses per game. 
The game should play like this:

Note that a game object should start a new game with a new number 
to guess with each call to #play.
=end

game = GuessingGame.new
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

game.play

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

###############################################################################

# 7. Number Guesser Part 2

=begin
In the previous exercise, you wrote a number guessing game that 
determines a secret number between 1 and 100, and gives the user 
7 opportunities to guess the number.

Note that a game object should start a new game with a 
new number to guess with each call to #play.

Update your solution to accept a low and high value when 
you create a GuessingGame object, and use those values to 
compute a secret number for the game. You should also change 
the number of guesses allowed so the user can always win if 
she uses a good strategy. You can compute the number of guesses with:

Math.log2(size_of_range).to_i + 1

=end

game = GuessingGame.new(501, 1500)
game.play

=begin
You have 10 guesses remaining.
Enter a number between 501 and 1500: 104
Invalid guess. Enter a number between 501 and 1500: 1000
Your guess is too low.

You have 9 guesses remaining.
Enter a number between 501 and 1500: 1250
Your guess is too low.

You have 8 guesses remaining.
Enter a number between 501 and 1500: 1375
Your guess is too high.

You have 7 guesses remaining.
Enter a number between 501 and 1500: 80
Invalid guess. Enter a number between 501 and 1500: 1312
Your guess is too low.

You have 6 guesses remaining.
Enter a number between 501 and 1500: 1343
Your guess is too low.

You have 5 guesses remaining.
Enter a number between 501 and 1500: 1359
Your guess is too high.

You have 4 guesses remaining.
Enter a number between 501 and 1500: 1351
Your guess is too high.

You have 3 guesses remaining.
Enter a number between 501 and 1500: 1355
That's the number!

You won!

=end

game.play

=begin
You have 10 guesses remaining.
Enter a number between 501 and 1500: 1000
Your guess is too high.

You have 9 guesses remaining.
Enter a number between 501 and 1500: 750
Your guess is too low.

You have 8 guesses remaining.
Enter a number between 501 and 1500: 875
Your guess is too high.

You have 7 guesses remaining.
Enter a number between 501 and 1500: 812
Your guess is too low.

You have 6 guesses remaining.
Enter a number between 501 and 1500: 843
Your guess is too high.

You have 5 guesses remaining.
Enter a number between 501 and 1500: 820
Your guess is too low.

You have 4 guesses remaining.
Enter a number between 501 and 1500: 830
Your guess is too low.

You have 3 guesses remaining.
Enter a number between 501 and 1500: 835
Your guess is too low.

You have 2 guesses remaining.
Enter a number between 501 and 1500: 836
Your guess is too low.

You have 1 guesses remaining.
Enter a number between 501 and 1500: 837
Your guess is too low.

You have no more guesses. You lost!
=end

###############################################################################

# 8. Highest and Lowest Ranking Cards

# Update this class so you can use it to determine the lowest ranking 
# and highest ranking cards in an Array of Card objects:

class Card
  attr_reader :rank, :suit

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end
end

=begin
For this exercise, numeric cards are low cards, 
ordered from 2 through 10. Jacks are higher than 10s, 
Queens are higher than Jacks, Kings are higher than Queens, 
and Aces are higher than Kings. The suit plays no part in 
the relative ranking of cards.

If you have two or more cards of the same rank in your list, 
your min and max methods should return one of the matching 
cards; it doesn't matter which one.

Besides any methods needed to determine the lowest 
and highest cards, create a #to_s method that returns 
a String representation of the card, e.g., "Jack of Diamonds", 
"4 of Clubs", etc.

Examples:
=end

cards = [Card.new(2, 'Hearts'),
  Card.new(10, 'Diamonds'),
  Card.new('Ace', 'Clubs')]
puts cards
puts cards.min == Card.new(2, 'Hearts')
puts cards.max == Card.new('Ace', 'Clubs')

cards = [Card.new(5, 'Hearts')]
puts cards.min == Card.new(5, 'Hearts')
puts cards.max == Card.new(5, 'Hearts')

cards = [Card.new(4, 'Hearts'),
  Card.new(4, 'Diamonds'),
  Card.new(10, 'Clubs')]
puts cards.min.rank == 4
puts cards.max == Card.new(10, 'Clubs')

cards = [Card.new(7, 'Diamonds'),
  Card.new('Jack', 'Diamonds'),
  Card.new('Jack', 'Spades')]
puts cards.min == Card.new(7, 'Diamonds')
puts cards.max.rank == 'Jack'

cards = [Card.new(8, 'Diamonds'),
  Card.new(8, 'Clubs'),
  Card.new(8, 'Spades')]
puts cards.min.rank == 8
puts cards.max.rank == 8

=begin
Output:

2 of Hearts
10 of Diamonds
Ace of Clubs
true
true
true
true
true
true
true
true
true
true
=end

# Hint
=begin
This exercise doesn't expect you to define a #min or #max 
method in the Card class. It wants you to update the class 
so that Enumerable#min and Enumerable#max work when applied 
to an Array of Card objects.

Investigate the Comparable module.
=end

###############################################################################

# 9. Deck of Cards
=begin
Using the Card class from the previous exercise, create a Deck 
class that contains all of the standard 52 playing cards. 
Use the following code to start your work:
=end

class Deck
  RANKS = ((2..10).to_a + %w(Jack Queen King Ace)).freeze
  SUITS = %w(Hearts Clubs Diamonds Spades).freeze
end

=begin
The Deck class should provide a #draw method to 
deal one card. The Deck should be shuffled when it 
is initialized and, if it runs out of cards, it should 
reset itself by generating a new set of 52 shuffled cards.

Examples:
=end

deck = Deck.new
drawn = []
52.times { drawn << deck.draw }
drawn.count { |card| card.rank == 5 } == 4
drawn.count { |card| card.suit == 'Hearts' } == 13

drawn2 = []
52.times { drawn2 << deck.draw }
drawn != drawn2 # Almost always.

=begin
Note that the last line should almost always be true; 
if you shuffle the deck 1000 times a second, 
you will be very, very, very old before you 
see two consecutive shuffles produce the same results. 
If you get a false result, you almost certainly have something wrong.
=end

###############################################################################

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
  def initialize(deck)
  end

  def print
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
  end

  def straight_flush?
  end

  def four_of_a_kind?
  end

  def full_house?
  end

  def flush?
  end

  def straight?
  end

  def three_of_a_kind?
  end

  def two_pair?
  end

  def pair?
  end
end

# Testing your class

hand = PokerHand.new(Deck.new)
hand.print
puts hand.evaluate

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

# Output:
=begin
5 of Clubs
7 of Diamonds
Ace of Hearts
7 of Clubs
5 of Spades
Two pair
true
true
true
true
true
true
true
true
true
true
true
true
true
=end

=begin
The exact cards and the type of hand will vary with each run.

Most variants of Poker allow both Ace-high (A, K, Q, J, 10) and 
Ace-low (A, 2, 3, 4, 5) straights. For simplicity, your 
code only needs to recognize Ace-high straights.

If you are unfamiliar with Poker, please see this 
description of the various hand types. Since we won't 
actually be playing a game of Poker, it isn't necessary 
to know how to play.
=end
