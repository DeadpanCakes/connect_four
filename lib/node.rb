# frozen_string_literal: false

require './lib/coords'

# Stores info of position and owner
class Node
  attr_reader :coords, :owner

  def initialize(x, y)
    @coords = Coords.new(x, y)
    @owner = nil
  end

  def mark_claimed(player)
    @owner = player
  end
end
