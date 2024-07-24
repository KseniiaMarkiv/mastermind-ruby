require_relative 'colorize_helper'
require_relative 'game_conditions'
require_relative 'player'

class Game
  include ColorizeHelper

  def initialize
    @board = Array.new(12) { Array.new(4, '') }
    @creator_colors = []
    @turns = 12
    @guess_turn = 1
  end

  def play_game
    game = GameConditions.new
    game.game_conditions
    whos_action
    @creator_colors = Player.new('CREATOR').get_colors
    @board[0] = @creator_colors

    loop do
      puts
      puts "Turn #{@guess_turn}:"
      guesser_colors = Player.new('GUESSER').get_colors
      store_colors(guesser_colors)

      if correct_guess?
        puts ColorizeHelper.green_color("Congrats, you are the winner and you only needed #{@guess_turn} moves #{Symbols::AIM_SYMBOL}")
        break
      else
        provide_feedback
        @guess_turn += 1
        if @guess_turn > @turns
          puts 'Out of turns! Game over.'
          play_again
          break
        end
      end
    end
  end

  private 

  def store_colors(colors)
    @board[@guess_turn] = colors
  end

  def correct_guess?
    @board[@guess_turn] == @creator_colors
  end

  def provide_feedback
    correct_positions = @board[@guess_turn].each_index.select { |i| @board[@guess_turn][i] == @creator_colors[i] }
    correct_positions.map! { |index| "##{index + 1}" }

    if correct_positions.empty?
      puts ColorizeHelper.red_color('Better luck next time! Keep guessing...')
    else
      puts ColorizeHelper.yellow_color("You were guessing color/s by #{correct_positions.join(', ')}")
    end
  end

  def whos_action
    player = current_players(choose_position)

    if player == 'CREATOR'
      puts ColorizeHelper.green_color('Congrats, you have chosen to be the CREATOR')
    elsif player == 'GUESSER'
      puts ColorizeHelper.green_color('Congrats, you have chosen to be the GUESSER')
    else
      puts ColorizeHelper.red_color('Invalid input. Which one do you choose: be Creator/c or be Guesser/g?')
    end
  end

  def choose_position
    puts ColorizeHelper.blue_color('Which one do you choose: be Creator/c or be Guesser/g?')
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
      puts ColorizeHelper.red_color("Invalid input. Please enter a valid string of guesser or g, creator or c #{Symbols::MUSHROOM_EMOJI}")
      position = gets.chomp.upcase
    end

    players[position][:full_name]
  end

  def play_again
    loop do
      puts 'Play again?'
      answer = gets.chomp.downcase

      case answer
      when 'yes', 'y'
        Game.new.play_game
        break
      when 'no', 'n'
        puts ColorizeHelper.green_color("Thank you for playing! #{Symbols::COOL_EMOJI}")
        break
      else
        puts ColorizeHelper.red_color("Invalid choice. Please choose yes/y or no/n #{Symbols::MUSHROOM_EMOJI}")
      end
    end
  end
end
