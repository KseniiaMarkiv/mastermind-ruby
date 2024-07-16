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
  puts
end

# assign color positions to both CREATOR
def creator_assign
  puts yellow_color('CREATOR writes, pls, what colors do you have in mind? (4 colors)')
    array_colors = []

    until array_colors.count == 4 && array_colors.all? { |color| color.length.between?(3, 6) }
      colors = gets.downcase.split
      if colors.any? { |color| !color.length.between?(3, 6) }
        puts red_color("Each color should be between 3 and 6 characters long. Let's try again! #{@rainbow_symbol}")
        puts gray_color("Don't forget only #{@sequence_colors}")
      elsif colors.count != 4
        puts red_color("You need to enter exactly 4 colors. Let's try again! #{@rainbow_symbol}")
      else
        array_colors = colors
      end
    end
    array_colors
end

# initialize board for storing moves and colors
def initialize_board
  board = Array.new(12, Array.new(4, ''))
  board[0] = creator_assign
  board
end

def choose_position 
  puts blue_color('Which one do you choose: be Creator/c or be Guesser/g?')
  gets.chomp.upcase
end

def current_players(position)
  players = {
    'GUESSER' => { full_name: 'GUESSER', short_name: 'G' },
    'G' => { full_name: 'GUESSER', short_name: 'G' },
    'CREATOR' => { full_name: 'CREATOR', short_name: 'C' },
    'C' => { full_name: 'CREATOR', short_name: 'C' }
  }

  until players.key?(position)
    puts red_color("Invalid input. Please enter a valid string of guesser or g, creator or c \u{1f344}")
    position = gets.chomp.upcase
  end

  players[position][:full_name]
end

def whos_action
  player = current_players(choose_position)

  if player == 'CREATOR'
    puts green_color('Congrats, you have chosen to be the CREATOR')
  elsif player == 'GUESSER'
    puts green_color('Congrats, you have chosen to be the GUESSER')
  else
    puts red_color('Invalid input. Which one do you choose: be Creator/c or be Guesser/g?')
  end
end

# assign color positions to GUESSER
def guesser_assign
  puts yellow_color('GUESSER writes, pls, what colors do you have in mind (4 colors)?')
  array_colors = []

  until array_colors.count == 4 && array_colors.all? { |color| color.length.between?(3, 6) }
    colors = gets.downcase.split
    if colors.any? { |color| !color.length.between?(3, 6) }
      puts red_color("Each color should be between 3 and 6 characters long. Let's try again! #{@rainbow_symbol}")
      puts gray_color("Don't forget only #{@sequence_colors}")
      puts
    elsif colors.count != 4
      puts red_color("You need to enter exactly 4 colors. Let's try again! #{@rainbow_symbol}")
    else
      array_colors = colors
    end
  end
  puts green_color("Your colors are #{array_colors}")
  array_colors
end

# assign each turn in board
def store_colors(board, colors, turn)
  # Assign colors to Array
  board[turn] = colors
  board
end

# Check if guessed colors are correct
def correct_guess?(board, turn)
  board[turn] == board[0]
end

# Provide feedback on the guessed colors
def feedback(board, turn)
  correct_positions = board[turn].each_index.select { |i| board[turn][i] == board[0][i] }
  correct_positions.map! { |index| "##{index + 1}" }
  correct_positions
end

def play_game
  game_conditions
  whos_action
  board = initialize_board
  guess_turn = 1

  loop do
    puts
    puts "Turn #{guess_turn}:"
    save_colors = guesser_assign
    store_colors(board, save_colors, guess_turn)
    
    if correct_guess?(board, guess_turn)
      puts green_color("Congrats, you are the winner and you only needed #{guess_turn} moves #{@aim_symbol}")
      break
    else
      correct_positions = feedback(board, guess_turn)
      if correct_positions.empty?
        puts red_color('Better luck next time! Keep guessing...')
      else
        puts yellow_color("You were guessing color/s by #{correct_positions}")
      end
      
      guess_turn += 1
      if guess_turn > 12
        puts 'Out of turns! Game over.'
        play_again
        break
      end
    end
  end
end

def play_again
  loop do
    puts 'Play again?'
    answer = gets.chomp.downcase

    case answer
    when 'yes', 'y'
      play_game
      break
    when 'no', 'n'
      puts green_color("Thank you for playing! #{@cool_emoji}")
      break
    else  
      puts red_color("Invalid choice. Please choose yes/y or no/n #{@mushroom_emoji}")
    end  
  end
end

# in this way you can check your implemented program
play_game

=begin
I need to do:
  - DRY methods
=end