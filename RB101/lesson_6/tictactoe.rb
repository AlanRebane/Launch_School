require 'pry'

INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # columns
                [[1, 5, 9], [3, 5, 7]]              # diagonals
GRAND_WINNER = 4

def prompt(txt)
  puts "=> #{txt}"
end

# rubocop:disable Metrics/AbcSize
def display_board(brd)
  system 'clear'
  puts "You're #{PLAYER_MARKER}. Computer is #{COMPUTER_MARKER}."
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
  puts ""
end
# rubocop:enable Metrics/AbcSize

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def joinor(arr, delimiter = ', ', or_and = 'or')
  case arr.size
  when 0 then ''
  when 1 then arr.first
  when 2 then arr.join(" #{or_and} ")
  else
    arr[-1] = "#{or_and} #{arr.last}"
    arr.join(delimiter)
  end
end

def player_places_piece!(brd)
  square = ''

  loop do
    prompt "Choose a square (#{joinor(empty_squares(brd))}):"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry, that's not a valid choice."
  end

  brd[square] = PLAYER_MARKER
end

def computer_threat_or_opportunity_square(brd, marker = PLAYER_MARKER)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(marker) == 2 &&
       brd.values_at(*line).include?(INITIAL_MARKER)
      return line.fetch(brd.values_at(*line).find_index(INITIAL_MARKER))
    end
  end
  false
end

def computer_places_piece!(brd)
  square = (if computer_threat_or_opportunity_square(brd, COMPUTER_MARKER)
              computer_threat_or_opportunity_square(brd, COMPUTER_MARKER)
            elsif computer_threat_or_opportunity_square(brd, PLAYER_MARKER)
              computer_threat_or_opportunity_square(brd, PLAYER_MARKER)
            elsif brd[5] == " "
              5
            else
              empty_squares(brd).sample
            end)
  brd[square] = COMPUTER_MARKER
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return 'Player'
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return 'Computer'
    end
  end
  nil
end

def keep_score(player_score, comp_score, winner)
  winner == 'Player' ? player_score += 1 : comp_score += 1
  return player_score, comp_score
end

def display_score(score, who = 'player')
  score == 1 ? "The #{who} has 1 point." : "The #{who} has #{score} points."
end

def place_piece!(brd, current_player)
  if current_player == 'computer'
    computer_places_piece!(brd)
  else
    player_places_piece!(brd)
  end
end

def alternate_player(current_player)
  ['player', 'computer'].select { |x| x != current_player }[0]
end

loop do
  player_score = 0
  computer_score = 0

  loop do
    board = initialize_board
    current_player = ['player', 'computer'].sample

    loop do
      display_board(board)
      place_piece!(board, current_player)
      current_player = alternate_player(current_player)
      break if someone_won?(board) || board_full?(board)
    end

    display_board(board)

    if someone_won?(board)
      winner = detect_winner(board)
      prompt "#{winner} won!"
      player_score, computer_score = keep_score(player_score, computer_score,
                                                winner)
    else
      prompt "It's a tie!"
    end

    prompt display_score(player_score)
    prompt display_score(computer_score, 'computer')

    break if player_score >= GRAND_WINNER || computer_score >= GRAND_WINNER

    prompt "Do you want to continue until #{GRAND_WINNER} wins? (y or n)"
    answer = gets.chomp
    break if answer.downcase.start_with?('n')
  end

  tournament_winner = player_score >= GRAND_WINNER ? 'player' : 'computer'
  prompt "The #{tournament_winner} won the Tic Tac Toe tournament!"
  prompt "Play again until #{GRAND_WINNER} points? (y or n)"
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt "Thanks for playing Tic Tac Toe! Good bye!"
