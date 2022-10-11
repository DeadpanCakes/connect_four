# frozen_string_literal: false

require './lib/player'

describe Player do
  describe '#initialize' do
    subject(:player_with_id) { described_class.new('ANT', 'pink') }
    it 'calls the gen_id method to set id' do
      player_id = player_with_id.id
      expect(player_id).not_to be_nil
    end
  end
end
