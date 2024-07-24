# Project: Mastermind - was performed only on Ruby


#### Next step was performed: 
#### $${\color{gray} \space the \space divided \space project \space by \space OOP \space rules, \space using \space classes, \space modules, \space and \space separate \space files \space in \space oop \space branch}$$  <br>  [![](https://img.shields.io/badge/Click_me_&#10138;-brightgreen?style=for-the-badge)](https://github.com/KseniiaMarkiv/mastermind-ruby/tree/oop)

_it’s a game where you have to guess your opponent’s secret code within a certain number of turns (like hangman with colored pegs). Each turn you get some feedback about how good your guess was – whether it was exactly correct or just the correct color but in the wrong space._


**mastermind-two-pl-ruby.rb** - it's a file that was implemented in a way where you can choose who you wanna be CREATOR or GUESSER. And later that depends on what you should do.

**mastermind-ruby.rb** - it is a more easy way where colors are already defined, and you need to only guess its 

---

Welcome to the Color Guessing Game! This interactive game lets players choose to be either a CREATOR or a GUESSER, with the CREATOR selecting a sequence of colors and the GUESSER trying to guess them within 12 turns.

## Table of Contents

- [Installation](#installation)
- [How to Play](#how-to-play)
- [Features](#features)
- [Example](#example)
- [Credits](#credits)

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
    ruby <filename>.rb
    ```

## How to Play

1. **Choose Your Role**: At the start of the game, you will be prompted to choose whether you want to be the CREATOR or the GUESSER.
in **mastermind-ruby.rb** version you don't need to choose a role, cuz colors are present by default
   
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

