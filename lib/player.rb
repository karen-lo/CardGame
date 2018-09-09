# /lib/player.rb
# Class definition for a Player

require_relative 'hand'

class Player
  
  attr_accessor :player_id

  def initialize(player_id)
    @player_id = player_id
  end

  def set_hand(hand)
    @hand = hand
  end

end
