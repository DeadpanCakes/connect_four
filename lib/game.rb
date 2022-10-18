# frozen_string_literal: false

require './lib/player'

# Sets up Game and managaes flow
class Game
  def initialize
    @players = []
    @players << Player.new(prompt_for_name, 'red')
    @players << Player.new(prompt_for_name, 'yellow')
  end

  private

  def prompt_for_name
    puts 'What Is Your Name?'
  end
end
