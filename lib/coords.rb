# frozen_string_literal: false

# Tracks positions
class Coords
  attr_reader :x, :y

  def initialize(x, y)
    @x = x
    @y = y
  end
end
