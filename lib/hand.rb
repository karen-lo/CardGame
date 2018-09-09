# hand.rb
# Class definition for a Hand

require_relative 'card'

class Hand
  
  attr_accessor :num_cards

  def initialize(cards)
    @cards = cards
    @num_cards = cards.length
  end

  def to_s
    string = "{ "
    i = 0
    
    @cards.each do |card|
      string << "[#{card.to_s}]"
      string << ", " if i < @num_cards-1
      i += 1
    end
    
    string << " }\n"
  end

  def has_card(card)
    @cards.include?(card)
  end
end
