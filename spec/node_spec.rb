# frozen_string_literal: false

require './lib/node'

describe Node do
  describe '#coords' do
    subject(:placed_node) { described_class.new(3, 5) }

    it 'returns an object with x coords' do
      coords = placed_node.coords
      x = coords.x
      expect(x).to eq(3)
    end

    it 'returns an object with y coords' do
      coords = placed_node.coords
      y = coords.y
      expect(y).to eq(5)
    end
  end
end
