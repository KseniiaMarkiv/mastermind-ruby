# Project: Mastermind - was performed only on Ruby


#### Next step was performed - Refactoring Process described below

_it’s a game where you have to guess your opponent’s secret code within a certain number of turns (like hangman with colored pegs). Each turn you get some feedback about how good your guess was – whether it was exactly correct or just the correct color but in the wrong space._

---

Welcome to the Color Guessing Game! This interactive game lets players choose to be either a CREATOR or a GUESSER, with the CREATOR selecting a sequence of colors and the GUESSER trying to guess them within 12 turns.

## Table of Contents

- [Installation](#installation)
- [How to Play](#how-to-play)
- [Features](#features)
- [Example](#example)
- [Credits](#credits)
- [Refactoring Process](#refactoring-process)

## Installation

To run this game, you need to have Ruby installed on your machine along with the `colorize` gem. Follow these steps to set up your environment:

1. **Install Ruby**: If you don't have Ruby installed, download it from [here](https://www.ruby-lang.org/en/downloads/).

2. **Install colorize gem**: Run the following command in your terminal:
    ```sh
    gem install colorize
    ```

3. **Clone the repository**:
    ```sh
    git clone <repository-url>
    cd <repository-directory>
    ```

4. **Run the game**:
    ```sh
    ruby main.rb
    ```

## How to Play

1. **Choose Your Role**: At the start of the game, you will be prompted to choose whether you want to be the CREATOR or the GUESSER.
   
2. **CREATOR Chooses Colors**: The CREATOR selects a sequence of 4 colors from the available set of 10 colors.

3. **GUESSER Makes Guesses**: The GUESSER has 12 turns to guess the 4 colors chosen by the CREATOR. After each guess, hints will be provided to help the GUESSER.
   
4. **Hints**: The hints include the colors that have been guessed correctly and their positions.

5. **Winning the Game**: The game ends when the GUESSER guesses all 4 colors correctly or when the 12 turns are exhausted. A message will be displayed indicating the result and the number of moves taken.

## Features

- **Roles**: Players can choose to be either a CREATOR or a GUESSER.
- **Color Selection**: CREATOR selects 4 colors from a set of 10.
- **Guessing**: GUESSER has 12 turns to guess the correct sequence.
- **Hints**: Feedback provided after each guess to assist the GUESSER.
- **Replayability**: Option to play the game again after it ends.

## Example

Here is a snippet of how the game might look during play:

![alt text](https://github.com/KseniiaMarkiv/mastermind-ruby/blob/main/example_game_output.png?raw=true)

## Credits

This game was created using Ruby and the `colorize` gem. Special thanks to the developers of these tools for making this project possible.

----------------------------------------------------------------

## Refactoring Process

To improve the maintainability and scalability of the game, we refactored the single file into multiple files following Object-Oriented Programming (OOP) principles. Here’s a brief overview of the steps taken and the role of each file:

1. **colorize_helper.rb**
    - Created a module `ColorizeHelper` that contains methods for colorizing strings using the `colorize` gem.
    - This module makes it reusable across different classes.

2. **symbols.rb**
    - Defined a module `Symbols` that includes all the special symbols and emojis used in the game.
    - This ensures that symbols are managed in one place and can be easily modified if needed.

3. **game_conditions.rb**
    - Created a class `GameConditions` responsible for displaying the initial game conditions and rules.
    - Utilizes the `ColorizeHelper` and `Symbols` modules for formatting output.

4. **player.rb**
    - Created a class `Player` that handles the input and validation of colors for both the CREATOR and GUESSER roles.
    - This class ensures that each player’s actions are encapsulated and managed separately.

5. **game.rb**
    - Created a class `Game` that encapsulates the main game logic, including initialization, game flow, turn management, and win/loss conditions.
    - Uses the `ColorizeHelper`, `GameConditions`, and `Player` classes to facilitate interactions and game mechanics.

6. **main.rb**
    - The entry point of the game, responsible for starting the game.
    - Creates an instance of the `Game` class and calls the `play` method to begin the game.

### Summary of Changes

- **Separation of Concerns**: Each file has a specific responsibility, improving code organization and readability.
- **Modularity**: Code is divided into reusable modules and classes, making it easier to maintain and extend.
- **Encapsulation**: Game logic is encapsulated within classes, promoting a clear structure and reducing dependencies.

This refactoring process ensures that the game follows OOP principles, making it more maintainable, scalable, and easier to understand. 

By modularizing the code, each component can be independently developed, tested, and debugged, resulting in a more robust and flexible application.
