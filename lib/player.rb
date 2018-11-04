# /lib/player.rb
# Class definition for a Player

require_relative 'game_text'
require_relative 'hand'

class Player
  include GameText
  
  attr_accessor :hand, :player_id
  
  def initialize(player_id)
    @player_id = player_id
  end

  def choose_play
    puts "#{self.to_s}'s turn"
    puts "This is your hand:"
    puts @hand.to_s
    puts INSTR_FOR_CARD_PICKING
    puts "What card(s) you like to play?"
    choice_str = gets
    
  end

  def play(choice, prev_play) #TODO checks choice
    # check first turn includes lowest card
    # check if first play, else check same number of cards as prev_play
    # check if valid hand if pair or poker hand
    # check if cards will actually beat prev_play
  end

  def set_hand(hand)
    @hand = Hand.new(hand)
  end

  def to_s
    print "Player #{@player_id}"
  end
end
