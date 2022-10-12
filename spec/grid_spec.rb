# frozen_string_literal: false

require './lib/grid'
require './lib/node'

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
  describe '#claimable_nodes' do
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
  end
end
