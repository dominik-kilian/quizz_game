require_relative './quizz/game'
require 'colorize'
require_relative './infra/printer'

Infra::Printer.welcome "WELCOME TO QUIZZ GAME"

game = Quizz::Game.new
game.play