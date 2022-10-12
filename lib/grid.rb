# frozen_string_literal: false

require './lib/node'

# Tracks and manages the game grid
class Grid
  attr_reader :nodes

  def initialize
    @nodes = gen_nodes
  end

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

  def claimable_nodes
    nodes = []
    x = 0
    while x < 7
      bottom_node = column(x).first
      nodes << bottom_node
      x += 1
    end
    nodes
  end

  private

  def column(x)
    @nodes.select { |node| node.coords.x == x }.sort do |a, b|
      a.coords.y - b.coords.y
    end
  end
end
