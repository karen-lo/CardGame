# card.rb
# Class definition for a Card

class Card
  SUITS = {4 => "Spades", 3 => "Hearts", 2 => "Clubs", 1 => "Diamonds"}
  VALUES = {1 => "Ace", 2 => "Two", 3 => "Three", 4 => "Four", 5 => "Five",
            6 => "Six", 7 => "Seven", 8 => "Eight", 9 => "Nine", 10 => "Ten",
	    11 => "Jack", 12 => "Queen", 13 => "King"}
  
  def initialize(suit, value)
    @suit = suit
    @value = value
  end

  def print_card
    print "#{VALUES[@value]} of #{SUITS[@suit]}"
  end

end

