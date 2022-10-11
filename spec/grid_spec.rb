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
  end
end
