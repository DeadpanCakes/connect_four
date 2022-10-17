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

  def gen_graph
    @nodes.each do |node|
      node.above = find_node(node.coords.x, node.coords.y + 1)
      node.below = find_node(node.coords.x, node.coords.y - 1)
      node.left = find_node(node.coords.x - 1, node.coords.y)
      node.right = find_node(node.coords.x + 1, node.coords.y)
    end
  end

  def claimable_nodes
    nodes = []
    x = 0
    while x < 7
      target_column = column(x)
      bottom_node = lowest_unclaimed(target_column)
      nodes << bottom_node
      x += 1
    end
    nodes
  end

  def place_token(node, player)
    node.mark_claimed(player)
  end

  private

  def column(x)
    @nodes.select { |node| node.coords.x == x }.sort do |a, b|
      a.coords.y - b.coords.y
    end
  end

  def lowest_unclaimed(column)
    column.filter { |node| node.owner.nil? }.first
  end

  def find_node(x, y)
    @nodes.find do |node|
      node.coords.x == x && node.coords.y == y
    end
  end
end
