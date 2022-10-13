# frozen_string_literal: false

require './lib/coords'

# Stores info of position and owner
class Node
  attr_reader :coords, :owner
  attr_accessor :above, :below, :left, :right

  def initialize(x, y)
    @coords = Coords.new(x, y)
    @owner = nil
    @above = nil
    @below = nil
    @left = nil
    @right = nil
  end

  def mark_claimed(player)
    @owner = player
  end
end
