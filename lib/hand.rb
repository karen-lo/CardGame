# /lib/hand.rb
# Class definition for a Hand

require_relative 'card'

class Hand
  
  attr_accessor :cards, :num_cards

  def initialize(cards)
    @cards = cards
    @num_cards = cards.length
  end

  def to_s
    string = "{ "
    
    @cards.each_with_index do |card, i|
      string << "[#{card.to_s}]"
      string << ", " if i < @num_cards-1
    end
    
    string << " }\n"
  end

  def has_card(card)
    @cards.include?(card)
  end
end
