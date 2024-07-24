# frozen_string_literal: true

class Board # rubocop:disable Style/Documentation
  attr_accessor :board_arr, :symbol, :game_over

  def initialize(symbol)
    @board_arr = [0, 1, 2, 3,
                  4, 5, 6,
                  7, 8, 9]
    @game_over = false
    @symbol = symbol
  end

  def display # rubocop:disable Metrics/AbcSize
    puts "\n\n\t\t\t\t#{board_arr[1]} | #{board_arr[2]} | #{board_arr[3]}"
    puts "\t\t\t\t---+---+--"
    puts "\t\t\t\t#{board_arr[4]} | #{board_arr[5]} | #{board_arr[6]}"
    puts "\t\t\t\t---+---+--"
    puts "\t\t\t\t#{board_arr[7]} | #{board_arr[8]} | #{board_arr[9]}"
    puts "\t\t\t\t---+---+--"
  end

  def draw_choice(coord, symbol)
    while board_arr[coord] == 'X' || board_arr[coord] == 'O'
      puts "\t\tThat coordinate is busy, or is invalid, please choose again:"
      coord = gets.chomp.to_i
      while coord > 9 || coord < 1
        puts "\t\tThat coordinate is busy, or is invalid, please choose again:"
        coord = gets.chomp.to_i
      end
    end
    board_arr[coord] = symbol
  end
end
