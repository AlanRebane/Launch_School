=begin
1. Write a description of the problem and extract major verbs and nouns
2. Make an initial guess at organizing the verbs into nouns and do a spike
   to explore the problem with temporary code.
3. Optional - when you have a better idea of the problem, model your
   thoughts into CRC cards

1) Short description
Tic Tac Toe is a 2-player board game played on a 3x3 grid. Players take
turns marking a square. The first player to mark 3 squares in a row wins.

2) Extract verbs and nouns
Nouns: board, grid, players, square
verbs: play, mark

3) Organize it a bit
- board (the same as 'grid')
- square

- players
  * play
  * mark

=end

# Spike - start to think about possible "states" for the objects of the class

class Board
  WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                  [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # columns
                  [[1, 5, 9], [3, 5, 7]]              # diagonals

  attr_accessor :squares

  def initialize
    @squares = {}
    reset
  end

  def []=(num, marker)
    @squares[num].marker = marker
  end

  def unmarked_keys
    @squares.keys.select { |key| @squares[key].unmarked? }
  end

  def full?
    unmarked_keys.empty?
  end

  def someone_won?(arr_of_markers)
    arr_of_markers.each do |player_marker|
      return true if !!winning_marker(player_marker)
    end
    false
  end

  def count_player_marker(squares, player_marker)
    squares.collect(&:marker).count(player_marker)
  end

  # return winning marker or nil, pass in only relevant squares
  def winning_marker(player_marker)
    WINNING_LINES.each do |line|
      if count_player_marker(@squares.values_at(*line), player_marker) == 3
        return player_marker
      end
    end
    nil
  end

  def reset
    (1..9).each { |key| @squares[key] = Square.new }
  end

  # rubocop:disable Metrics/AbcSize
  # rubocop:disable Metrics/MethodLength
  def draw
    puts "You're #{TTTGame::HUMAN_MARKER},\
 computer is #{TTTGame::COMPUTER_MARKER}."
    puts ""
    puts "     |     |"
    puts "  #{squares[1]}  |  #{squares[2]}  | #{squares[3]}"
    puts "     |     |"
    puts "-----|-----|-----"
    puts "     |     |"
    puts "  #{squares[4]}  |  #{squares[5]}  | #{squares[6]}"
    puts "     |     |"
    puts "-----|-----|-----"
    puts "     |     |"
    puts "  #{squares[7]}  |  #{squares[8]}  | #{squares[9]}"
    puts "     |     |"
    puts ""
  end
  # rubocop:enable Metrics/AbcSize
  # rubocop:enable Metrics/MethodLength
end

class Square
  INITIAL_MARKER = " "

  attr_accessor :marker

  def initialize(marker = INITIAL_MARKER)
    @marker = marker
  end

  def to_s
    @marker
  end

  def unmarked?
    marker == INITIAL_MARKER
  end
end

class Player
  attr_reader :marker

  def initialize(marker)
    @marker = marker
  end
end

class TTTGame
  HUMAN_MARKER = 'X'
  COMPUTER_MARKER = 'O'
  PLAYER_MARKERS = [HUMAN_MARKER, COMPUTER_MARKER]
  attr_reader :board, :human, :computer

  def initialize
    @board = Board.new
    @human = Player.new(HUMAN_MARKER)
    @computer = Player.new(COMPUTER_MARKER)
  end

  def play
    clear
    display_welcome_message
    main_game
    display_goodbye_message
  end

  private

  def main_game
    loop do
      board.draw
      @current_player = PLAYER_MARKERS.sample
      player_move
      display_result
      break unless play_again?
      play_again_message
    end
  end

  def player_move
    loop do
      current_player_moves
      break if board.someone_won?(PLAYER_MARKERS) || board.full?
      clear_screen_and_display_board if @current_player == HUMAN_MARKER
    end
  end

  def display_welcome_message
    puts "Welcome to Tic Tac Toe!"
    puts ""
  end

  def display_goodbye_message
    puts "Thanks for playing Tic Tac Toe! Goodbye!"
  end

  def clear_screen_and_display_board
    clear
    board.draw
  end

  def human_moves
    puts "Choose a square (#{board.unmarked_keys.join(', ')}): "
    square = nil
    loop do
      square = gets.chomp.to_i
      break if board.unmarked_keys.include?(square)
      puts "Sorry, that's not a valid choice."
    end

    board[square] = human.marker
  end

  def computer_moves
    board[board.unmarked_keys.sample] = computer.marker
  end

  def current_player_moves
    if @current_player == HUMAN_MARKER
      human_moves
      @current_player = COMPUTER_MARKER
    else
      computer_moves
      @current_player = HUMAN_MARKER
    end
  end

  def display_result
    clear_screen_and_display_board

    if board.winning_marker(HUMAN_MARKER)
      puts "You won!"
    elsif board.winning_marker(COMPUTER_MARKER)
      puts "Computer won!"
    else
      puts "It's a tie"
    end
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again? (y/n)"
      answer = gets.chomp.downcase
      break if %w(y n).include? answer
      puts "Sorry, must be y or n"
    end

    answer == 'y'
  end

  def play_again_message
    board.reset
    clear
    puts "Let's play again!"
    puts ""
  end

  def clear
    system 'clear'
  end
end

game = TTTGame.new
game.play
