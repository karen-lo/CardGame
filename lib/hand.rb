# hand.rb
# Class definition for a Hand

require_relative 'card'

class Hand
  def initialize(cards)
    @cards = cards
  end

  def has_card(card)
    @cards.include?(card)
  end
end
