# /lib/commons.rb
# Module of common items used across classes

module Commons
  
  SUITS   = {1 => "Diamonds", 2 => "Clubs", 3 => "Hearts", 4 => "Spades"}
  VALUES  = {1 => "Three", 2 => "Four", 3 => "Five", 4 => "Six", 5 => "Seven",
             6 => "Eight", 7 => "Nine", 8 => "Ten", 9 => "Jack", 10 => "Queen",
             11 => "King", 12 => "Ace", 13 => "Two"}

  THREE_OF_DIAMONDS     = 0
  THREE_OF_CLUBS        = 1
  VALUE_OFFSET          = 2
end
