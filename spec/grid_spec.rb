# frozen_string_literal: false

require './lib/grid'
require './lib/node'
require './lib/player'

describe Grid do
  describe '#gen_nodes' do
    subject(:empty_grid) { described_class.new }
    it 'returns an array of 42 nodes' do
      grid = empty_grid.gen_nodes
      expect(grid.length).to eq(42)
    end
    it 'returns an array of 42 nodes with unique coords' do
      init_grid = empty_grid.gen_nodes
      uniq_grid = init_grid.uniq
      generated_grid_is_uniq = uniq_grid == init_grid
      expect(generated_grid_is_uniq).to be true
    end
  end
  describe '#gen_graph' do
    subject(:graphed_grid) { described_class.new }
    before(:each) do
      graphed_grid.gen_nodes
      graphed_grid.gen_graph
    end
    context 'in a central node' do
      it 'makes adjacent methods return a node' do
        central_node = graphed_grid.nodes[20]
        adjacent_node = central_node.right
        expect(adjacent_node).to be_kind_of(Node)
      end
      it 'makes the right method return a node whose x coordinate is 1 greater' do
        central_node = graphed_grid.nodes[20]
        central_node_coords = central_node.coords
        adjacent_node = central_node.right
        adjacent_node_coords = adjacent_node.coords
        expect(adjacent_node_coords.x).to eq(central_node_coords.x + 1)
      end
      it 'makes the left method return a node whose x coordinate is 1 lesser' do
        central_node = graphed_grid.nodes[20]
        central_node_coords = central_node.coords
        adjacent_node = central_node.left
        adjacent_node_coords = adjacent_node.coords
        expect(adjacent_node_coords.x).to eq(central_node_coords.x - 1)
      end
      it 'makes the above method return a node whose y coordinate is 1 greater' do
        central_node = graphed_grid.nodes[20]
        central_node_coords = central_node.coords
        adjacent_node = central_node.above
        adjacent_node_coords = adjacent_node.coords
        expect(adjacent_node_coords.y).to eq(central_node_coords.y + 1)
      end
      it 'makes the below method return a node whose y coordinate is 1 lesser' do
        central_node = graphed_grid.nodes[20]
        central_node_coords = central_node.coords
        adjacent_node = central_node.below
        adjacent_node_coords = adjacent_node.coords
        expect(adjacent_node_coords.y).to eq(central_node_coords.y - 1)
      end
    end
    context 'in an edge node' do
      it 'makes adjacent methods return nil when adjacent node does not exist' do
        bottom_left = graphed_grid.nodes.first
        nonexistant_node = bottom_left.left
        expect(nonexistant_node).to be_nil
      end
    end
  end
  describe '#place_token' do
    subject(:unclaimed_grid) { described_class.new }
    let(:node) { double(Node) }
    let(:player) { double(Player) }
    it 'sends a signal to target node to mark itself as claimed' do
      allow(node).to receive(:mark_claimed)
      expect(node).to receive(:mark_claimed).once
      unclaimed_grid.place_token(node, player)
    end
  end
  describe '#claimable_nodes' do
    context 'in a newly created grid' do
      subject(:new_grid) { described_class.new }
      it 'returns an array' do
        claimable_nodes = new_grid.claimable_nodes
        data_type = claimable_nodes.class
        expect(data_type).to be Array
      end

      it 'returns an array with length of 7 in a new grid' do
        claimable_nodes = new_grid.claimable_nodes
        expect(claimable_nodes.length).to eq(7)
      end

      it 'returns an array of nodes' do
        claimable_nodes = new_grid.claimable_nodes
        all_elements_are_nodes = claimable_nodes.all? { |node| node.instance_of?(Node) }
        expect(all_elements_are_nodes).to be true
      end

      it 'returns nodes whose y value is 0' do
        claimable_nodes = new_grid.claimable_nodes
        all_nodes_y_equals_zero = claimable_nodes.all? { |node| node.coords.y.zero? }
        expect(all_nodes_y_equals_zero).to be true
      end
      it 'returns nodes whose x values are all uniq' do
        claimable_nodes = new_grid.claimable_nodes
        uniq_x_values = claimable_nodes.map { |node| node.coords.x }
        all_nodes_x_uniq = claimable_nodes.length == uniq_x_values.length
        expect(all_nodes_x_uniq).to be true
      end
    end
  end
end
