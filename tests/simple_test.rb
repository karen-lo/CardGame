require 'test/unit'

require '../lib/card.rb'
require '../lib/deck.rb'
require '../lib/hand.rb'

class SimpleTests < Test::Unit::TestCase
  def initialize
  end

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

  def test_pass_out_hands(num_hands)
    deck = Deck.new
    hands = deck.pass_out_hands(num_hands)
  
    i = 1
    hands.each do |hand|
      puts "hand #{i}"
      j = 1
    
      hand.each do |card|
        print "#{j}, "
        j += 1
      end
    
      i += 1
      puts
      assert_true(j == 52/num_hands)
    end
  end

  def test_hand
  end
end

simple_tests = SimpleTests.new
#test_card
#test_deck
simple_tests.test_pass_out_hands(4)
