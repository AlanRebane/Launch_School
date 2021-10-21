module Hand
  attr_accessor :cards

  def show_hand(show_all_hand = true)
    if show_all_hand
      p(cards)
      puts "The #{self.class}'s total is #{total}"
    else
      puts "The dealer's hand:"
      p(cards[0])
    end
  end

  def hit(deck)
    puts "The #{self.class} decided to HIT."
    cards << deck.deal_one_card
    show_hand
  end

  def stay
    puts "You decided to stay."
  end

  def busted?
    total > 21
  end

  def total
    total_sum = 0
    ace_counter = 0
    cards.each do |card|
      card[1] == 'A' ? ace_counter += 1 : total_sum += get_card_value(card)
    end
    ace_counter.times { total_sum += get_ace_value(total_sum) }
    total_sum
  end

  def get_card_value(card)
    card[1].to_i.to_s == card[1] ? card[1].to_i : 10
  end

  def get_ace_value(total_sum)
    if total_sum > 10
      1
    else
      11
    end
  end
end

class Player
  include Hand

  def initialize
    @cards = []
  end

  def set_name
    name = nil
    puts "Hey there! Enter your name:"
    loop do
      name = gets.chomp.to_s
      break if !name.empty?
      puts "Sorry, you must enter something."
    end
    name
  end
end

class Dealer
  include Hand

  def initialize
    @cards = []
  end
end

class Deck
  KINDS = ['H', 'D', 'S', 'C']
  CARDS = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']

  attr_accessor :deck

  def initialize
    @deck = deal()
  end

  def deal
    new_deck = []
    KINDS.each do |kind|
      CARDS.each do |num|
        new_deck << [kind, num]
      end
    end
    new_deck.shuffle
  end

  def deal_one_card
    deck.pop
  end

  def deal_hand(cards)
    cards << deck.pop << deck.pop
  end
end

class Game
  attr_accessor :deck, :player, :dealer

  def initialize
    @deck = Deck.new
    @player = Player.new
    @dealer = Dealer.new
  end

  def start
    system 'clear'
    display_welcome_message
    main_game_loop
    display_goodbye_message
  end

  private

  def main_game_loop
    loop do
      initialize
      puts "New game!"
      deal_cards
      show_initial_cards
      take_turns
      show_result
      break unless play_again?
      system 'clear'
    end
  end

  def play_again?
    puts "Would you like to play again? Enter y/n"
    loop do
      ans = gets.chomp
      return true if ans == 'y'
      return false if ans == 'n'
      puts "Sorry! Must enter y or n."
    end
  end

  def take_turns
    player_turn
    return puts "The dealer won." if player.busted?
    puts "-------------------------------------------"
    show_dealers_hand
    dealer_turn
  end

  def display_welcome_message
    puts "Welcome to the game of 21, which is a simple version of Blackjack."
  end

  def show_dealers_hand
    puts "The Dealer's hand is:"
    dealer.show_hand
  end

  def deal_cards
    puts ""
    puts "The initial cards are dealt:"
    deck.deal_hand(player.cards)
    deck.deal_hand(dealer.cards)
  end

  def show_initial_cards
    player.show_hand
    dealer.show_hand(false)
  end

  def player_turn
    loop do
      decision = player_chooses
      break if decision == 's' || player.busted?
    end
  end

  # rubocop:disable Metrics/MethodLength
  def player_chooses
    loop do
      puts ""
      puts "Hit (h) or stay (s)? Enter h/s"
      ans = gets.chomp
      case ans
      when 'h'
        player.hit(deck)
        return puts "GOT BUSTED!" if player.busted?
      when 's'
        player.stay
        return 's'
      else puts "Sorry! You need to enter h or s."
      end
    end
  end

  def dealer_turn
    puts ""
    loop do
      sleep(1)
      return puts "The dealer got BUSTED!" if dealer.busted?
      break if dealer.total > player.total
      dealer.hit(deck)
    end
  end

  def show_result
    puts "-------------------------------------------"
    puts "The result is:"
    player.show_hand
    dealer.show_hand
    if player_won?
      puts "Congratulations! You won!"
    elsif dealer_won?
      puts "The dealer won."
    else
      puts "It's a tie!"
    end
  end
  # rubocop:enable Metrics/MethodLength

  def player_won?
    ((player.total > dealer.total) && !player.busted?) \
    || (!player.busted? && dealer.busted?)
  end

  def dealer_won?
    ((player.total < dealer.total) && !dealer.busted?) \
    || (player.busted? && !dealer.busted?)
  end

  def display_goodbye_message
    puts ""
    puts "Thanks for playing Twenty-One. Goodbye!"
  end
end

Game.new.start
