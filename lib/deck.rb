# deck.rb
# Class definition for a Deck

require_relative 'card'

class Deck
  def initialize(numCards = 52)
    @numCards = numCards
    @deck = []
    make_deck
  end

  def print_deck
    @deck.each do |card|
      print "#{card.print_card}, "
    end
  end

  def make_deck
    (1..4).each do |suit|
      (1..13).each do |value|
        @deck << Card.new(suit, value)
      end
    end
  end

end
