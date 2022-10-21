# frozen_string_literal: false

require './lib/player'
require './lib/grid'

# Sets up Game and managaes flow
class Game
  attr_reader :grid

  def initialize
    @players = []
    populate_players
    @grid = Grid.new
    @turn = 1
  end

  def find_victor
    graphed_nodes = @grid.gen_graph
    claimed_nodes = graphed_nodes.reject { |node| node.owner.nil? }
    winning_node = claimed_nodes.find { |node| find_four_horizontal(node) || find_four_vertical(node) }
    return winning_node.owner if winning_node
  end

  private

  def find_four_vertical(node)
    nodes = column(node)

    node if nodes.length == 4 && nodes.all? { |n| n.owner == node.owner }
  end

  def find_four_horizontal(node)
    nodes = row(node)

    node if nodes.length == 4 && nodes.all? { |n| n.owner == node.owner }
  end

  def row(node)
    curr_node = node
    nodes = [node]
    until curr_node.right.nil? || nodes.length == 4
      curr_node = curr_node.right
      nodes << curr_node
    end
    nodes
  end

  def column(node)
    curr_node = node
    nodes = [node]
    until curr_node.below.nil? || nodes.length == 4
      curr_node = curr_node.below
      nodes << curr_node
    end
    nodes
  end

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
