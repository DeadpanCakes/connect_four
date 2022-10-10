# frozen_string_literal: false

# Stores info of position and owner
class Node
  attr_reader :coords

  def initialize(x, y)
    @coords = Coords.new(x, y)
  end
end

class Coords
  attr_reader :x, :y

  def initialize(x, y)
    @x = x
    @y = y
  end
end
