# frozen_string_literal: false

require 'securerandom'

# Stores basic player info
class Player
  attr_reader :name, :color, :id

  def initialize(name, color)
    @name = name
    @color = color
    @id = gen_id
  end

  private

  def gen_id
    SecureRandom.uuid
  end
end
