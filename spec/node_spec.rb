# frozen_string_literal: false

require './lib/node'
require './lib/player'

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
  describe '#mark_claimed' do
    subject(:unowned_node) { described_class.new(3, 5) }
    let(:player) { double(Player) }

    it 'is initially owned by nil' do
      owner = unowned_node.owner
      expect(owner).to be_nil
    end

    it 'changes owner' do
      unowned_node.mark_claimed(player)
      owner = unowned_node.owner
      expect(owner).to equal(player)
    end
  end
  describe 'adjacent nodes' do
    subject(:node) { described_class.new(3, 3) }
    context 'in a fresh node' do
      describe '#above' do
        it 'returns nil' do
          node_above = node.above
          expect(node_above).to be_nil
        end
      end
      describe '#below' do
        it 'returns nil' do
          node_below = node.below
          expect(node_below).to be_nil
        end
      end
      describe '#left' do
        it 'returns nil' do
          left_node = node.left
          expect(left_node).to be_nil
        end
      end
      describe '#right' do
        it 'returns nil' do
          right_node = node.right
          expect(right_node).to be_nil
        end
      end
    end
  end
end
