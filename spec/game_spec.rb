# frozen_string_literal: false

require './lib/game'
require './lib/player'
require './lib/grid'

describe Game do
  describe '#initialize' do
    it 'calls Player.new twice' do
      expect(Player).to receive(:new).twice
      Game.new
    end
    it 'calls Grid.new once' do
      expect(Grid).to receive(:new).once
      Game.new
    end
  end
  describe '#find_victor' do
    context 'in an incomplete match' do
      subject(:incomplete_match) { described_class.new }
      it 'returns nil' do
        victor = incomplete_match.find_victor
        expect(victor).to be_nil
      end
    end
    context 'in a complete match' do
      subject(:complete_match) { described_class.new }
      let(:winner) { double(Player) }
      it 'returns the winner when 4 nodes match horizontally' do
        first = complete_match.grid.claimable_nodes[0]
        second = complete_match.grid.claimable_nodes[1]
        third = complete_match.grid.claimable_nodes[2]
        fourth = complete_match.grid.claimable_nodes[3]
        complete_match.grid.place_token(first, winner)
        complete_match.grid.place_token(second, winner)
        complete_match.grid.place_token(third, winner)
        complete_match.grid.place_token(fourth, winner)
        victor = complete_match.find_victor
        expect(victor).to be winner
      end
    end
  end
end
