require_relative 'colorize_helper'
require_relative 'game_conditions'

class Player

  def initialize(role)
    @role = role.upcase
  end

  def get_colors
    puts ColorizeHelper.yellow_color("#{@role} writes, please, what colors do you have in mind (4 colors, each between 3 and 6 characters)?")
    array_colors = []

    until array_colors.count == 4 && array_colors.all? { |color| color.length.between?(3, 6) }
      colors = gets.downcase.split
      if colors.any? { |color| !GameConditions::SEQUENCE_COLORS.include?(color) }
        puts ColorizeHelper.red_color("Invalid color entered. Let's try again! #{Symbols::RAINBOW_SYMBOL}")
        puts ColorizeHelper.gray_color("Don't forget only #{GameConditions::SEQUENCE_COLORS}")
      elsif colors.any? { |color| !color.length.between?(3, 6) }
        puts ColorizeHelper.red_color("Each color should be between 3 and 6 characters long. Let's try again! #{Symbols::RAINBOW_SYMBOL}")
        puts ColorizeHelper.gray_color("Don't forget only #{GameConditions::SEQUENCE_COLORS}")
      elsif colors.count != 4
        puts ColorizeHelper.red_color("You need to enter exactly 4 colors. Let's try again! #{Symbols::RAINBOW_SYMBOL}")
        puts ColorizeHelper.gray_color("Don't forget only #{GameConditions::SEQUENCE_COLORS}")
      else
        array_colors = colors
      end
    end

    array_colors
  end
end