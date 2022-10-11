# frozen_string_literal: false

require './lib/node'

# Tracks and manages the game grid
class Grid
  def gen_nodes
    nodes = []
    x = 0
    y = 0
    while x < 7
      while y < 6
        nodes << Node.new(x, y)
        y += 1
      end
      x += 1
      y = 0
    end
    nodes
  end
end
