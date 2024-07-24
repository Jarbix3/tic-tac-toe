# frozen_string_literal: true

require_relative 'lib/player'
require_relative 'lib/board'

def start # rubocop:disable Metrics/AbcSize,Metrics/MethodLength
  i = 1
  win = false

  player_one = Player.new(1, 'X')
  player_two = Player.new(2, 'O')

  board = Board.new(player_one.symbol)

  board.display

  while i <= 9
    break if win == true

    choice = ''

    if i.odd?
      choice = player_one.make_move
      board.draw_choice(choice.to_i, player_one.symbol)
      board.display
      win = winner(board.board_arr, player_one.symbol, player_one.name, i)

    end
    if i.even?
      choice = player_two.make_move
      board.draw_choice(choice.to_i, player_two.symbol)
      board.display
      win = winner(board.board_arr, player_two.symbol, player_one.name, i)
    end

    i += 1

  end
end

def winner(board_arr, symbol, plyr_name, turns) # rubocop:disable Metrics/CyclomaticComplexity,Metrics/PerceivedComplexity,Metrics/AbcSize,Metrics/MethodLength
  row1 = board_arr[1..3], row2 = board_arr[4..6]
  row3 = board_arr[7..9], col1 = [board_arr[1], board_arr[4], board_arr[7]]
  col2 = [board_arr[2], board_arr[5], board_arr[8]], col3 = [board_arr[3], board_arr[6], board_arr[9]],
  diag1 = [board_arr[1], board_arr[5], board_arr[9]], diag2 = [board_arr[3], board_arr[5], board_arr[7]] # rubocop:disable Layout/ArrayAlignment

  if row1.all? { |n| n == symbol } || row2.all? { |n| n == symbol } || row3.all? { |n| n == symbol }
    puts "\t\t\t\t#{plyr_name} wins!!"
    return true
  end

  if col1.all? { |n| n == symbol } || col2.all? { |n| n == symbol } || col3.all? { |n| n == symbol }
    puts "\t\t\t\t#{plyr_name} wins!!"
    return true
  end

  if diag1.all? { |n| n == symbol } || diag2.all? { |n| n == symbol }
    puts "\t\t\t\t#{plyr_name} wins!!"
    return true
  end

  return unless turns == 9

  puts "\t\t\t\t\tIt's a tie!!!"
  false
end

start
