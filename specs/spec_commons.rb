# /spec/spec_commons.rb
# Module of common items to used for specs

module SpecCommons
  
  SUITS   = {1 => "Diamonds", 2 => "Clubs", 3 => "Hearts", 4 => "Spades"}
  VALUES  = {1 => "Three", 2 => "Four", 3 => "Five", 4 => "Six", 5 => "Seven",
             6 => "Eight", 7 => "Nine", 8 => "Ten", 9 => "Jack", 10 => "Queen",
             11 => "King", 12 => "Ace", 13 => "Two"}

  DECK_SIZE             = 52
  DEFAULT_NUM_PLAYERS   = 3
  THREE_OF_DIAMONDS     = 0
  VALUE_OFFSET          = 2

  def SpecCommons.card_array_to_s(card_array)
    string = "["
    card_array.each_with_index do |card, i|
      string += card.to_s
      string += ", " if i != card_array.length-1
    end
    string += "]"
  end

end