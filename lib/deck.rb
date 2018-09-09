# /lib/deck.rb
# Class definition for a Deck

require_relative 'card'
require_relative 'commons'

class Deck
  extend Commons
  
  attr_accessor :num_cards
  
  def initialize(num_cards = 52)
    @num_cards = num_cards
    @deck = []
    make_deck
  end

  def to_s
    string = ""

    @deck.each_with_index do |card, i|
      string << "[#{card.to_s}]"
      string << ", " if i < @num_cards-1
    end
    
    string << "\n"
  end

  def shuffle_deck
    @deck.shuffle!
  end

  def pass_out_hands(num_hands)
    if num_hands > 4
      raise 'Cannot pass out more than 4 hands.'
    elsif num_hands == 2
      num_hands = 3
    elsif num_hands < 2
      raise 'Cannot pass out less than 2 hands.'
    end
    
    hands = []
    num_hands.times do
      hands << []
    end
    
    i = 0
    hand_with_3d = nil
    hand_with_3c = nil
    @deck.each_with_index do |card, j|
      if j == @num_cards-1 && num_hands == 3
        if card.to_s.eql?(Card.new(Commons::THREE_OF_DIAMONDS).to_s)
          hands[hand_with_3c] << card
	else
	  hands[hand_with_3d] << card
	end

      else
        if i == num_hands
          i = 0
        end

        if card.to_s.eql?(Card.new(Commons::THREE_OF_DIAMONDS).to_s)
	  hand_with_3d = i
	end

        if card.to_s.eql?(Card.new(Commons::THREE_OF_CLUBS).to_s)
	  hand_with_3c = i
	end

        hands[i] << card
        i += 1
      end
    end

    return hands
  end

  private

  def make_deck
    @num_cards.times do |i|
      @deck << Card.new(i)
    end
  end

end
