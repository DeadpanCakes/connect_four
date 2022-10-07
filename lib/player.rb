# frozen_string_literal: false

# Stores basic player info
class Player
  attr_reader :name, :color

  def initialize(name, color)
    @name = name
    @color = color
  end
end
