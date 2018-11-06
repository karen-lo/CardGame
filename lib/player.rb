# /lib/player.rb
# Class definition for a Player

require_relative 'commons'
require_relative 'card'
require_relative 'game_text'
require_relative 'hand'

class Player
  include Commons
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
    puts "What card(s) would you like to play?"
    choice_str = gets
    puts choice_str
    choice = parse_choice(choice_str)
    
  end

  

  def set_hand(hand)
    @hand = Hand.new(hand)
  end

  def to_s
    "Player #{@player_id}"
  end

  private

  def check_play(choice, prev_play) #TODO checks choice
    # check first turn includes lowest card
    # check if first play, else check same number of cards as prev_play
    # check if valid hand if pair or poker hand
    # check if cards will actually beat prev_play
  end

  def parse_choice(choice_str)
    choice_cards = []
    choice_str.split.each do |choice|
      suit = 0, value = 0
      case choice[-1]
      when "d"
        suit = 0
      when "c"
        suit = 1
      when "h"
        suit = 2
      when "s"
        suit = 3
      else
        return nil
      end
      value = choice.to_i
      return nil if value < 1 || value > VALUES.length
      value -= VALUE_OFFSET
      value += VALUES.length if value < 1
      value = (value - 1) * SUITS.length
      choice_cards << Card.new(value + suit)
    end
    choice_cards
  end
end
