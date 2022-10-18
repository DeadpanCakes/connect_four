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
end
