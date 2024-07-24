require_relative 'colorize_helper'
require_relative 'symbols'

class GameConditions
  include Symbols

  SEQUENCE_COLORS = ColorizeHelper.red_color('Red, Blue, Green, Yellow, Black, White, Gray, Orange, Purple, Pink'.downcase)
  HIGHLIGHT_HINT = ColorizeHelper.red_color('hints')

  def game_conditions
    puts ColorizeHelper.red_color("#{AIM_SYMBOL} THE MAIN GOAL #{AIM_SYMBOL} is you have 12 turns to guess 4 colors.")
    puts "You have only 10 various colors: #{SEQUENCE_COLORS}"
    puts "Game will give you #{HIGHLIGHT_HINT} of what color you guessed."
    puts
  end
end