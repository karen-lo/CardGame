require '../lib/card'
require '../lib/deck'

def test_card
  card = Card.new(1, 2)
  if card == nil
    puts "Failed, card is nil"
  end
end

def test_deck
  deck = Deck.new
  deck.make_deck
  deck.print_deck
end

test_card
test_deck
