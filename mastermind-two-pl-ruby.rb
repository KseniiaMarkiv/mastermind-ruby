require 'colorize'
# * colorizing methods

def blue_color(string)
  string.colorize(:blue)
end

def yellow_color(string)
  string.colorize(:yellow)
end

def green_color(string)
  string.colorize(:green)
end

def red_color(string)
  string.colorize(:red)
end

def gray_color(string)
  string.colorize(:gray)
end

# all symbols
@celebration_symbol = "\u{1F389}"
@rainbow_symbol = "\u{1F308}"
@cool_emoji = "\u{1F60E}"
@mushroom_emoji = "\u{1F344}"
@aim_symbol = "\u{1F3AF}"

# variables
@sequence_colors = red_color('Red, Blue, Green, Yellow, Black, White, Gray, Orange, Purple, Pink')
@highlight_hint = red_color('hints')

# game conditions

def game_conditions
  puts red_color("#{@aim_symbol} THE MAIN GOAL #{@aim_symbol} is you have 12 turns to guess 4 colors.")
  puts "You have only 10 various colors: #{@sequence_colors}"
  puts "Game will give you #{@highlight_hint} of what color you guessed."
end

# initialize board for storing moves and colors
def initialize_board
  board = Array.new(12, Array.new(4, ''))
  board[0] = %w(green yellow red blue)
  board
end
