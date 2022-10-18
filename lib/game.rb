# frozen_string_literal: false

require './lib/player'
require './lib/grid'

# Sets up Game and managaes flow
class Game
  def initialize
    @players = []
    populate_players
    @grid = Grid.new
  end

  private

  def populate_players
    puts 'Player 1'
    @players << Player.new(prompt_for_name, 'red')
    puts 'Player 2'
    @players << Player.new(prompt_for_name, 'yellow')
  end

  def prompt_for_name
    puts 'What Is Your Name?'
  end
end
