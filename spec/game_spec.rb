# frozen_string_literal: false

require './lib/game'
require './lib/player'

describe Game do
  describe '#initialize' do
    it 'calls Player.new twice' do
      expect(Player).to receive(:new).twice
      Game.new
    end
  end
end
