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

# all constants of symbols
CELEBRATION_SYMBOL = "\u{1F389}"
RAINBOW_SYMBOL = "\u{1F308}"
COOL_EMOJI = "\u{1F60E}"
MUSHROOM_EMOJI = "\u{1F344}"
AIM_SYMBOL = "\u{1F3AF}"

SEQUENCE_COLORS = red_color('Red, Blue, Green, Yellow, Black, White, Gray, Orange, Purple, Pink'.downcase)
HIGHLIGHT_HINT = red_color('hints')

# game conditions
def game_conditions
  puts red_color("#{AIM_SYMBOL} THE MAIN GOAL #{AIM_SYMBOL} is you have 12 turns to guess 4 colors.")
  puts "You have only 10 various colors: #{SEQUENCE_COLORS}"
  puts "Game will give you #{HIGHLIGHT_HINT} of what color you guessed."
end

# initialize board for storing moves and default colors
def initialize_board
  board = Array.new(12, Array.new(4, ''))
  board[0] = %w(green yellow red blue)
  board
end

