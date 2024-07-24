# frozen_string_literal: true

class Player # rubocop:disable Style/Documentation
  attr_accessor :name, :symbol

  def initialize(num, symbol)
    @name = player_name(num)
    @symbol = symbol
  end

  def player_name(num)
    puts "\n\t\t\t\b\bWhat's your name player #{num}?"
    gets.chomp
  end

  def make_move
    puts "\t\t\t\t\b\b\b#{name}, choose your coordinate: \n"

    choice = gets.chomp
    choice = choice.to_i

    while choice.class != Integer || choice < 1 || choice > 9
      puts "\t\t\t\t\b\b\b#{name}, that's not a valid coordinate, please choose again: \n"
      choice = gets.chomp
      choice = choice.to_i
    end

    choice
  end
end
