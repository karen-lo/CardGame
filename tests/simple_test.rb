require '../lib/card.rb'
require '../lib/deck.rb'
require '../lib/hand.rb'

def test_card
  card = Card.new(22)
  if card == nil
    puts "Failed, card is nil"
  end
end

def test_deck
  deck = Deck.new
  deck.print_deck
end

def test_hand
end

test_card
test_deck
