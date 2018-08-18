require '../lib/card'

def test_card
  card = Card.new(1, 2)
  if card == nil
    puts "Failed, card is nil"
  end
end

test_card
