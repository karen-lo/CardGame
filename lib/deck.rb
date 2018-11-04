# /lib/deck.rb
# Class definition for a Deck

require_relative 'card'
require_relative 'commons'

class Deck
  include Commons
  
  attr_accessor :num_cards
  
  def initialize(num_cards = 52)
    @deck = []
    @num_cards = num_cards
    make_deck
  end

  # Parameter: number of hands
  # If num_hands == 4, 4 hands will be passed out
  # If num_hands == 3 or 2, 3 hands will be passed out
  # Otherwise, error
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
        if card.order == THREE_OF_DIAMONDS
          hands[hand_with_3c] << card
        else
          hands[hand_with_3d] << card
        end

      else
        if i == num_hands
          i = 0
        end
        if card.order == THREE_OF_DIAMONDS
          hand_with_3d = i
        end
        if card.order == THREE_OF_CLUBS
          hand_with_3c = i
        end
        hands[i] << card
        i += 1
      end
    end

    return hands
  end

  def shuffle_deck
    @deck.shuffle!
  end

  def to_s
    string = ""

    @deck.each_with_index do |card, i|
      string << "[#{card.to_s}]"
      string << ", " if i < @num_cards-1
    end
    
    string << "\n"
  end

  private

  def make_deck
    @num_cards.times do |i|
      @deck << Card.new(i)
    end
  end

end
