# frozen_string_literal: false

require './lib/coords'

# Stores info of position and owner
class Node
  attr_reader :coords

  def initialize(x, y)
    @coords = Coords.new(x, y)
  end
end
