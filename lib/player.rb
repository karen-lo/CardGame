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

  def play_cards(prev_play)
    # puts "#{self.to_s}'s turn"
    # puts "This is your hand:"
    # puts @hand.to_s
    # puts INSTR_FOR_CARD_PICKING
    # puts "What card(s) would you like to play?"
    choice = nil
    loop do
      choice_str = gets
      choice = parse_choice(choice_str)
      if choice == nil
        puts "Please pick card(s) again with proper syntax."
        puts INSTR_FOR_CARD_PICKING
        next
      end
      if !check_play(choice, prev_play)
        puts "Please pick card(s) again with proper syntax."
        puts INSTR_FOR_CARD_PICKING
        next
      end
      break
    end
      @hand.remove_cards(choice)
    choice
  end

  def set_hand(hand)
    @hand = Hand.new(hand)
  end

  def to_s
    "Player #{@player_id}"
  end

  private

  def check_play(choice, prev_play) #TODO checks choice
    # check that cards are in player's hand
    choice.each do |card|
      return false if !@hand.has_card?(card)
    end
    # check first turn includes lowest card
    # check if first play, else check same number of cards as prev_play
    # check if valid hand if pair or poker hand
    # check if cards will actually beat prev_play
    return true
  end

  def parse_choice(choice_str)
    choice_cards = []
    choice_str.split.each do |choice|
      if choice.length > 3 || choice.length < 2
        puts "Syntax error for '#{choice}'."
        return nil
      end

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
        puts "Syntax error for '#{choice}'"
        puts "Suit, #{choice[-1]},  is not a valid suit."
        return nil
      end
      
      value = choice.chop
      if !value.match(/\d/)
        puts "Syntax error for '#{choice}'."
        puts "Value, '#{value}', is not only numerics."
        return nil
      end

      value = value.to_i
      if value < 1 || value > VALUES.length
        puts "Syntax error for '#{choice}'"
        puts "Value is not valid."
        return nil 
      end
      value -= VALUE_OFFSET
      value += VALUES.length if value < 1
      value = (value - 1) * SUITS.length
      choice_cards << Card.new(value + suit)
    end
    choice_cards
  end
end
