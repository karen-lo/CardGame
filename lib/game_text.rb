# /lib/game_text.rb
# Module of game text

module GameText
  INSTR_FOR_CARD_PICKING = %q{
    Choose a card by typing [value][suit initial]. 
    For example, 
      - Three of Diamonds -> 3d
      - King of Spades    -> 13s
      - Ace of Hearts     -> 1h
    Seperate multiple cards with a space.
  }
end